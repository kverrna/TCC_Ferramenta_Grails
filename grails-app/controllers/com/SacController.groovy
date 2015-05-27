package com



import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional
import org.springframework.dao.DataIntegrityViolationException
import grails.plugin.springsecurity.annotation.Secured

@Transactional(readOnly = true)
@Secured(['ROLE_USER'])

class SacController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

@Secured(['ROLE_USER'])
    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Sac.list(params), model:[sacInstanceCount: Sac.count()]
    }
@Secured(['ROLE_USER'])
    def show(Sac sacInstance) {
        respond sacInstance
    }
@Secured(['ROLE_USER'])
    def create() {
        respond new Sac(params)
    }
@Secured(['ROLE_USER'])
    @Transactional
    def save(Sac sacInstance) {
        if (sacInstance == null) {
            notFound()
            return
        }

        if (sacInstance.hasErrors()) {
            respond sacInstance.errors, view:'create'
            return
        }

        sacInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'sac.label', default: 'Sac'), sacInstance.id])
                redirect sacInstance
            }
            '*' { respond sacInstance, [status: CREATED] }
        }
    }
@Secured(['ROLE_USER'])
    def edit(Sac sacInstance) {
        respond sacInstance
    }
@Secured(['ROLE_USER'])
    @Transactional
    def update(Sac sacInstance) {
        if (sacInstance == null) {
            notFound()
            return
        }

        if (sacInstance.hasErrors()) {
            respond sacInstance.errors, view:'edit'
            return
        }

        sacInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'Sac.label', default: 'Sac'), sacInstance.id])
                redirect sacInstance
            }
            '*'{ respond sacInstance, [status: OK] }
        }
    }
@Secured(['ROLE_USER'])
    @Transactional
    def delete(Sac sacInstance) {

        if (sacInstance == null) {
            notFound()
            return
        }

        sacInstance.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'Sac.label', default: 'Sac'), sacInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'sac.label', default: 'Sac'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
