package com.springSecurity
import com.Wallet
import com.Sac

class User {

	transient springSecurityService

	String username
	String password
	String profile
	double investmentValue
	boolean enabled = true
	boolean accountExpired
	boolean accountLocked
	boolean passwordExpired
	
	
	static transients = ['springSecurityService']
	

	static constraints = {
		profile blank:false
		investmentValue blank:false
		username blank: false, unique: true
		password blank: false


	}

    def currentUser()
    {
    	springSecurityService.currentUser
    }
	String toString()
	{
		return username
	}

	static mapping = {
		//dataSource'teste'  com isso defino um banco em especifico 
		password column: '`password`'
	}

	Set<Role> getAuthorities() {
		UserRole.findAllByUser(this).collect { it.role }
	}

	def beforeInsert() {
		encodePassword()
	}

	def beforeUpdate() {
		if (isDirty('password')) {
			encodePassword()
		}
	}

	protected void encodePassword() {
		password = springSecurityService?.passwordEncoder ? springSecurityService.encodePassword(password) : password
	}
}
