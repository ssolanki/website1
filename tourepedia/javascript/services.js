/**
 * Created by Sudhir on 17-Jun-15.
 */
app.service('PlacesService', [function () {
    var places = [
        {
            "id": "shimla",
            "name": "Shimla",
            "direction": "North India",
            "location": "Himachal Pradesh, India",
            "info": "This place is famous for it's this beautiful thing",
            "image": "shimla_info_image.jpg"
        },
        {
            "id": "manali",
            "name": "Manali",
            "direction": "North East India",
            "location": "No idea, India",
            "info": "Manali is the best potions fot honeymoon and for couples",
            "image": "manali_info_image.jpg"
        },
        {
            "id": "goa",
            "name": "Goa",
            "direction": "South West India",
            "location": "India",
            "info": "If you want 'masti', you do not want to miss it",
            "image": "goa_info_image.jpg"
        },
        {
            "id": "jaipur",
            "name": "Jaipur",
            "direction": "West India",
            "location": "Rajasthan, India",
            "info": "known for its gulabi nagari. You will find ",
            "image": "jaipur_info_image.jpg"
        },
        {
            "id": "nepal",
            "name": "Nepal",
            "direction": "East India",
            "location": "Nepal, Asia",
            "info": "So beautiful place to visit",
            "image": "nepal_info_image.jpg"
        }
    ];
    this.placeInfo = function (scope) {
        scope.places = places;
    };
    this.placeDataForPlace = function (placeName) {
        for (var i = 0; i < places.length; i++) {
            if (places[i].name == placeName) {
                return places[i];
            }
        }
        return {};
    }
}]);


app.service('AttractionService', ['$http', function (http) {
    var attractions = [
        {
            "id": "attraction1",
            "placeName": "Shimla",
            "attractionName": "attraction1",
            "attractionImage": "shimla_attraction1_image.jpg",
            "attractionInfo": "This attraction include with a some thing this and that"
        },
        {
            "id": "attraction2",
            "placeName": "Shimla",
            "attractionName": "attraction2",
            "attractionImage": "shimla_attraction2_image.jpg",
            "attractionInfo": "This attraction include with a some thing this and that"
        },
        {
            "id": "attraction3",
            "placeName": "Shimla",
            "attractionName": "attraction3",
            "attractionImage": "shimla_attraction3_image.jpg",
            "attractionInfo": "This attraction include with a some thing this and that"
        },
        {
            "id": "attraction4",
            "placeName": "Shimla",
            "attractionName": "attraction4",
            "attractionImage": "shimla_attraction4_image.jpg",
            "attractionInfo": "This attraction include with a some thing this and that"
        },
        {
            "id": "attraction5",
            "placeName": "Shimla",
            "attractionName": "attraction5",
            "attractionImage": "shimla_attraction5_image.jpg",
            "attractionInfo": "This attraction include with a some thing this and that"
        },
        {
            "id": "attraction6",
            "placeName": "Shimla",
            "attractionName": "attraction6",
            "attractionImage": "shimla_attraction6_image.jpg",
            "attractionInfo": "This attraction include with a some thing this and that"
        },
        {
            "id": "attraction7",
            "placeName": "Shimla",
            "attractionName": "attraction7",
            "attractionImage": "shimla_attraction7_image.jpg",
            "attractionInfo": "This attraction include with a some thing this and that"
        },
        {
            "id": "attraction8",
            "placeName": "Shimla",
            "attractionName": "attraction8",
            "attractionImage": "shimla_attraction8_image.jpg",
            "attractionInfo": "This attraction include with a some thing this and that"
        },
        {
            "id": "attraction1",
            "placeName": "Manali",
            "attractionName": "attraction1",
            "attractionImage": "manali_attraction1_image.jpg",
            "attractionInfo": "This attraction include with a some thing this and that"
        },
        {
            "id": "attraction2",
            "placeName": "Manali",
            "attractionName": "attraction2",
            "attractionImage": "manali_attraction2_image.jpg",
            "attractionInfo": "This attraction include with a some thing this and that"
        },
        {
            "id": "attraction3",
            "placeName": "Manali",
            "attractionName": "attraction3",
            "attractionImage": "manali_attraction3_image.jpg",
            "attractionInfo": "This attraction include with a some thing this and that"
        },
        {
            "id": "attraction4",
            "placeName": "Manali",
            "attractionName": "attraction4",
            "attractionImage": "manali_attraction4_image.jpg",
            "attractionInfo": "This attraction include with a some thing this and that"
        },
        {
            "id": "attraction1",
            "placeName": "Jaipur",
            "attractionName": "attraction1",
            "attractionImage": "jaipur_attraction1_image.jpg",
            "attractionInfo": "This attraction include with a some thing this and that"
        },
        {
            "id": "attraction2",
            "placeName": "Jaipur",
            "attractionName": "attraction2",
            "attractionImage": "jaipur_attraction2_image.jpg",
            "attractionInfo": "This attraction include with a some thing this and that"
        },
        {
            "id": "attraction3",
            "placeName": "Jaipur",
            "attractionName": "attraction3",
            "attractionImage": "jaipur_attraction3_image.jpg",
            "attractionInfo": "This attraction include with a some thing this and that"
        },
        {
            "id": "attraction4",
            "placeName": "Jaipur",
            "attractionName": "attraction4",
            "attractionImage": "jaipur_attraction4_image.jpg",
            "attractionInfo": "This attraction include with a some thing this and that"
        },
        {
            "id": "attraction1",
            "placeName": "Goa",
            "attractionName": "attraction1",
            "attractionImage": "goa_attraction1_image.jpg",
            "attractionInfo": "This attraction include with a some thing this and that"
        },
        {
            "id": "attraction2",
            "placeName": "Goa",
            "attractionName": "attraction2",
            "attractionImage": "goa_attraction2_image.jpg",
            "attractionInfo": "This attraction include with a some thing this and that"
        },
        {
            "id": "attraction3",
            "placeName": "Goa",
            "attractionName": "attraction3",
            "attractionImage": "goa_attraction3_image.jpg",
            "attractionInfo": "This attraction include with a some thing this and that"
        },
        {
            "id": "attraction4",
            "placeName": "Goa",
            "attractionName": "attraction4",
            "attractionImage": "goa_attraction4_image.jpg",
            "attractionInfo": "This attraction include with a some thing this and that"
        }
    ];

    var preplannedAttraction = [
        {
            "id":"attraction1",
            "fileId" : "shimla_attraction_1",
            "placeName":"Shimla",
            "attractionName":"attraction1",
            "attractionImage":"shimla_prePlanned_1_image.jpg",
            "attractionBudget" : "30,000",
            "attractionDays" : "30",
            "attractionInfo" : "this is somethifn"
        },
        {
            "id":"attraction2",
            "fileId" : "shimla_attraction_2",
            "placeName":"Shimla",
            "attractionName":"attraction2",
            "attractionImage":"shimla_prePlanned_2_image.jpg",
            "attractionBudget" : "40,000",
            "attractionDays" : "30",
            "attractionInfo" : "this is somethifn"
        },
        {
            "id":"attraction3",
            "fileId" : "shimla_attraction_3",
            "placeName":"Shimla",
            "attractionName":"attraction3",
            "attractionImage":"shimla_prePlanned_3_image.jpg",
            "attractionBudget" : "20,000",
            "attractionDays" : "10",
            "attractionInfo" : "this is somethifn"
        }
    ];
    this.getAttractionFor = function (placeName) {
        var attractionForThisPlace = [];
        for (var i = 0; i < attractions.length; i++) {
            if (attractions[i].placeName == placeName) {
                attractionForThisPlace.push(attractions[i]);
            }
        }
        return attractionForThisPlace;
    };

    this.getRelatedPrePlannedAttractionFor = function (placeName) {
        var relatedAttractionForThisPlace = [];
        for (var i = 0; i < preplannedAttraction.length; i++) {
            if (preplannedAttraction[i].placeName == placeName) {
                relatedAttractionForThisPlace.push(preplannedAttraction[i]);
            }
        }
        return relatedAttractionForThisPlace;
    };
}]);


app.factory('LoginService', ['$http', '$location', 'SessionService', '$rootScope',
    function ($http, $location, SessionService, $rootScope) {
        return {
            login: function (user, scope) {
                $rootScope.processGoingOn = true;
                var $promise = $http.post('api/login.php', user);  // send data to server to user.php
                $promise.then(function (msg) {
                    var responseData = msg.data;
                    if (responseData['success'] == true) {
                        SessionService.set('userId', responseData['message']);
                        $rootScope.isLoggedIn = true;
                        $rootScope.processGoingOn = false;
                        CloseDialog('login-dialog');
                    }
                    else {
                        $rootScope.isLoggedIn = false;
                        $rootScope.processGoingOn = false;
                        alert(responseData['message']);
                        scope.user = "";
                    }

                })
            },
            logout: function () {
                var $promise = SessionService.destroy('userId');
                $promise.then(function () {
                    $rootScope.isLoggedIn = false;
                });
            },
            isLoggedIn: function () {
                return $http.post('api/is_logged_in.php');
            }
        }
    }]);

app.factory('SignUpService', ['$http', '$location', '$rootScope',
    function ($http, $location, $rootScope) {
        return {
            registerMe: function (newUser) {
                $rootScope.processGoingOn = true;
                var $promise = $http.post('api/register.php', newUser);  // send data to server to user.php
                $promise.then(function (msg) {
                    var responseData = msg.data;
                    if (responseData['success'] == true) {
                        alert('Registered Successfully');
                        CloseDialog("signUp-dialog");
                    }
                    else {
                        alert(responseData['message']);
                    }
                    $rootScope.processGoingOn = false;
                })
            }
        };
    }]);

app.factory('SessionService', ['$http', function ($http) {
    return {
        set: function (key, value) {
            return sessionStorage.setItem(key, value);
        },
        get: function (key) {
            return sessionStorage.getItem(key);
        },
        destroy: function (key) {
            sessionStorage.removeItem(key);
            return $http.post('assi/logout.php');
        },
        hasKey: function (key) {
            return sessionStorage.getItem(key) != undefined;
        }
    };
}]);