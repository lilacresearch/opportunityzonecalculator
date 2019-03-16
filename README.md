This repository was created to assist with building an opportunity zone tax calculator.  

The repository is not a complete program.  It is a proof-of-concept  It contains four separate files, each of which contains a class representing one of five possible kinds of taxpayers based on filing status.  Qualifying Widow(er)s are taxed at the same rate as Married Taxpayers who are filing jointly, so both are included in the class "MarriedOrWidow."

The repository also contains a simple program called "test.rb" that allows a user to test the classes by inputting various values for the sales price of the property, the purchase price of the property, and the purchase date.  NOTE THAT THERE IS NO FORM OF INPUT VALIDATION IN THE TEST FILE.  IF YOU INPUT INCORRECT VALUES, YOU WILL CRASH THE PROGRAM.  The "test.rb" program will instantiate an object from the appropriate class selected by the user and do the following:

1) Prompt the user to enter the filing status.
2) Prompt the user to enter the sales price/FMV of the property.
3) Prompt the user to enter the date the property was purchased.
4) Prompt the user to enter the tax basis of the property.
5) Prompt the user to enter the taxable income.
6) Display the estimated capital gains tax on the proceeds of the sale.
7) Display the estimated capital gains tax if the sale proceeds were invested into an opportunity zone for 5-7 years
8) Display the estimated capital gains tax if the sale proceeds were invested into an opportunity zone for 7-10 years.


The classes take the sales date, sales price, and purchase date as inputs when an object is initialized.

The classes assume that the property was sold today and use the difference between the purchase date of the property and today's date to determine whether the capital gain is long term or short term.

The classes determine the taxpayer's marginal regular tax rate based on income using a case statement.  If the gain is short term, the marginal regular tax rate is used.  If the gain is long term, another case statement is triggered that overwrites the tax rate with the long term capital gains rate.

Since the law creating opportinity zones was created only in 2017, nobody has yet reached the 5, 7, or 10 year holding periods yet--therefore, the best we can do at this point is to tell the prospective investor what the capital gains tax would be if the property was held for 5 years, 7 years, or 10 years.
