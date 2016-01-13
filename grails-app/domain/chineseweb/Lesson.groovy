package chineseweb

class Lesson {
	String lessonNo
	String lessonTitle
	
	static belongsTo = [course:Course]
	static hasMany = [flashcards: Flashcard, questions: Question]
	static mapping = {
		flashcards cascade: "save-update"
	}
	
    static constraints = {
		lessonNo nullable: false
		lessonTitle nullable: false
    }
}
