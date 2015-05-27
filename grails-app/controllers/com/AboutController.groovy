package com



import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional
import org.springframework.dao.DataIntegrityViolationException
import grails.plugin.springsecurity.annotation.Secured

@Transactional(readOnly = true)
@Secured(['ROLE_USER'])
class AboutController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond About.list(params), model:[aboutInstanceCount: About.count()]
    }

    def show(About aboutInstance) {
        respond aboutInstance
    }

    def create() {
        respond new About(params)
    }

    @Transactional
    def save(About aboutInstance) {
        if (aboutInstance == null) {
            notFound()
            return
        }

        if (aboutInstance.hasErrors()) {
            respond aboutInstance.errors, view:'create'
            return
        }

        aboutInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'about.label', default: 'About'), aboutInstance.id])
                redirect aboutInstance
            }
            '*' { respond aboutInstance, [status: CREATED] }
        }
    }

    def edit(About aboutInstance) {
        respond aboutInstance
    }

    @Transactional
    def update(About aboutInstance) {
        if (aboutInstance == null) {
            notFound()
            return
        }

        if (aboutInstance.hasErrors()) {
            respond aboutInstance.errors, view:'edit'
            return
        }

        aboutInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'About.label', default: 'About'), aboutInstance.id])
                redirect aboutInstance
            }
            '*'{ respond aboutInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(About aboutInstance) {

        if (aboutInstance == null) {
            notFound()
            return
        }

        aboutInstance.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'About.label', default: 'About'), aboutInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'about.label', default: 'About'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
