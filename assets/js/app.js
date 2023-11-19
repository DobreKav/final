var app = angular.module("myApp", ["ngRoute"]);
app.controller("myCtrl", function ($scope, $http) {
  $scope.getPosition = 0;
  $scope.getIndex = function (index) {
    $scope.getPosition = index;
  };

  function postData(file_name, postObj) {
    $http({
      method: "POST",
      url: "model/" + file_name + ".php",
      data: postObj,
    }).then(function mySuccess(response) {});
  }
  $scope.deleteRow = function (table_name, pk_value) {
    var objDelete = [{ table_name: table_name, pk_value: pk_value }];
    console.log(objDelete);
    postData("delete", objDelete);
  };

  $scope.marki = [];
  $http.get("model/select.php?table_name=marki").then(function (response) {
    console.log(response.data);
    $scope.marki = response.data;
  });

  $scope.modeli = [];
  $http.get("model/select.php?table_name=modeli").then(function (response) {
    $scope.modeli = response.data;
  });

  $scope.salon = [];
  $http.get("model/select.php?table_name=salon").then(function (response) {
    $scope.salon = response.data;
  });

  $scope.city = [];
  $http.get("model/select.php?table_name=city").then(function (response) {
    $scope.city = response.data;
  });

  //Function
  $scope.details_marki = function (marka_name, country, salon_id, img_path) {
    // $scope.alert_danger=false;
    var markiObj = [
      {
        marka_name: marka_name,
        country: country,
        salon_id: salon_id,
        img_path: img_path,
        table_name: "marki",
      },
    ];
    console.log(markiObj);
    postData("insert", markiObj);
  };

  $scope.details_modeli = function (model_name, color, fuel, price, marki_id) {
    // $scope.alert_danger=false;
    var modeliObj = [
      {
        model_name: model_name,
        color: color,
        fuel: fuel,
        price: price,
        marki_id: marki_id,
        table_name: "modeli",
      },
    ];
    console.log(modeliObj);
    postData("insert", modeliObj);
  };
  $scope.details_salon = function (city, address, tel) {
    // $scope.alert_danger=false;
    var salonObj = [
      { city: city, address: address, tel: tel, table_name: "salon" },
    ];
    console.log(salonObj);
    postData("insert", salonObj);
  };
});

// 	objDukani.push(
// 		{
// 			"ime": ime,
// 			"adresa": adresa
// 		}
// 		);
// 	console.log(objDukani);
// 	$scope.alert_succ=true;
// }
// $scope.erorr=function(){
// 	$scope.alert_succ=false;
// 	$scope.alert_danger=true;
// };
// });
