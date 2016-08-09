<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>File Upload With JQuery Ajax</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
</head>
<body>

	<center>
		<h1>File Upload With JQUERY AJAX</h1><hr>
		<code id="message"></code>
		<form id="frmUpload">
			<input type="file" id="file" name="file" multiple>
			<input type="submit" value="Upload"/> 
		</form>
	</center>
	
	<script>
		$(document).ready(function(){
			$('#frmUpload').submit(function(event){
				event.preventDefault();
				
				var frmData = new FormData();
				var files = $('#file')[0].files;
				
				for(var i=0; i<files.length; i++){
					frmData.append('files', files[i]);
				}
				
				$.ajax({
					url: 'http://localhost:5555/api/v1/upload',
					method: 'POST',
					data: frmData,
					cache: false,
					contentType: false,
					processData: false,
					
					beforeSend: function(xhr) {
 						xhr.setRequestHeader('Access-Control-Allow-Origin', '*');
 		  	        },
					success: function(response){
						console.log(response);
						$('#message').html(response.message);
					},
					error: function(response){
						console.log(response);
					}
				});
			});
			
		});
	</script>
</body>
</html>