<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Upload File with Angular Ajax</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script src="http://ajax.googleapis.com/ajax/libs/angularjs/1.4.8/angular.min.js"></script>
<style>
	img{
		width: 200px;
		height: 200px;
	}
	code{
		color:red;
	}
</style>
</head>
<body ng-app="fileApp" ng-controller="fileCtrl">

	<center>
		<h1>File Upload With Angular AJAX To Specific Folder</h1><hr>

		<code ng-bind="message"></code><br>
		<form ng-submit = "upload($event)">
			<table>
				<tr>
					<td>Folder</td>
					<td>: <input type="text" ng-model="folder" placeholder="folder to upload"/></td>
				</tr>
				<tr>
					<td>File(multiple)</td>
					<td>: <input type="file" id="file" name="file" multiple></td>
				</tr>
				<tr>
					<td></td>
					<td>: <input type="submit" value="Upload"/></td>
				</tr>
				<tr>
					<td>File(single)</td>
					<td>: <input type="file" id="myFile"></td>
				</tr>
			</table>
		</form>
		<br><img ng-repeat="img in images" ng-src="{{filePath}}/{{img}}">

	</center>
	
	<script>
		var app = angular.module('fileApp', []);
		app.controller('fileCtrl', function($scope, $http){
			
			var FILE = {};
			
			//TODO: on submit event, multiple file
			$scope.upload = function(event){
				event.preventDefault();

				var frmData = new FormData();
				var files = angular.element('#file')[0].files;
				for(var i=0; i<files.length; i++)
					frmData.append("files", files[i]);
				
				FILE.upload(frmData);
			};
			
			
			//TODO: onchange event upload, signle file
			document.getElementById('myFile').onchange = function(){
				var frmData = new FormData();
				var files = angular.element('#myFile')[0].files;
				frmData.append("files", files[0]);
				FILE.upload(frmData);
			};
			
			
			//TODO: upload file to server
			FILE.upload = function(frmData){
				$http({
					url: 'http://localhost:5555/api/v1/upload',
					params: {
						folder: $scope.folder
					},
					method: 'POST',
					data: frmData,
					transformRequest: angular.identity,
		            headers: {'Content-Type': undefined}
					
				}).then(function(response){
					var files = response.data;
					$scope.message = files.message;
					$scope.filePath = files.projectPath;
					
					$scope.images = [];
					for(var i=0; i<files.names.length; i++){
						$scope.images.push(files.names[i])
					}
					console.log(response);
				}, function(response){
					console.log(response);
				});
			};
			
		});
	</script>
</body>
</html>