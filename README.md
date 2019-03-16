This repository was created to assist with building an opportunity zone tax calculator.

The repository is not a complete program.  It contains four separate files, each of which contains a class representing one of five possible kinds of taxpayers based on filing status.  Qualifying Widow(er)s are taxed at the same rate as Married Taxpayers who are filing jointly, so both are included in the class "MarriedOrWidow."

The repository also contains a simple program called "test.rb" that allows a user to test the classes by inputting various values for the sales price of the property, the purchase price of the property, and the purchase date.  NOTE THAT THERE IS NO FORM OF INPUT VALIDATION IN THE TEST FILE.  IF YOU INPUT INCORRECT VALUES, YOU WILL CRASH THE PROGRAM.  The "test.rb" program will instantiate an object from the appropriate class selected by the user and do the following:

1) Compute the estimated capital gains tax on the proceeds of the sale.
2) Compute the estimated capital gain if the sale proceeds were invested into an opportunity zone for 5-7 years
3) Compute the estimated capital gain if the sale proceeds were invested into an opportunity zone for 7-10 years.


