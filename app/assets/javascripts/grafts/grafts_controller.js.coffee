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
			console.log (data)
		.error (data)->
			console.log "Try again"
		@http.post()

	findPers: (cid)->
		console.log "checking person"
		@http.get("legislator/"+cid+".json").completed (data)=>
			console.log(data)
		.error (data)->
			console.log "Problem w/ search"
			

	sayHello: ()->
		"come an and work"

GraftCtrls.controller("GraftCtrl", ["$scope", "$http", GraftCtrl])