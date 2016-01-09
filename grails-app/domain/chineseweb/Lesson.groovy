package chineseweb

class Lesson {
	String lessonNo
	String lessonTitle
	
	static belongsTo = Course
	
    static constraints = {
		lessonNo nullable: false
		lessonTitle nullable: false
		courseCode nullable: false
    }
}
