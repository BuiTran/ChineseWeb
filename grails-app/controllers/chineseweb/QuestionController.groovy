package chineseweb



import static org.springframework.http.HttpStatus.*
import grails.plugin.springsecurity.annotation.Secured
import grails.transaction.Transactional

@Secured("ROLE_ADMIN")
@Transactional(readOnly = true)
class QuestionController {

	def list(Lesson lessonInstance ) {
		def list=lessonInstance.questions.toList()
		[list:list,lessonInstance:lessonInstance]
	}

	def show(Question questionInstance) {
		[questionInstance:questionInstance]
	}

	def create() {
		def lessonInstance=Lesson.get(params.lessonId)
		int questionNo=lessonInstance.questions.size()+1
		(1..5).each{
			Answer a = new Answer(choice:"A",correct:false)


		}
		[questionInstance:new Question(),lessonInstance:lessonInstance,questionNo:questionNo]
	}

	@Transactional
	def save(Question questionInstance) {
		def lessonInstance=Lesson.get(params.lesson)
		lessonInstance.addToQuestions(questionInstance)
		if (questionInstance == null) {
			notFound()
			return
		}

		if (questionInstance.hasErrors()) {
			respond questionInstance.errors, view:'create',model:[questionInstance:questionInstance,lessonInstance:lessonInstance]
			return
		}
		lessonInstance.addToQuestions(questionInstance).save(flush:true,failOnError:true)
		questionInstance.save flush:true
		
		
		(1..5).each{
			print params."${it}"
			if(params."${it}".compareTo("")){
				Answer a=new Answer(choice:params."${it}",correct:false)
				if(it.toString() in params.correct){
					print it + " correct answer"
					a.correct = true
				}
				questionInstance.addToAnswers(a).save flush:true,failOnError:true
				a.save flush:true,failOnError:true
			}
		}

		request.withFormat {
			form multipartForm {
				flash.message = message(code: 'default.created.message', args: [message(code: 'question.label', default: 'Question'), questionInstance.id])
				render view:"show",model:[questionInstance:questionInstance]
			}
			'*' { respond questionInstance, [status: CREATED] }
		}
	}

	def edit(Question questionInstance) {
		[questionInstance:questionInstance]
	}

	@Transactional
	def update(Question questionInstance) {
		if (questionInstance == null) {
			notFound()
			return
		}

		if (questionInstance.hasErrors()) {
			respond questionInstance.errors, view:'edit'
			return
		}

		questionInstance.save flush:true
		questionInstance.answers.each{
			def idString=it.id
			it.choice = params."${idString}"
			it.correct = false

		}

		params.correct.each{
			Answer.get(it).correct = true
		}

		request.withFormat {
			form multipartForm {
				flash.message = message(code: 'default.updated.message', args: [message(code: 'Question.label', default: 'Question'), questionInstance.id])
				render view:"show",model:[questionInstance:questionInstance]
			}
			'*'{ respond questionInstance, [status: OK] }
		}
	}

	@Transactional
	def delete(Question questionInstance) {

		if (questionInstance == null) {
			notFound()
			return
		}

		questionInstance.delete flush:true

		request.withFormat {
			form multipartForm {
				flash.message = message(code: 'default.deleted.message', args: [message(code: 'Question.label', default: 'Question'), questionInstance.id])
				redirect action:"list", method:"GET"
			}
			'*'{ render status: NO_CONTENT }
		}
	}

	protected void notFound() {
		request.withFormat {
			form multipartForm {
				flash.message = message(code: 'default.not.found.message', args: [message(code: 'question.label', default: 'Question'), params.id])
				redirect action: "list", method: "GET"
			}
			'*'{ render status: NOT_FOUND }
		}
	}
}
