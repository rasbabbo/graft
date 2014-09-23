GraftCtrls = angular.module("GraftCtrls", [])

class GraftCtrl

	constructor: (@scope)->
		@scope.candidatesInfo = []
		@scope.apiKey = process.env.OPEN_SECRETS

	findByState: (@query, @scope, id)->
		alert "JUST SUBMITTED!"
		# see if we can pull in state id
		# see if we can get the ENV variable for our API key

		# $http.get("http://opensecrets.org/api/?method=getLegislator&id=" + @scope.state.id + "&cycle=2012&apikey=" + process.env.OPEN_SECRETS + "&output=json")
		# 	.success (data)->
		# 	@scope.candidatesInfo = data


	sayHello: ()->
		"come an and work"

GraftCtrls.controller("GraftCtrl", ["$scope", "$http", GraftCtrl])