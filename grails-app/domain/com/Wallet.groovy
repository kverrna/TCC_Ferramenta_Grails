package com
import com.springSecurity.User

class Wallet {

 	String userId
    double walletValue
    double walletRisck
    double walltetPercent

    static hasMany=[stocks:Stock]

    

    static constraints = {
   
    	userId (nullable:true)
    	//userId (unique:true)
    }
    String toString()
    {
    	return userId
    }
}
