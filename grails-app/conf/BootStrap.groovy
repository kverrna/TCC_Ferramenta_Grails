
import com.springSecurity.*


class BootStrap {

  

    def init = { servletContext ->

    	

    	def adminRole = new Role(authority: 'ROLE_ADMIN').save(flush: true)
    	def userRole = new Role(authority: 'ROLE_USER').save(flush: true)
    	def adminUser = new User(username: 'admin', password: 'admin').save(flush: true)

    	UserRole.create adminUser, adminRole, true
    	
    	
    	

    }
    def destroy = {
    }
}
