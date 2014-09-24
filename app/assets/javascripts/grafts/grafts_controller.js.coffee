GraftCtrls = angular.module("GraftCtrls", [])

class GraftCtrl

	constructor: (@scope, @http)->
		@scope.candidatesInfo = []
		@scope.candidate = []
		@scope.apiKey = "372c032ce003d03628fd519bd97d5f7e"
		@scope.cid = {}

	findBy: (id)->
		console.log "Blahhhh"
		console.log "@http.get", @http.get
		@http.get("/legislators/"+id+".json").completed (data) =>
			console.log(results)
		.error (data)->
			console.log "Try again"

	# listCand: (@cid)->
	# 	$http.jsonp("http://www.opensecrets.org/api/?method=candSummary&cid=" +@scope.cid+"&cycle=2012&apikey="+@scope.apiKey+"&output=json")			
	# 	.success (data)->
	# 		@scope.candidate.push(data)
	# 			.error ()->
	# 				alert "No worky"

	sayHello: ()->
		"come an and work"

GraftCtrls.controller("GraftCtrl", ["$scope", "$http", GraftCtrl])