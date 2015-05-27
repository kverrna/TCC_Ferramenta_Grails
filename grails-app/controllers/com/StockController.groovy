package com



import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional
import org.springframework.dao.DataIntegrityViolationException
import grails.plugin.springsecurity.annotation.Secured
import com.gmongo.GMongo


@Transactional(readOnly = true)
@Secured(['ROLE_USER'])
class StockController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]
   // def springSecurityService

    def mongo = new GMongo()//Criando conexao com banco mongoDB
    def db = mongo.getDB("TCCGrails_2_4_3")//Busca banco



    def saveSuggestionApprove(final String codeName, final String userName,final int op)
    {
        db.stock.update([codeName:codeName,userId:userName],[$set:[suggestion:op]])

               // render "Params: CodeName  = $codeName, User Name= $userName Op=$op"
               redirect(controller: "wallet", action: "index")
    }
    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Stock.list(params), model:[stockInstanceCount: Stock.count()]
    }

    def show(Stock stockInstance) {

       print "voce clicou em "+stockInstance

        respond stockInstance
    }

    def create() {
        respond new Stock(params)
    }

    @Transactional
    def save(Stock stockInstance) {
        if (stockInstance == null) {
            notFound()
            return
        }

        if (stockInstance.hasErrors()) {
            respond stockInstance.errors, view:'create'
            return
        }

        stockInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'stock.label', default: 'Stock'), stockInstance.id])
                redirect stockInstance
            }
            '*' { respond stockInstance, [status: CREATED] }
        }
    }

    def edit(Stock stockInstance) {
        respond stockInstance
    }

    @Transactional
    def update(Stock stockInstance) {
        if (stockInstance == null) {
            notFound()
            return
        }

        if (stockInstance.hasErrors()) {
            respond stockInstance.errors, view:'edit'
            return
        }

        stockInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'Stock.label', default: 'Stock'), stockInstance.id])
                redirect stockInstance
            }
            '*'{ respond stockInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(Stock stockInstance) {

        if (stockInstance == null) {
            notFound()
            return
        }

        stockInstance.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'Stock.label', default: 'Stock'), stockInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'stock.label', default: 'Stock'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
