package chineseweb

class Flashcard {
	String symbol
	String pronunciation
	String definition
	
	static hasMany = [lessons: Lesson]
	static belongsTo = Lesson
	
    static constraints = {
		symbol unique: true,nullable:false
		pronunciation nullable:true
		definition nullable: true
    }
}
