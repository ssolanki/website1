'use strict';
var app = angular.module("tourepediaBlog", ['ui.router']);
	

// routes configuration for views
app.config(['$stateProvider', '$urlRouterProvider', function($stateProvider, $urlRouterProvider) {

	$urlRouterProvider.otherwise('/blogs/College-trip');

	$stateProvider
		.state('uploadBlog',{
			url:'/uploadBlog',
			views:{
				'main-view' :{templateUrl: './assets/html/views/uploadBlog.html'}
			}
		})
		.state('blogs',{
			url:'/blogs/:blogId',
			views:{
				'main-view': {
					templateUrl: function($stateParams){
						return './assets/html/blogs/'+$stateParams.blogId+'.html'}
					},
				'aside-view': {templateUrl: './assets/html/views/aside.html'},
				'comment-view': {templateUrl: './assets/html/views/comments.html'}

			}
		})
}]);



// run at the start 
app.run(function($rootScope){
	$rootScope.$on('$stateChangeStart', function(){
		NProgress.start();
	});
	$rootScope.$on('$stateChangeSuccess', function(){
		NProgress.done();
	});
});


// directives
app.directive('myFooter', function(){
	return{
		restrict: 'E',
		templateUrl: './assets/html/templates/footer.html'
	}
});
app.directive('myMenu', function(){
	return{
		restrict: 'E',
		templateUrl: './assets/html/templates/menu.html'
	}
});
app.directive('myLogin', function(){
	return{
		restrict: 'E',
		templateUrl: './../assets/html/templates/plan-costs.html'
	}
});
app.directive('moveTop', function(){
	return{
		restrict: 'E',
		templateUrl: './../assets/html/templates/move-top.html'
	}
});
app.directive('fileModel', ['$parse', function ($parse) {
    return {
        restrict: 'A',
        link: function(scope, element, attrs) {
            var model = $parse(attrs.fileModel);
            var modelSetter = model.assign;
            
            element.bind('change', function(){
                scope.$apply(function(){
                    modelSetter(scope, element[0].files[0]);
                });
            });
        }
    };
}]);


