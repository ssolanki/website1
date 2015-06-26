
// factory

app.factory('BlogDataService', ['$location','$http',
 function($location, $http){
	return {
		Blog : function(scope){
			var currBlogTags = [];
				// get the current post id
			var currBlogId = $location.$$path.split('/')[2];
			if(currBlogId){
				$http.post('./../api/currentBlogData.php', { "id": currBlogId})
				.success(function(data){
					//console.log(data);
					scope.currentBlogData = data;
					$http.post('./../api/fetchRelatedBlogFromTags.php', {"tags":data.tags})
					.success(function(data){
						//console.log(data);
						for (var i = 0 ; i < data.length; i++) {
							if(data[i].id == currBlogId){	
								continue;
							}
							scope.relatedBlogsData.push(data[i]);
						}
					})
					.error(function(data){
						console.log(data);
					})
				})
				.error(function(data){
					console.log(data);
				})
			}
		}
	};
}]);



app.service('UploadBlog', ['$http', function ($http) {
  this.uploadFileToUrl= function(fileId, file, toUrl, fileDestination){
    var fd = new FormData();
    fd.append('fileId', fileId);
    fd.append('file', file);
    fd.append('fileDestination', fileDestination);
    $http.post(toUrl, fd, {
        transformRequest: angular.identity,
        headers: {'Content-Type': undefined}
    })
    .success(function(data){
    	console.log(data);
    })
    .error(function(){
    	console.log("error while uploading your file");
    });
  };

	this.insertBlog = function(blog){
		$http.post('./../api/InsertBlogData.php', blog)
		.success(function (data){
			console.log(data);
		})
		.error(function (data){
			console.log(data);
		})
	}
}]);

app.service('CommentService', ['$http', function($http){
	this.fetchComments = function(id, scope){
		$http.post('./../api/fetchComments.php', {'id':id})
		.success(function(data){
			scope.comments = data;
		})
		.error(function(data){
			console.log(data);
		})
	};
	this.addComment = function(id, commentData){
		$http.post('./../api/addComment.php', [{'id': id}, commentData])
		.success(function(data){
			//console.log(data);
		})
		.error(function(data){
			console.log(data);
		})
	}
}]);