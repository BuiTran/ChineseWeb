package chineseweb

class VerificationCode {
	String code
	static belongsTo = [student: Student, course: Course]
	
	
	
    static constraints = {
		code unique:true, nullable: false
    }
}
