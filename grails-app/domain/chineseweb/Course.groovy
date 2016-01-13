package chineseweb

class Course {
	String courseTitle
	String courseCode

	static constraints = {
		courseTitle(blank:false,nullable:false)
		courseCode(blank:false,nullable:false)
	}

	static hasMany=[lessons:Lesson]
	static belongsTo=[user:chineseweb.security.User]
	static mapping={
		id generator:"assigned",name:"courseCode",column:"COURSE_CODE",type:"string"
		version false
	}

}