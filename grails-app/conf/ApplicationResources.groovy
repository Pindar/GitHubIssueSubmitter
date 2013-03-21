modules = {
    application {
        resource url:'js/application.js'
    }
	
	form {
		dependsOn 'jquery'

		resource url: '/js/jquery.form.js'
	}
}