/**
 * Created by Sudhir on 17-Jun-15.
 */
app.service('PlacesService', ['$http', function ($http) {

    this.placeInfo = function (scope) {
        return $http.get('./api/slim.php/region/places');
    };

    this.placeDataForPlace = function (placeId) {
        return $http.get('api/slim.php/places/' + placeId);
    }
}]);


app.service('AttractionService', ['$http', function ($http) {

    this.getAttractionFor = function (placeId) {
        return $http.get('api/slim.php/' + placeId + '/attractions');
    };

    this.getRelatedPrePlannedAttractionFor = function (placeId) {
        return [];
    };
}]);


app.factory('LoginSignUpService', ['$http', 'SessionService', function ($http, SessionService) {
    return {
        login: function (user) {
            var data = {
                email: user.email,
                pwd: user.password
            };
            return $http.post('api/slim.php/auth/process', data);
        },
        logout: function () {
            SessionService.destroy('userId');
            return $http.get('api/slim.php/auth/logout');
        },
        isLoggedIn: function () {
            return $http.post('api/slim.php/auth/isLoggedIn');
        },
        signUp: function (newUser) {
            var data = {
                'email': newUser.email,
                'pwd': newUser.password,
                'fullName': newUser.fullName,
                'mobileNumber': newUser.mobileNumber
            };
            return $http.post('api/slim.php/register', data);
        }
    }
}]);

app.factory('SessionService', [function () {
    return {
        set: function (key, value) {
            return sessionStorage.setItem(key, value);
        },
        get: function (key) {
            return sessionStorage.getItem(key);
        },
        destroy: function (key) {
            return sessionStorage.removeItem(key);
        },
        hasKey: function (key) {
            return sessionStorage.getItem(key) != undefined;
        }
    };
}]);