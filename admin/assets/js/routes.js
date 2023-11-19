app.config(function ($routeProvider) {
  $routeProvider
    .when("/marki", {
      templateUrl: "view/marki.html",
      controller: "myCtrl"
    })
    .when("/details_marki", {
      templateUrl: "view/details_marki.html",
      controller: "myCtrl"
    })
    .when("/modeli", {
      templateUrl: "view/modeli.html",
      controller: "myCtrl"
    })
    .when("/details_modeli", {
      templateUrl: "view/details_modeli.html",
      controller: "myCtrl"
    })
    .when("/salon", {
    templateUrl: "view/salon.html",
    controller: "myCtrl"
  })
    .when("/details_salon", {
    templateUrl: "view/details_salon.html",
    controller: "myCtrl"
 });
});
