package chineseweb

class Lesson {
	String lessonNo
	String title

	static constraints = {
		lessonNo(nullable:false,blank:false)
		title(nullable:false,blank:false)
	}
	static belongsTo=Course
	/*static mapping={
	 id name: 'lessonNo'
	 id generator: 'assigned'
	 }*/
}
