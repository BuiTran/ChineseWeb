package chineseweb
import grails.plugin.springsecurity.annotation.Secured
import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional
import chineseweb.security.*

/**
 * Manage courses
 * @author lenovo
 *
 */
@Transactional(readOnly = true)
@Secured("ROLE_ADMIN")
class CourseController {
	def springSecurityService

	/**
	 * Course List
	 * @return
	 */
	def index() {
		User user=springSecurityService.currentUser
		model:[list:user.courses]
	}

	/**
	 * Show detailed information of a specific course
	 * @param course
	 * @return
	 */
	def show(Course course) {
		[course:course]
	}

	/**
	 * Ajax. Open create-new-course dialog
	 * @return
	 */
	def create() {
		Course c=new Course()
		[courseInstance:c]
	}

	/**
	 * Save a created course
	 * @param courseInstance
	 * @return
	 */
	@Transactional
	def save(Course courseInstance) {
		courseInstance.properties=params
		def user=springSecurityService.currentUser
		user.addToCourses(courseInstance).save(flush:true,failOnError:true)



		if (courseInstance == null) {
			notFound()
			return
		}
		if (courseInstance.hasErrors()) {
			respond courseInstance.errors, view:'create'
			return
		}

		courseInstance.save flush:true

		request.withFormat {
			form multipartForm {
				flash.message = "Course ${courseInstance.courseTitle} is created."
				render view:"show",model:[course:courseInstance]
			}
			'*' { respond courseInstance, [status: CREATED] }
		}
	}

	/**
	 * Ajax. Edit a course
	 * @param courseInstance
	 * @return
	 */
	def edit(Course courseInstance) {
		[courseInstance: courseInstance]
	}


	/**
	 * Save an edited course
	 * @param courseInstance
	 * @return
	 */
	@Transactional
	def update(Course courseInstance) {
		if (courseInstance == null) {
			notFound()
			return
		}

		if (courseInstance.hasErrors()) {
			respond courseInstance.errors, view:'edit'
			return
		}

		courseInstance.save flush:true

		request.withFormat {
			form multipartForm {
				flash.message = "Course ${courseInstance.courseTitle} is updated."
				redirect courseInstance
			}
			'*'{ respond courseInstance, [status: OK] }
		}
	}

	/**
	 * Delete a specific course
	 * @param courseInstance
	 * @return
	 */
	@Transactional
	def delete(Course courseInstance) {

		if (courseInstance == null) {
			notFound()
			return
		}

		courseInstance.delete flush:true

		request.withFormat {
			form multipartForm {
				flash.message = "Course ${courseInstance.courseTitle} is deleted. "
				// redirect action:"index", method:"GET"
			}
			'*'{ render status: NO_CONTENT }
		}
		User user=springSecurityService.currentUser
		render view:"index",model:[list:user.courses]
	}

	/**
	 * Whatever...
	 */
	protected void notFound() {
		request.withFormat {
			form multipartForm {
				flash.message = message(code: 'default.not.found.message', args: [message(code: 'course.label', default: 'Course'), params.id])
				redirect action: "index", method: "GET"
			}
			'*'{ render status: NOT_FOUND }
		}
	}
}