package com
import com.springSecurity.User
import org.bson.types.ObjectId
class Wallet {

    ObjectId id
 	String userId
    double walletValue
    double walletRisck
    double walltetPercent

    static hasMany=[stocks:Stock]

    static constraints = {
   
    	userId (nullable:true,unique:true)
        stocks (nullable:true)

    }
    String toString()
    {
    	return userId
    }
}
