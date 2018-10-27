########################################################################################################################
##  Given
########################################################################################################################
Given /^[I ]*fill "([^"]*)" category with value "([^"]*)\$"$/ do |category, value|
  select category, from: 'categoryId'
  fill_in 'description', with: Faker::Dessert.variety
  fill_in 'value', with: value
end

Given /^[I ]*am adding the following records$/ do |table|
  @categories = table.hashes
  table.hashes.each do |hash|
    step %Q{I fill "#{hash['category']}" category with value "#{hash['value']}$"}
    step %Q{I click on "Add" button}
  end
end

########################################################################################################################
##  When
########################################################################################################################

When /^[I ]*calculate Working Balance equation$/ do
  @balance = @tot_inflow + @tot_outflow
  @balance = '%.2f' % @balance
end

########################################################################################################################
##  Then
########################################################################################################################

Then /^"([^"]*)" category "(should|should not)" be added and having the value "([^"]*)\$"$/ do |category, vision, value|
  inflow_categories = ['Income']
  puts "test #{value.to_f} test"
  sign = '-' unless (inflow_categories.include? category) || (value.to_f == 0.0)
  selector = "//DIV[text()='#{category}']/../..//DIV[text()='#{sign}$#{value}']"
  expect(page.has_selector? selector).to eq(vision == 'should')
end

Then /^the calculation should be correct$/ do
  @tot_inflow = @tot_inflow.to_s.split('.')[0].to_s.reverse.gsub(/(\d{3})(?=\d)/, '\\1,').reverse.concat('.').concat(@tot_inflow.to_s.split('.')[1])

  @tot_outflow = @tot_outflow.to_s.split('.')[0].to_s.reverse.gsub(/(\d{3})(?=\d)/, '\\1,').reverse.concat('.').concat(@tot_outflow.to_s.split('.')[1])

  @balance = @balance.to_s.split('.')[0].to_s.reverse.gsub(/(\d{3})(?=\d)/, '\\1,').reverse.concat('.').concat(@balance.to_s.split('.')[1])

  eq_params = {'Total Inflow' => @tot_inflow, 'Total Outflow' => @tot_outflow, 'Working Balance' => @balance}
  errors = []
    eq_params.each do |param, value|
      begin
        value = value.gsub('-','') unless param == 'Working Balance'
        expected_value = (value =~ /\-/ ? "-$#{value.gsub('-', '')}" : "$#{value}")

        selector = "//div[text()='#{param}']/preceding-sibling::div"
        expect((first selector).text).to eq expected_value
      rescue RSpec::Expectations::ExpectationNotMetError
        errors << "Expected to see #{param} = #{expected_value} but got #{(first selector).text}"
      end
    end
  expect(errors).to eq []
end

Then /^Inflow and Outflow values should be correct$/ do
  flows = {'Inflow' => @tot_inflow, 'Outflow' => @tot_outflow.gsub('-','')}
  errors = []
  flows.each do |key, value|
    begin
      element = first "//*[text()='#{key.upcase}']/following-sibling::*[@fill][1]"
      expect(element.text).to eq "$#{value}"
    rescue RSpec::Expectations::ExpectationNotMetError
      errors << "Expected that #{key} = $#{value} but got #{element.text}"
    end
  end
  expect(errors).to eq []
end

Then /^all Outflow categories should have correct amounts$/ do
  errors = []
  @outflow_categories = @categories.reject { |hash| hash['category'] == 'Income'}
  @outflow_categories.each do |hash|
    begin
      element = first "//li/*[text()='#{hash['category']}']/following-sibling::*[@class][1]"
      expect(element.text).to eq "$#{hash['value']}"
    rescue RSpec::Expectations::ExpectationNotMetError
      errors << "Expected that #{hash['category']} = $#{hash['value']} but got #{element.text}"
    end
  end
  raise "These errors were found:\n\t#{errors.join("\n\t")}" if errors.count > 0
end


########################################################################################################################
##  And
########################################################################################################################
And /^[I ]*collect total "(Inflow|Outflow)" amounts$/ do |flow|
  all_amounts = all("//div[text()='Amount']/following-sibling::div").collect(&:text)
  all_amounts = all_amounts.map { |amount| amount.gsub('$', '').gsub(',','')}

  if flow == 'Inflow'
    tot_inflow = all_amounts.reject { |amount| amount.include? '-'}
    tot_inflow = tot_inflow.map { |amount| amount.to_f}
    @tot_inflow = tot_inflow.inject(0) { |sum, x| sum + x }
  else
    tot_outflow = all_amounts.select { |amount| amount.include? '-'}
    tot_outflow = tot_outflow.map { |amount| amount.to_f}
    @tot_outflow = tot_outflow.inject(0) { |sum, x| sum + x }
  end
end
