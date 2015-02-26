package com
import org.bson.types.ObjectId


class Stock {
    
    transient springSecurityService 

    ObjectId id
	String codeName
    double avarangeReturn_15
    double avarangeReturn_30
    double standardDeviation_15
    double standardDeviation_30
    double variance_15
    double variance_30
    double varianceCoeffientt_30
    double varianceCoeffientt_15
    double currentPrice
    int qtd
    int suggestion
    String userId

    static belongsTo=Wallet

    
    static transients=['springSecurityService']

    static constraints = 
    {
        userId (nullable:true)
        qtd (nullable:true)
        suggestion(nullable:true)


    }
    
    String toString()
    {
    	return codeName
    }
    
     def listStocks()
    {
        
        def user=springSecurityService.currentUser
        def stockInstanceList=Stock.findAllByUserId(user.username)
        
        return stockInstanceList

    }
    


    
    


}
