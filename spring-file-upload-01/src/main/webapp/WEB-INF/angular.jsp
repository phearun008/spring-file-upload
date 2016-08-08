<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Upload File with Angular Ajax</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script src="http://ajax.googleapis.com/ajax/libs/angularjs/1.4.8/angular.min.js"></script>
</head>
<body ng-app="fileApp" ng-controller="fileCtrl">

	<center>
		<h1>File Upload With Angular Ajax</h1><hr>
		<form ng-submit = "upload($event)">
			<input type="file" id="file" name="file" multiple>
			<input type="submit" value="Upload"/> 
		</form>
	</center>
	
	<script>
		var app = angular.module('fileApp', []);
		app.controller('fileCtrl', function($scope, $http){
			
			$scope.upload = function(event){
				event.preventDefault();

				var frmData = new FormData();
				var files = angular.element('#file')[0].files;
				for(var i=0; i<files.length; i++)
					frmData.append("files", files[i]);
				
				$http({
					url: 'http://localhost:5555/api/v1/upload',
					method: 'POST',
					data: frmData,
					transformRequest: angular.identity,
		            headers: {'Content-Type': undefined}
				}).then(function(response){
					console.log(response);
				}, function(response){
					console.log(response);
				});
			};
			
		});
	</script>
</body>
</html>