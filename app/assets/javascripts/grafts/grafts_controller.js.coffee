GraftCtrls = angular.module("GraftCtrls", [])

class GraftCtrl

	constructor: (@scope)->
		@scope.candidatesInfo = []
		@scope.candidate = []
		@scope.apiKey = process.env.OPEN_SECRETS

	findByState: (@query, @scope, @http, @id)->
		alert "Submitted"
		@scope.id = {}

		$http.jsonp("http://opensecrets.org/api/?method=getLegislator&id=" + $scope.id + "&cycle=2012&apikey=" + @scope.apiKey + "&output=json")
			.success (data)->
			$scope.candidatesInfo.push(data)
				.error()->
					alert "Try again"
				render "/select"

	listCand: (@http, @scope, @cid)->
		$http.jsonp("http://www.opensecrets.org/api/?method=candSummary&cid=" +$scope.cid+"&cycle=2012&apikey="+@scope.apiKey+"$output=json")
		

		# $http.get("http://opensecrets.org/api/?method=getLegislator&id=" + @scope.state.id + "&cycle=2012&apikey=" + process.env.OPEN_SECRETS + "&output=json")
		# 	.success (data)->
		# 	@scope.candidatesInfo = data

	chooseCand: (@http, @scope, @id)

	sayHello: ()->
		"come an and work"

GraftCtrls.controller("GraftCtrl", ["$scope", "$http", GraftCtrl])