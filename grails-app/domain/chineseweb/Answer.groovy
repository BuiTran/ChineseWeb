package chineseweb

class Answer {
	Boolean correct
	String choice
	static belongsTo = Question
    static constraints = {
    }
}
