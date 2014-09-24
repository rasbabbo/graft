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

	findPers: (cid)->
		console.log "checking person"
		@http.get("legislator/"+cid+".json").completed (data)=>
			console.log(data)
		.error (data)->
			console.log "Problem w/ search"

	findDon: (cid)->
		console.log "checking data"
		@http.get("donors/"+cid+".json").completed (data)=>
			console.log(data)
		.error (data)->
			console.log "Problem w/ donor search"

	findInd: (cid)->
		console.log "checking findInd"
		@http.get("industries/"+cid+".json").completed (data)=>
			console.log(data)
		.error (data)->
			console.log "problem w/ ind"


	sayHello: ()->
		"come an and work"

GraftCtrls.controller("GraftCtrl", ["$scope", "$http", GraftCtrl])