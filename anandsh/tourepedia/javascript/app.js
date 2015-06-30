/**
 * Created by Sudhir on 17-Jun-15.
 */
"use strict";
var app = angular.module("tourepedia", ['ui.router']);

app.config(['$stateProvider', '$urlRouterProvider', function($stateProvider, $urlRouterProvider){
    $urlRouterProvider.otherwise('/home');
    $stateProvider
        .state('home',{
            url:'/home',
            views:{
                'place-info':{
                    templateUrl: './tourepedia/html/views/home.html'
                },
                'fix-plans':{
                    templateUrl:'./tourepedia/html/views/fix-plans.html'
                },
                'testimonials':{
                    templateUrl:'./tourepedia/html/views/testimonials.html'
                }
            }
        })
        .state('selectDestination',{
            url: '/select-destination',
            views:{
                'place-info':{
                    templateUrl: './tourepedia/html/views/select-destination.html'
                },
                'fix-plans':{
                    templateUrl:'./tourepedia/html/views/fix-plans.html'
                },
                'testimonials':{
                    templateUrl:'./tourepedia/html/views/testimonials.html'
                }
            }
        })
        .state('planATrip',{
            url: '/plan-a-trip',
            views:{
                'place-info':{
                    templateUrl: './tourepedia/html/views/plan-a-trip.html'
                },
                'planning-steps-view@planATrip':{
                    templateUrl: './tourepedia/html/views/add-attractions.html'
                },
                'fix-plans@':{ },
                'testimonials@':{}
            }
        })
        .state('planATrip.proceed',{
            url: '/:planningStage',
            views:{
                'planning-steps-view@planATrip':{
                    templateUrl: function($stateParams){
                        return './tourepedia/html/views/'+$stateParams.planningStage+'.html'
                    }
                }
            }
        })
        .state('planATrip.prePlansInfo',{
            url: '/pre-plans/:prePlan',
            views:{
                'planning-steps-view@planATrip':{
                    templateUrl: function($stateParams){
                        return './tourepedia/html/views/'+$stateParams.prePlan+'.html'
                    }
                }
            }
        })
        .state('aboutUs',{
            url: '/about-us',
            views:{
                'place-info':{
                    templateUrl: './tourepedia/html/views/about-us.html'
                },
                'fix-plans':{
                    templateUrl:'./tourepedia/html/views/fix-plans.html'
                },
                'testimonials':{
                    templateUrl:'./tourepedia/html/views/testimonials.html'
                }
            }
        })
        .state('samplePlan',{
            url: '/sample-plan',
            views:{
                'place-info':{
                    templateUrl: './tourepedia/html/views/sample-plan.html'
                },
                'fix-plans':{
                    templateUrl:'./tourepedia/html/views/fix-plans.html'
                },
                'testimonials':{
                    templateUrl:'./tourepedia/html/views/testimonials.html'
                }
            }
        })
        .state('privacyPolicies',{
            url: '/privacy-policies',
            views:{
                'place-info':{
                    templateUrl: './tourepedia/html/views/privacy-policies.html'
                },
                'fix-plans':{
                    templateUrl:'./tourepedia/html/views/fix-plans.html'
                },
                'testimonials':{
                    templateUrl:'./tourepedia/html/views/testimonials.html'
                }
            }
        })
}]);


// run at the start
app.run(['$rootScope', function($rootScope){
    $rootScope.$on('$stateChangeStart', function(){
        NProgress.start();
    });
    $rootScope.$on('$stateChangeSuccess', function(){
        NProgress.done();
    });
}]);

app.directive("myMenu", function(){
    return{
        restrict: 'E',
        templateUrl: './tourepedia/html/templates/menu.html'
    }
});

app.directive('myFooter', function(){
    return{
        restrict: 'E',
        templateUrl: './tourepedia/html/templates/footer.html'
    }
});
app.directive('myLogin', function(){
    return{
        restrict: 'E',
        templateUrl: './tourepedia/html/templates/login.html'
    }
});
app.directive('mySignup', function(){
    return{
        restrict: 'E',
        templateUrl: './tourepedia/html/templates/signup.html'
    }
});
app.directive('moveTop', function(){
    return{
        restrict: 'E',
        templateUrl: './assets/html/templates/move-top.html'
    }
});
app.directive('planCosts', function () {
    return{
        restrict: 'E',
        templateUrl: './tourepedia/html/templates/plan-costs.html'
    }
});