package com


import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional
import org.springframework.dao.DataIntegrityViolationException
import grails.plugin.springsecurity.annotation.Secured
import com.gmongo.GMongo 

@Transactional(readOnly = true)
@Secured(['ROLE_USER'])
class WalletController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]
    def springSecurityService


    def mongo = new GMongo()//Criando conexao com banco mongoDB
    def db = mongo.getDB("TCCGrails_2_4_3")//Busca banco 

    def index(Integer max) {
        def user = springSecurityService.currentUser
        if(!((springSecurityService.currentUser)==null))
        {
            print(" Current User springframework = "+user.username)
            
            db.JADE_userLogged.insert([_id:user.username,userIdentifier:user.username])
        }
        else print("Sem usuarios logados")

        params.max = Math.min(max ?: 10,100)
        
        if(user!=null)
        {
            def walletInstanceList=Wallet.findByUserId(user.username)
            def stockInstanceList= Stock.findAllByUserId(user.username)
            [walletInstanceList : walletInstanceList,walletInstanceCount: 1,stockInstanceList:stockInstanceList]
        }else
        {
            respond Wallet.list(params),model:[stockInstanceCount:1]
            
        }
        
    }

    def show(Wallet walletInstance) {
        respond walletInstance
    }


    def create() {
        def stock= new Stock()
        def listStock = stock.listStocks()
        [walletInstance:new Wallet(params),listStocks:listStock]
      //  respond new Wallet(params)
    }
    

    @Transactional
    def save(Wallet walletInstance) {
        if (walletInstance == null) {
            notFound()
            return
        }

        if (walletInstance.hasErrors()) {
            respond walletInstance.errors, view:'create'
            return
        }

       def user = springSecurityService.currentUser
       
        
        walletInstance.userId=user.username
        walletInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message="Carteira criada com Sucesso"

                redirect walletInstance
            }
            '*' { respond walletInstance, [status: CREATED] }
        }


    }

    def edit(Wallet walletInstance) {
        respond walletInstance
    }

    @Transactional
    def update(Wallet walletInstance) {

        if (walletInstance == null) {
            notFound()
            return
        }

        if (walletInstance.hasErrors()) {
            respond walletInstance.errors, view:'edit'
            return
        }

        walletInstance.save flush:true

        request.withFormat {
            form multipartForm {

                flash.message="Carteira atualizada com Sucesso!"
                //flash.message = message(code: 'default.updated.message', args: [message(code: 'Wallet.label', default: 'Wallet'), walletInstance.id])
                redirect walletInstance
            }
            '*'{ respond walletInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(Wallet walletInstance) {

        if (walletInstance == null) {
            notFound()
            return
        }

        walletInstance.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message="Carteira apagada!"
               // flash.message = message(code: 'default.deleted.message', args: [message(code: 'Wallet.label', default: 'Wallet'), walletInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'wallet.label', default: 'Wallet'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
