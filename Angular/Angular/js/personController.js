app.controller('personCtrl2', function ($scope) {
    $scope.firstName = "John",
    $scope.lastName = "Doe",
    $scope.fullName = function () {
        return $scope.firstName + " " + $scope.lastName;
    }
});