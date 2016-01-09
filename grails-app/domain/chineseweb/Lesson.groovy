package chineseweb

class Lesson {
	String lessonNo
	String lessonTitle
	
	static belongsTo = [course:Course]
	
    static constraints = {
		lessonNo nullable: false
		lessonTitle nullable: false
    }
}
