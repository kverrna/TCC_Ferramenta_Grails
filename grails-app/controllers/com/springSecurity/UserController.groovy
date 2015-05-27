package com.springSecurity

import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional
import org.springframework.dao.DataIntegrityViolationException
import grails.plugin.springsecurity.annotation.Secured
import com.gmongo.GMongo 


@Transactional(readOnly = true)



class UserController {


    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def springSecurityService

    def mongo = new GMongo()//Criando conexao com banco mongoDB
    def db = mongo.getDB("TCCGrails_2_4_3")//Busca banco 

    @Secured(['ROLE_USER'])
    def index(Integer max) {

        redirect(controller:'Wallet',action:'index')
        params.max = Math.min(max ?: 10, 100)
        respond User.list(params), model:[userInstanceCount: User.count()]
    }



    @Secured(['ROLE_USER'])
    def show(User userInstance) {

       
        redirect(controller:'Wallet',action:'index')
        respond userInstance
    }
    @Secured(['permitAll'])
    def create() {
      
        
        if(!((springSecurityService.currentUser)==null))
        {
            def user = springSecurityService.currentUser
            print(" Current User springframework = "+user.username)
            db.userLogged.insert([_id:user.username,userIdentifier:user.username])
        }
        else print("Sem usuarios logados")
       

        respond new User(params)
    }

    @Secured(['permitAll'])
    @Transactional
    def save(User userInstance) {


        if (userInstance == null) {
            notFound()
            return
        }

        if (userInstance.hasErrors()) {
            respond userInstance.errors, view:'create'
            return
        }

        

        userInstance.save flush:true

        //atencao aqui : Atribuindo perfil de acesso 

        def role=Role.findByAuthority("ROLE_USER")
        UserRole.create(userInstance, role , true) 

       //render role.authority
        //return 
         // 

         //Insere usuario na colecao de demanda para o agente criador 
         db.JADE_ordersCreate.insert([userIdentifier:userInstance.username,userPerfil:userInstance.profile,userValue:userInstance.investmentValue])
         

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'user.label', default: 'User'), userInstance.id])
                redirect userInstance
            }
            '*' { respond userInstance, [status: CREATED] }
        }
    }
    @Secured(['ROLE_USER'])
    def edit(User userInstance) {
        respond userInstance
    }

    @Secured(['ROLE_USER'])
    @Transactional
    def update(User userInstance) {
        if (userInstance == null) {
            notFound()
            return
        }

        if (userInstance.hasErrors()) {
            respond userInstance.errors, view:'edit'
            return
        }

        userInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'User.label', default: 'User'), userInstance.id])
                redirect userInstance
            }
            '*'{ respond userInstance, [status: OK] }
        }
    }
    @Secured(['ROLE_USER'])
    @Transactional
    def delete(User userInstance) {

        if (userInstance == null) {
            notFound()
            return
        }

        userInstance.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'User.label', default: 'User'), userInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'user.label', default: 'User'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
