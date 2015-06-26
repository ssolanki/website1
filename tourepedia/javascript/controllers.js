/**
 * Created by Sudhir on 17-Jun-15.
 */

app.controller("MenuLocationPlacesController", ["$scope", "PlacesService", "$rootScope",
    function (scope, placeService, rootScope) {
        scope.places = [];
        placeService.placeInfo(scope);
        scope.updatePlaceInfo = function (place) {
            rootScope.selectedPlaceInfo = place;
            rootScope.showPorgressBar = false;
        }
    }
]);

app.controller('SignUpController', ['$scope', 'SignUpService',

    function ($scope, SignUpService) {

        $scope.newUser = {};
        $scope.everyThingAlright = function(newValue){
            var validName = (newValue.firstName != undefined && newValue.firstName  != '');
            var validEmail = (newValue.email != undefined && newValue.email  != '');
            var validPassword = (newValue.password != undefined && newValue.password  != '');
            var validRePassword = (newValue.rePassword != undefined && newValue.rePassword  != '');
            var passwordMatch = (validPassword && validRePassword) && (newValue.password == newValue.rePassword);
            return validName && validEmail && validPassword && validRePassword && passwordMatch;
        };

        $scope.register = function (newUser) {
            SignUpService.registerMe(newUser);
        }
    }]);

app.controller('LoginController', ['$scope', 'LoginService', '$rootScope',"$http",
    function ($scope, LoginService, $rootScope,$http) {
        $scope.login = function (user) {
            if (!$rootScope.isLoggedIn) {
                LoginService.login(user, $scope);
                $scope.user = "";
            }

        };
        $scope.CheckCredentials = function(){
                var data = {
                     email : $scope.user.email,
                     pwd: $scope.user.password
                     
                };

    $http.post('api/slim.php/auth/process',data).then(function (resp) {
     
        console.log(resp.data);
    });
     



        };

    }]);


app.controller("PlaceInfoController", ['$scope', '$rootScope', '$location', 'SessionService', 'PlacesService',
    function (scope, rootScope, location, SessionService, PlacesService) {
        scope.isPlaceSelected = rootScope.selectedPlaceInfo == undefined;
        rootScope.$watch('selectedPlaceInfo', function (newValue) {
            scope.selectedPlaceInfo = newValue;
            if (newValue != undefined) {
                scope.isPlaceSelected = true;
                SessionService.set('selectedPlaceName', newValue.name);
            }
        });

        scope.processToAddAttraction = function () {
            SessionService.set('userProceedToAddAttraction', true);
        };
        // check for users refresh so that he cannot come to it before selecting any place
        if (!SessionService.hasKey('selectedPlaceName')) {
            location.path('/home');
        } else {
            rootScope.selectedPlaceInfo = PlacesService.placeDataForPlace(SessionService.get('selectedPlaceName'));
        }
    }]);

app.controller("TripPlanningController", ['$scope', '$location', 'AttractionService', 'PlacesService', 'SessionService',
    function (scope, location, AttractionService, PlacesService, SessionService) {

        // this controller takes care of selecting attractions, taking user's personal information
        // and submitting tha plan

        scope.userAttractionsList = [];

        scope.userAtAddAttraction = false;
        scope.userAtAddInformation = false;
        scope.userAtSubmitPlan = false;
        scope.selectedPlaceInfo = {};
        if (SessionService.hasKey('selectedPlaceName')) {
            scope.prePlannedAttractionForThisPlace = AttractionService.getRelatedPrePlannedAttractionFor(SessionService.get('selectedPlaceName'));
            scope.selectedPlaceInfo = PlacesService.placeDataForPlace(SessionService.get('selectedPlaceName'));
            if (SessionService.hasKey('userProceedToAddAttraction')) {
                scope.attractions = AttractionService.getAttractionFor(SessionService.get('selectedPlaceName'));
                if (location.$$path.split('/')[1] == 'plan-a-trip') {
                    switch (location.$$path.split('/')[2]) {
                        case undefined :
                            scope.attractions = AttractionService.getAttractionFor(SessionService.get('selectedPlaceName'));
                            scope.userAtAddAttraction = true;
                            break;
                        case  "personal-information":
                            scope.userAtAddInformation = true;
                            break;
                        case  "plan-signup":
                            scope.userAtAddInformation = true;
                            break;
                        case "submit-plan":
                            scope.userAtSubmitPlan = true;
                            break;
                        default :
                            //user has typed something. smart. send him back to home
                            //location.path('/home');
                            break;
                    }
                } else {
                    location.path('/plan-a-trip');
                }
            } else {
                location.path('/plan-a-trip');
            }
        } else {
            console.log("I am going to home");
            location.path('/home');
        }

        // users proceeded to add his personal information
        scope.proceedToAddPersonalInformation = function (attraction) {
            console.log(attraction);
            scope.userAtAddAttraction = false;
            scope.userAtAddInformation = true;
        };
        // user is asking to submit the plan
        scope.proceedToSubmitThePlan = function (userPersonalInfo) {
            console.log("proceed to submit the plan with :");
            console.log(userPersonalInfo);
            scope.userAtAddAttraction = false;
            scope.userAtAddInformation = false;
            scope.userAtSubmitPlan = true;
        };

        scope.submitThePlan = function () {
            showNotification("Plan successfully submitted.", "rgb(26, 188, 156)", 4);
            SessionService.destroy('selectedPlaceName');
            SessionService.destroy('userProceedToAddAttraction');
            location.path('/home');
        };

        // function to add use selected attraction to user attraction list
        scope.addAttractionToList = function (attraction) {
            scope.attractions.splice(scope.attractions.indexOf(attraction), 1);
            scope.userAttractionsList.push(attraction);
            showNotification("Attraction added to list below.", "rgb(52, 73, 94)", 2);
        };

        // function to remove attraction from users list
        scope.removeAttractionFromList = function (attraction) {
            scope.userAttractionsList.splice(scope.userAttractionsList.indexOf(attraction), 1);
            scope.attractions.push(attraction);
            showNotification("Attraction removed from list.", "rgb(231, 76, 60)", 1);
        };


    }]);