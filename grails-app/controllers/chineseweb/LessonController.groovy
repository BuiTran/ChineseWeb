
package chineseweb
/**
 * Controls all lessons 
 */
import grails.plugin.springsecurity.annotation.Secured


import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional
@Secured("ROLE_ADMIN")
@Transactional(readOnly = true)
class LessonController {
	def show(Lesson lessonInstance) {
		def course=lessonInstance.course
		[lessonInstance:lessonInstance,course:course]
	}

	def create(Course course) {
		[lessonInstance: new Lesson(),course:course]
	}

	@Transactional
	def save(Lesson lessonInstance) {
		println lessonInstance
		lessonInstance.properties=params
		def course=Course.get(Long.parseLong(params.courseId))
		course.addToLessons(lessonInstance)
		if (lessonInstance == null) {
			notFound()
			return
		}

		if (lessonInstance.hasErrors()) {
			respond lessonInstance.errors, view:'create'
			return
		}
		
		course.addToLessons(lessonInstance).save(flush:true,failOnError:true)
		lessonInstance.save flush:true,failOnError:true

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
		def courseId=lessonInstance.course.id
		lessonInstance.delete flush:true

		request.withFormat {
			form multipartForm {
				flash.message = message(code: 'default.deleted.message', args: [message(code: 'Lesson.label', default: 'Lesson'), lessonInstance.id])
				redirect action:"show",controller:"course", id:"${courseId}", method:"GET"
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
