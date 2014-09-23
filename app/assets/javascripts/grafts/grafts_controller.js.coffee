GraftCtrls = angular.module("GraftCtrls", [])

class GraftCtrl

	constructor: (@scope)->
		@scope.candidatesInfo = []
		@scope.apiKey = process.env.OPEN_SECRETS

	findByState: (@query, @scope, @http, @id)->
		alert "Submitted"
		@scope.id = {}

		$http.get("http://opensecrets.org/api/?method=getLegislator&id=" + $scope.id + "&cycle=2012&apikey=" + @scope.apiKey + "&output=json")
			.success (data)->
			$scope.candidatesInfo = data

	sayHello: ()->
		"come an and work"




GraftCtrls.controller("GraftCtrl", ["$scope", "$http", GraftCtrl])