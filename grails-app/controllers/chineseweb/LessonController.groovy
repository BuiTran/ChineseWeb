package chineseweb



import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class LessonController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Lesson.list(params), model:[lessonInstanceCount: Lesson.count()]
    }

    def show(Lesson lessonInstance) {
        respond lessonInstance
    }

    def create() {
        respond new Lesson(params)
    }

    @Transactional
    def save(Lesson lessonInstance) {
        if (lessonInstance == null) {
            notFound()
            return
        }

        if (lessonInstance.hasErrors()) {
            respond lessonInstance.errors, view:'create'
            return
        }

        lessonInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'lesson.label', default: 'Lesson'), lessonInstance.id])
                redirect lessonInstance
            }
            '*' { respond lessonInstance, [status: CREATED] }
        }
    }

    def edit(Lesson lessonInstance) {
        respond lessonInstance
    }

    @Transactional
    def update(Lesson lessonInstance) {
        if (lessonInstance == null) {
            notFound()
            return
        }

        if (lessonInstance.hasErrors()) {
            respond lessonInstance.errors, view:'edit'
            return
        }

        lessonInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'Lesson.label', default: 'Lesson'), lessonInstance.id])
                redirect lessonInstance
            }
            '*'{ respond lessonInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(Lesson lessonInstance) {

        if (lessonInstance == null) {
            notFound()
            return
        }

        lessonInstance.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'Lesson.label', default: 'Lesson'), lessonInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'lesson.label', default: 'Lesson'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
