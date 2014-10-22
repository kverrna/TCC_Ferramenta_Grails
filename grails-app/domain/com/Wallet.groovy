package com

class Wallet {

 	String userId
    double walletValue
    double walletRisck
    double walltetPercent

    static hasMany=[stocks:Stock]
    

    static constraints = {
    }
    String toString()
    {
    	return userId
    }
}
