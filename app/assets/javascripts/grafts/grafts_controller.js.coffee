GraftCtrls = angular.module("GraftCtrls", [
	"ngResource"
])

class GraftsCtrl
	$scope.cids = []

	$scope.getCid = ->
		$http.get("$http.get('http://opensecrets.org/api/?method=candIndustry&cid=N00007360&cycle=2012&apikey=372c032ce003d03628fd519bd97d5f7e").success (data) ->
			$scope.cids = data

	$sayHello: () ->
		"come an and work"

	executeSearch: (@scope, @query) ->



GraftCtrls.controller("GraftCtrls", ["$scope", "$http", GraftsCtrl])