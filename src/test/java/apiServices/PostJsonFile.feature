Feature: Create user for POST API2
@Video
Scenario: Create a user with given data
	* url 'https://gorest.co.in'
	* def random_string =
	"""
		function(s)
		{
			var text="";
			var pattern="ABcd1234"
			for (var i=0; i<s; i++)
				text += pattern.charAt(Math.floor(Math.random() * pattern.length()));
				return text;
	}
	"""
	* def randomString = random_string(5)
	#* print "Bakshiiii" + randomString
	* def requestPayload = 
	"""
  		{
		  "name": "Jatin",  	
		  "gender": "male",
		  "status": "active"
 		}
	"""
	* requestPayload.email = randomString + "@gmail.com"
  Given path '/public/v2/users'
	And request requestPayload
	And header Authorization = 'Bearer '+ 'd8df370f4688b2f4960f8e1fc6654a3bbd20330efdd4c6281d8f39fd39a109ec'
	When method post
	Then status 201
	#* print 'response:', response
	And match $.data.id == '#present'
	And match $.data.status == '#present'
	And match $.data.name == '#present'
	And match $.data.email == '#present'