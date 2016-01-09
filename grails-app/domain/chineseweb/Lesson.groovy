package chineseweb

class Lesson {
	String lessonNo
	String lessonTitle
	String courseCode
	
	static belongsTo = Course
	
    static constraints = {
		lessonNo nullable: false
		lessonTitle nullable: false
    }
}
