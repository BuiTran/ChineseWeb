package chineseweb

class Lesson {
	String lessonNo
	String lessonTitle
	String courseCode
	
    static constraints = {
		lessonNo nullable: false
		lessonTitle nullable: false
		courseCode nullable: false
    }
}
