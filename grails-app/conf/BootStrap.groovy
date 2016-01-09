import chineseweb.*
import chineseweb.security.*

class BootStrap {
	def nameList="Language History,Pronounciation,Grammer,Writing".split(",")
	Random rand=new Random()
	
    def init = { servletContext ->
		
		("A".."Z").each{
			def f1 = new Flashcard(symbol: it, pronunciation: it, definition: "idk").save(flush: true)
		}
		
		
		User ablock=new User(username:"ablock",password:"ablock").save(flush:true)
		User mhiggs=new User(username:"mhiggs",password:"mhiggs").save(flush:true)
		Role admin=new Role(authority:"ROLE_ADMIN",enabled:true).save(flush:true)
		UserRole.create(ablock,admin,true)
		UserRole.create(mhiggs,admin,true)

		/*Create courses for each user*/
		def list=[110,120,210,310,410]
		
		list.each{level->
			Course c=randomCourse(level)
			c.courseCode=level+"A"
			ablock.addToCourses(c).save(flush:true,failOnError:true)
			c.save(flush:true,failOnError:true)
		}
		
		list.each{level->
			Course c=randomCourse(level)
			c.courseCode=level+"B"
			mhiggs.addToCourses(c).save(flush:true,failOnError:true)
			c.save(flush:true,failOnError:true)
		}
    }
	
	/*
	 * Generate a random course
	 */
	def randomCourse(int num){
		Course c=new Course()
		c.courseTitle=nameList.getAt(rand.nextInt(nameList.size()))+num.toString()
		return c
	}
	
	
    def destroy = {
    }
}
