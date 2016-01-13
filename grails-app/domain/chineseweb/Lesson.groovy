package chineseweb

class Lesson {
	String lessonNo
	String lessonTitle
	
	static belongsTo = [course:Course]
	static hasMany = [flashcards: Flashcard]
	static mapping = {
		flashcards cascade: "save-update"
		id generator:"assigned",name:"lessonNo",column:"LESSON_NO"
		version false
		course column:"COURSE_CODE"
	}
	
    static constraints = {
		lessonNo nullable: false
		lessonTitle nullable: false
    }
}
