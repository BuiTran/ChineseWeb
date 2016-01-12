package chineseweb

class Flashcard {
	String symbol
	String pronunciation
	String definition
	Long id
	
	static hasMany = [lessons: Lesson]
	static belongsTo = Lesson
	
    static constraints = {
		symbol unique: true
		pronunciation nullable: false
		definition nullable: false
    }
}
