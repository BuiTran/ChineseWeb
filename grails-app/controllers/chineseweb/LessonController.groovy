
package chineseweb
/**
 * Controls all lessons 
 */
import grails.plugin.springsecurity.annotation.Secured


import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional
@Secured('ROLE_ADMIN')
@Transactional(readOnly = true)
class LessonController {
	def show(Lesson lessonInstance) {
		[lessonInstance:lessonInstance]
	}

	def create() {
		def course=Course.get(params.courseId)
		[lessonInstance: new Lesson(),course:course]
	}
	def _tableFlashcard(){
		def lessonInstance = Lesson.get(params.lessonId)
		def flashcardInstanceList = Flashcard.list()
		render view:'_tableFlashcard', model:[flashcardInstanceList: flashcardInstanceList, lessonInstance: lessonInstance]
	}
	
	def addFlashcard(){
		
		def fId = params.flashcardId as Long
		def lId = params.lessonId
		
		def flashcardInstance = Flashcard.get(fId)
		def lessonInstance = Lesson.get(lId)
		lessonInstance.addToFlashcards(flashcardInstance).save(flush:true)
		
		render view:'_lessonFlashcard', model: [lessonInstance:lessonInstance]
		
	}
	
	def deleteFlashcard(){
		def fId = params.flashcardId as Long
		def lId = params.lessonId
		def flashcardInstance = Flashcard.get(fId)
		def lessonInstance = Lesson.get(lId)
		lessonInstance.removeFromFlashcards(flashcardInstance).save(flush:true)
		
		render view:'_lessonFlashcard', model: [lessonInstance:lessonInstance]
	}
	@Transactional
	def save(Lesson lessonInstance) {
		lessonInstance.properties=params
		def course=Course.get(params.courseId)
		course.addToLessons(lessonInstance)
		if (lessonInstance == null) {
			notFound(lessonInstance)
			return
		}

		if (lessonInstance.hasErrors()) {
			respond lessonInstance.errors, view:'create'
			return
		}
		
		println "before"+course.lessons.toList().size()
		course.addToLessons(lessonInstance).save(flush:true,failOnError:true)
		lessonInstance.save flush:true,failOnError:true
		println "after"+course.lessons.toList().size()
		println lessonInstance
		
		
		request.withFormat {
			form multipartForm {
				flash.message = message(code: 'default.created.message', args: [message(code: 'lesson.label', default: 'Lesson'), lessonInstance.lessonNo])
				 render view:"show",model:[lessonInstance:lessonInstance]
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
			notFound(lessonInstance)
			return
		}

		if (lessonInstance.hasErrors()) {
			respond lessonInstance.errors, view:'edit'
			return
		}

		lessonInstance.save flush:true

		request.withFormat {
			form multipartForm {
				flash.message = message(code: 'default.updated.message', args: [message(code: 'Lesson.label', default: 'Lesson'), lessonInstance.lessonNo])
				 render view:"show",model:[lessonInstance:lessonInstance]
			}
			'*'{ respond lessonInstance, [status: OK] }
		}
	}

	@Transactional
	def delete(Lesson lessonInstance) {

		if (lessonInstance == null) {
			notFound(lessonInstance)
			return
		}
		def courseId=lessonInstance.course.id
		lessonInstance.delete flush:true

		request.withFormat {
			form multipartForm {
				flash.message = "Lesson ${lessonInstance.lessonNo} is deleted"
				redirect action:"show",controller:"course", id:"${lessonInstance.course.courseCode}", method:"GET"
			}
			'*'{ render status: NO_CONTENT }
		}
	}

	protected void notFound(Lesson lessonInstance) {
		request.withFormat {
			form multipartForm {
				flash.message = "Lesson is not found"
				redirect controller:"course",id:"${lessonInstance.course.courseCode}", action: "show", method: "GET"
			}
			'*'{ render status: NOT_FOUND }
		}
	}
}
