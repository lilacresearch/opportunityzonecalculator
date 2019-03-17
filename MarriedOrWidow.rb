require 'date'

    class MarriedOrWidow

        def initialize (purchaseDate, salesPrice, basis, income)
            @purchaseDate = purchaseDate
            @salesPrice = salesPrice
            @basis = basis
            @income = income
                       
            

        end

        def calcdate

            #This method does two things:
            #First it computes the number of years the property has been held
            #and assigns it to an instance variable.  Second, it determines
            #whether holding period is greater or less than one year and
            #returns a boolean.

            @holdingPeriod = (Date.today - Date.parse(@purchaseDate)).to_f/365 #number of days from aquisition to today's date divided by 365
            
            if  (@holdingPeriod > 1)
                return true
            else 
                return false
            
            end

        end

        def determineRate
            #This method determines the tax rate.  The tax rate depends on whether the
            #gain is a long term or short term capital gain.  If the gain is Short Term,
            #the marginal tax rate for ordinary income is used.  If the gain is long 
            #term, the capital gain rate is used.  In either case the marginal tax
            #rate must be determined first, and that is how this method starts.

            
            @isLongTerm = self.calcdate    #variable is true if holding period > 1 yr and false otherwise


            #Married/Qualifying Widowers with incomes over $250,000 per year are subject to an additional 3.8% Net Investment Income Tax.
            if (@income > 250000)
                netInvestmentTaxRate = 0.038
            else
                netInvestmentTaxRate = 0.0
            end
            
            #The case statement below determines the tax rate for the taxpayer's highest tax bracket 
            #(the marginal tax rate).  If the property has been held for less than a year then the 
            #capital gain is a short term gain and this rate will be used to compute the tax.
               
            case
            when @income >= 612350  #if the taxpayer makes more than $510,300.00 then they are in the 37% tax bracket.
                @rate = 0.37
                
            when ((@income < 612350) and (@income >= 408200))
                @rate = 0.35

            when ((@income < 408200) and (@income >= 321450))
                @rate = 0.32

            when ((@income < 321450) and (@income >= 168400))
                @rate = 0.24
        
            when ((@income < 168400) and (@income >= 78950))
                @rate = 0.22

            when ((@income < 78950) and (@income >= 19400))
                @rate = 0.12

            when ((@income < 19400) and (@income >= 0))
                @rate = 0.10

        end

            #if the asset has been held more than one year, the capital gain is a long term gain, and the capital gain 
            #rate must be used.  The capital gain rate depends on the taxpayer's marginal tax rate.  If the holding 
            #period is longer than one year then the code below will be executed and will overwrite @rate with the 
            #capital gains rate.  Otherwise the code below will be skipped and the marginal tax rate computed above will 
            #be used.

            if (@isLongTerm == true)

                case 
                when ((@rate == 0.10 ) or (@rate == 0.12))  #if the taxpayer is in the 10 or 12% tax brackets then their long term capital gains rate is zero
                    @rate = 0

                when (@rate == 0.37)
                    @rate = 0.2

                else
                    @rate = 0.15

                end
            end


        end

      

        
        def normalGain

            self.determineRate
            #This method returns the taxpayer's theoretical capital gains tax if they choose not to invest in a Qualified Opportunity Zone

            return (@salesPrice - @basis) * @rate  #the computed capital gain(using actual basis) times the applicable tax rate
                                                   #the basis is provided as a parameter and the rate is computed in a method above

        end

              
        def fiveYearOppZoneGain

            #If the taxpayer holds the property for 5 to 7 years, they get a 10% step-up in basis on the capital gain.  In other words, they only pay 90% of
            #the original capital gains tax.

            #Note:  Net investment tax is based on income.  So, the taxpayer may not be subject to it in future years if their income is low enough.
            # For simplicity's sake, we are assuming that if the taxpayer is subject to it now, then they are subject to it in the future.

            return (@salesPrice - @basis) * (@rate + netInvestmentTaxRate) * 0.9

        end

        def sevenYearOppZoneGain

            #If the taxpayer holds the property for 5 to 7 years, they get a 15% step-up in basis.  In other words, they only pay 85% of
            #the original capital gains tax.  If the taxpayer holds the property for 10 years or more, they get a 100% step up in basis and pay zero tax.
            #No method is included for a 10 year holding period because it is completely unnecessary--the gain is zero.

            #Note:  Net investment tax is based on income.  So, the taxpayer may not be subject to it in future years if their income is low enough.
            # For simplicity's sake, we are assuming that if the taxpayer is subject to it now, then they are subject to it in the future.

            return (@salesPrice - @basis) * (@rate + netInvestmentTaxRate) * 0.85 

        end



    end

