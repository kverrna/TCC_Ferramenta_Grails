package com

class Stock {
	String codeName
    double avarangeReturn_15
    double avarangeReturn_30
    double standardDeviation_15
    double standardDeviation_30
    double variance_15
    double variance_30
    double varianceCoeffientt_30
    double varianceCoeffientt_15
    String userId

    static belengsTo=Wallet



    static constraints = 
    {
        userId (nullable:true)

    }
    String toString()
    {
    	return codeName
    }
     Stock listStocks()
    {
        def springSecurityService
        def user=springSecurityService.currentUser 
        def stockInstanceList=Stock.findByUserId(user.username)
        
        return stockInstanceList

    }
 




}
