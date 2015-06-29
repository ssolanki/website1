/**
 * Created by Sudhir on 17-Jun-15.
 */

app.controller("MenuLocationPlacesController", ["$scope", "PlacesService", "$rootScope","SessionService","LoginSignUpService",
    function (scope, placeService, rootScope, SessionService, loginServices) {
        scope.places = [];
        var $promise = placeService.placeInfo(scope);
        $promise.then(function (resp) {
            scope.places = resp.data.places_data;
        });
        scope.updatePlaceInfo = function (placeId) {
            console.log(placeId);
            $promise = placeService.placeDataForPlace(placeId);
            $promise.then(function (resp) {
                rootScope.selectedPlaceInfo = resp.data.places_data[0];
            });
            SessionService.set('user', JSON.stringify({"attractionsList":[], "plan":{},"book":{}}));
        };
        scope.logout = function(){
            loginServices.logout();
            rootScope.isLoggedIn = false;
        };
        rootScope.isLoggedIn = SessionService.hasKey('userId');
    }
]);

app.controller("PlaceInfoController", ['$scope', '$rootScope', '$location', 'SessionService', 'PlacesService',
    function (scope, rootScope, location, SessionService, PlacesService) {
        scope.selectedPlaceInfo = {};
        scope.isPlaceSelected = rootScope.selectedPlaceInfo != undefined;
        rootScope.$watch('selectedPlaceInfo', function (newValue) {
            scope.selectedPlaceInfo = newValue;
            if (newValue != undefined) {
                scope.isPlaceSelected = true;
                SessionService.set('selectedPlaceId', newValue.id);
            }
        });
        scope.processToAddAttraction = function () {
            SessionService.set('userProceedToAddAttraction', true);
        };
        // check for users refresh so that he cannot come to it before selecting any place
        if (!SessionService.hasKey('selectedPlaceId')) {
            location.path('/home');
        } else {
            var $promise = PlacesService.placeDataForPlace(SessionService.get('selectedPlaceId'));
            $promise.then(function (resp) {
                if (!scope.isPlaceSelected)
                    scope.selectedPlaceInfo = resp.data.places_data[0];
            });
        }
    }]);

app.controller("TripPlanningController", ['$scope', '$location', 'AttractionService', 'PlacesService', 'SessionService','$rootScope','$http',
    function (scope, location, AttractionService, PlacesService, SessionService, rootScope,$http) {

        // this controller takes care of selecting attractions, taking user's personal information
        // and submitting tha plan
        scope.user = {};
        scope.user.attractionsList = [];
        scope.user.plan = {};
        scope.user.book = {};
        scope.user.planType = 'Book';
        scope.user.plan.priceToPay = "";
        var hotelTypes = ["Hotel Type 1","Hotel Type 2","Hotel Type 3", "Hotel Type 4"];
        var amenities = ["Amenities 1", "Amenities 2","Amenities 3", "Amenities 4"];
        if (SessionService.hasKey('user')) {
            scope.user = JSON.parse(SessionService.get('user'));
        }
        scope.numOfDays = ['1-3', '4-6', '6+'];
        scope.expectedBudgetPerPerson = ['4000 - 6000', '6000 - 8000', '8000-10000'];
        scope.typeOfTrips = ["Family", "Friends Group", "Honey Moon", "Holidays"];
        scope.prices = [300, 500, 1000];
        scope.days = [1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31];
        scope.years = [2015,2016,2017];
        scope.months = ['January', 'February', 'March', 'April', 'May', 'June', 'July', 'August', 'September', 'October', 'November', 'December'];
        var toDay = new Date();
        scope.user.startingDateDay = toDay.getDate();
        scope.user.startingDateMonth = toDay.toLocaleString('en-US',{month:'long'});
        scope.user.startingDateYear = toDay.getFullYear();

        scope.userAtAddAttraction = false;
        scope.userAtAddInformation = false;
        scope.userAtSubmitPlan = false;
        scope.selectedPlaceInfo = {};

        scope.updatePrice = function(numOfPeople) {
            scope.user.plan.priceToPay = scope.prices[scope.numOfDays.indexOf(numOfPeople)];
        };

        if (SessionService.hasKey('selectedPlaceId')) {
            scope.prePlannedAttractionForThisPlace = AttractionService.getRelatedPrePlannedAttractionFor(SessionService.get('selectedPlaceId'));
            var $promise = PlacesService.placeDataForPlace(SessionService.get('selectedPlaceId'));
            $promise.then(function (resp) {
                scope.selectedPlaceInfo = resp.data.places_data[0];
            });
            if (SessionService.hasKey('userProceedToAddAttraction')) {
                $promise = AttractionService.getAttractionFor(SessionService.get('selectedPlaceId'));
                $promise.then(function (resp) {
                    scope.attractions = resp.data.attractions;
                    if (SessionService.hasKey('userAttractions')) {
                        var alreadySelectedAttractions = JSON.parse(SessionService.get('user')).attractionsList;
                        for (var i = 0; i < alreadySelectedAttractions.length; i++) {
                            for (var y = 0; y < scope.attractions.length; y++) {
                                if (alredySelectedAttractions[i].id == scope.attractions[y].id) {
                                    scope.attractions.splice(y, 1);
                                }
                            }
                        }
                    }
                });
                if (location.$$path.split('/')[1] == 'plan-a-trip') {
                    switch (location.$$path.split('/')[2]) {
                        case undefined :
                            scope.userAtAddAttraction = true;
                            break;
                        case  "personal-information":
                            scope.user.planType = "Book";
                            scope.userAtAddInformation = true;
                            break;
                        case "view-and-pay":
                            scope.user.planType = "Plan";
                            scope.userAtSubmitPlan = true;
                            break;
                        case "view-and-submit":
                            scope.user.planType = "Book";
                            scope.userAtSubmitPlan = true;
                            break;
                        default :
                            //user has typed something. smart. send him back to home
                            location.path('/home');
                            break;
                    }
                } else {
                    location.path('/plan-a-trip');
                }
            } else {
                location.path('/home');
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
            scope.userAtSubmitPlan = false;
        };

        // user is asking to submit the plan
        scope.proceedToSubmitThePlan = function (userPersonalInfo) {
            scope.userAtAddAttraction = false;
            scope.userAtAddInformation = false;
            scope.userAtSubmitPlan = true;
            if(scope.user.book != undefined) {
                var tmp = [];
                if (userPersonalInfo.hotelPref != undefined) {
                    for (var i = 0; i < hotelTypes.length; i++) {
                        if (userPersonalInfo.hotelPref[i] != undefined && userPersonalInfo.hotelPref.i != false) {
                            tmp.push(hotelTypes[i]);
                        }
                    }
                }
                scope.user.book.hotels = tmp.toString();
                tmp = [];
                if (userPersonalInfo.amenitiesPref != undefined) {
                    for (i = 0; i < amenities.length; i++) {
                        if (userPersonalInfo.amenitiesPref[i] != undefined && userPersonalInfo.amenitiesPref.i != false) {
                            tmp.push(amenities[i]);
                        }
                    }
                }
                if(scope.user.book.travelPref != 'No Preference'){
                    scope.user.book.travel = scope.user.book.travelPref+", "+ scope.user.book.travelBy;
                }else{
                    scope.user.book.travel = 'No Preference';
                }
                scope.user.book.amenities = tmp.toString();
            }
            scope.user.selectedPlace = scope.selectedPlaceInfo.place_name +", "+ scope.selectedPlaceInfo.place_region_name;
            scope.user.journeyStartingDate =scope.user.startingDateMonth+" "+scope.user.startingDateDay+", "+scope.user.startingDateYear;
            scope.user.selectedPlaceId = scope.selectedPlaceInfo.id;

            console.log(JSON.stringify(scope.user));
            $http.post('../anandsh/api/slim.php/tourepedia/submitPlan',scope.user).
                 success(function(data, status) {
                   console.log(data);
            });

            SessionService.set('user', (scope.user));
        };


        scope.submitThePlan = function () {
            showNotification("Plan successfully submitted.", "rgb(26, 188, 156)", 4);

            // SessionService.destroy('selectedPlaceId');
            // SessionService.destroy('userProceedToAddAttraction');
            // SessionService.destroy('user');
            // location.path('/home');
        };

        // function to add use selected attraction to user attraction list
        scope.addAttractionToList = function (attraction) {
            scope.attractions.splice(scope.attractions.indexOf(attraction), 1);
            scope.user.attractionsList.push(attraction);
            SessionService.set('user', JSON.stringify(scope.user));
            showNotification("Attraction added to list.", "rgb(52, 73, 94)", 2);
        };

        // function to remove attraction from users list
        scope.removeAttractionFromList = function (attraction) {
            scope.user.attractionsList.splice(scope.user.attractionsList.indexOf(attraction), 1);
            scope.attractions.push(attraction);
            SessionService.set('user', JSON.stringify(scope.user));
            showNotification("Attraction removed from list.", "rgb(231, 76, 60)", 1);
        };

    }]);

app.controller('SignUpController', ['$scope', 'LoginSignUpService','$rootScope','SessionService',
    function ($scope, SignUpService, rootScope, SessionService) {

        $scope.newUser = {};
        $scope.everyThingAlright = function (newValue) {
            var validName = (newValue.fullName != undefined && newValue.fullName != '');
            var validMobileNumber = (newValue.mobileNumber != undefined && newValue.mobileNumber != '');
            var validEmail = (newValue.email != undefined && newValue.email != '');
            var validPassword = (newValue.password != undefined && newValue.password != '');
            var validRePassword = (newValue.rePassword != undefined && newValue.rePassword != '');
            var passwordMatch = (validPassword && validRePassword) && (newValue.password == newValue.rePassword);
            return validName && validMobileNumber && validEmail && validPassword && validRePassword && passwordMatch;
        };
        $scope.registerUser = function (newUser) {
            console.log(newUser);
            signUpInProgress = true;
            var $promise = SignUpService.signUp(newUser);
            $promise.then( function(resp){
                signUpInProgress = false;
                var data = resp.data;
console.log('sssssssssss');
                console.log(data);
                if(data.registerStatus == "already registered"){
                    showNotification('Email already exists. Please choose a different email address to signup.', "red", "5");
                }else if(data.registerStatus == "successfully registered"){
                    showNotification('Registration complete.', "skyblue", "2");
                    CloseDialog('signUp-dialog');
                    rootScope.isLoggedIn = true;
                    SessionService.set('userId', data.userEmail);
                }
            });
        };
    }]);

app.controller('LoginController', ['$scope', 'LoginSignUpService', '$rootScope','SessionService',
    function ($scope, LoginService, $rootScope, SessionService) {
        $scope.login = function (user) {
            if (!$rootScope.isLoggedIn) {
                loginInProgress = true;
                var $promise = LoginService.login(user);
                $promise.then( function (resp) {
                    loginInProgress = false;
                    var data = resp.data;
                    if(data.loginStatus == "login failure"){
                        showNotification("email-password combination don't match", "red", "4");
                    }else if(data.loginStatus == "success"){
                        $rootScope.isLoggedIn = true;
                        showNotification('Login Success.', "green", "2");
                        CloseDialog('login-dialog')
                        SessionService.set('userId', data.userEmail);
                    }
                });
            }else{
                console.log("user already logged in");
                CloseDialog('login-dialog')
            }
        };
    }]);
