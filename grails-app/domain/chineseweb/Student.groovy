package chineseweb

class Student {
	String firstName
	String lastName
	String studentEmail
	
	
	static hasMany = [verificationCodes: VerificationCode]
    static constraints = {
		studentEmail unique:true, email:true, nullable: false
		firstName nullable: false
		lastName nullable: false
    }
}
