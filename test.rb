load 'HeadOfHousehold.rb'
load 'MarriedFilingSeparately.rb'
load 'MarriedOrWidow.rb'
load 'Single.rb'


puts "Enter 1 for Single"
puts "Enter 2 for Married Filing Jointly or Qualifying Widow(er)"
puts "Enter 3 for Married Filing Separately"
puts "Enter 4 for Head of Household"

status = gets.chomp.to_i

puts "Enter Fair Market Value of Property in XXXX.XX format"

salesPrice = gets.chomp.to_f

puts "Enter Purchase Date of Property in YYYY-DD-MM Format"

purchaseDate = gets.chomp

puts "Enter Tax Basis of Property in XXXX.XX format"

basis = gets.chomp.to_f

puts "Enter Your Annual Taxable Income Excluding This Capital Gain in XXXX.XX format"

income = gets.chomp.to_f

case 
when (status == 1)
    taxpayer = Single.new(purchaseDate, salesPrice, basis, income)
when (status == 2)
    taxpayer = MarriedOrWidow.new(purchaseDate, salesPrice, basis, income)
when (status == 3)
    taxpayer = MarriedFilingSeparately.new(purchaseDate, salesPrice, basis, income)
when (status == 4)
    taxpayer = HeadOfHousehold.new(purchaseDate, salesPrice, basis, income)

    
end

print "\n\n\n"
print "Your estimated capital gains tax is:   "
puts taxpayer.normalGain
print "\n\n\n"
puts "Your estimated capital gain if the money"
puts "is invested in an opportunity zone is:"
print taxpayer.fiveYearOppZoneGain
puts "   if left for 5 to 7 years"
print taxpayer.sevenYearOppZoneGain
puts "   if left for 7 to 10 years"
puts "and 0 if left for 10 or more years"
print "\n\n\n"
