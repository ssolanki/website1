// controllers
app.controller('SideBarCtrl', [
	'$scope','BlogDataService',
	function($scope, BlogDataService){

	// set the variabe to be used in BlogDataSerice
	
	$scope.currentBlogData = [];
	$scope.relatedBlogsData = [];
	BlogDataService.Blog($scope);
	

}])


app.controller('LoginCtrl', ['$scope', function($scope){
	$scope.Login = function(user){
		if(user.username != '' && user.password != ''){
			console.log(user);
		}else{
			console.log("all fields are requred!");
		}
	}
}])

app.controller('UploadBlogCtrl', ['$scope','UploadBlog', function($scope, UploadBlog){

	$scope.currTags = [];

	$scope.blog = {};
	$scope.allTags = ['plan', 'india', 'visit', 'places', 'awesome', 'things', 
		'do', 'die', 'time', 'everybody', 'trip', 'character'];

	$scope.AddTag = function(tagName){
		if(tagName != undefined){
			if($scope.currTags.indexOf(tagName) == -1){
				$scope.currTags.push(tagName);
			}
			$scope.newTag = undefined;
		}
	}	
	$scope.RemoveTag = function(tagName){
		if(tagName != undefined){
			if($scope.currTags.indexOf(tagName) != -1){
				$scope.currTags.splice($scope.currTags.indexOf(tagName), 1);
			}
		}
	}

	$scope.UploadBlog = function(blog){
		blog.tags = $scope.currTags;
    var blogFile = $scope.blogFile;
    var imageFile = $scope.imageFile;
    var toUrl = "./api/UploadBlog.php";
   	UploadBlog.uploadFileToUrl(blog.id, blogFile, toUrl , "./../blog/assets/html/blogs/");
   	UploadBlog.uploadFileToUrl(blog.id, imageFile, toUrl, "./../blog/assets/images/aside/");
   	UploadBlog.insertBlog(blog);
  };
}])

app.controller('CommentsCtrl', [
	'$scope','CommentService', '$location',
	function($scope, CommentService, $location){

	
	
	$scope.comments = [];
	var currBlogId = $location.$$path.split('/')[2];
	if(currBlogId){
		// this service will update our comments json
		CommentService.fetchComments(currBlogId, $scope);

		$scope.addNewComment = function(newComment){
			var tmpComment = {
				"username": newComment.username,
				"comment" : newComment.comment
			};
			if(tmpComment.comment != '' && tmpComment.comment != undefined){
				$scope.comments.push(tmpComment);
				CommentService.addComment(currBlogId ,tmpComment);
				newComment.comment="";
			}
		}
	}	
}])

