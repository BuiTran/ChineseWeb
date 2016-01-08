import chineseweb.Flashcard
import chineseweb.Lesson
class BootStrap {

    def init = { servletContext ->
		
		def f1 = new Flashcard(symbol: "ma", pronunciation: "ma", definition: "idk")
		f1.save(flush: true)
		
    }
    def destroy = {
    }
}
