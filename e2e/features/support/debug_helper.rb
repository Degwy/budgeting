
########################################################################################################################
##  When
########################################################################################################################
When /^[I ]*wait [for ]*(\d+) seconds?$/ do |seconds|
  sleep(seconds.to_i)
end

When /^[I ]*pause$/ do
  pause
end


########################################################################################################################
##  Methods
########################################################################################################################
def pause
  print 'Press Return to continue...'
  STDIN.getc
end



