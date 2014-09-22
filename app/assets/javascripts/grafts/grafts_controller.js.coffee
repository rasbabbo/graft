GraftCtrls = angular.module("GraftCtrls", ["ngResource"])

class GraftsCtrl
	$scope.candidatesInfo = []

	getId: (@query, @scope, @http) ->
		$http.get("$http.get('http://opensecrets.org/api/?method=getLegislator&id=" + $scope.state.id + "&cycle=2012&apikey=" + process.env.OPEN_SECRETS + "&output=json").success (data) ->

			push.$scope.candidatesInfo(data)
			# for (i = 0; i < returnVal.length; i ++)
			# 	candSum = {}
			# 		push.returnVal[]



	$sayHello: () ->
		"come an and work"




GraftCtrls.controller("GraftCtrls", ["$scope", "$http", GraftsCtrl])