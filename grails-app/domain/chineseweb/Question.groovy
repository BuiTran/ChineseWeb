package chineseweb

class Question {
	String questionText
	
	static belongsTo = Lesson
	static hasMany = [answers: Answer]
    static constraints = {
		answers maxSize:5
    }
}
