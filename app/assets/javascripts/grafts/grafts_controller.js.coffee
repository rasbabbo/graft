GraftCtrls = angular.module("GraftCtrls", [])

class GraftCtrl

	constructor: (@scope, @http)->
		@scope.candidatesInfo = []
		@scope.candidate = []
		@scope.cid = []
		@scope.pols = []
		@scope.donors = []
		@scope.industries = []

	findBy: (id)->
		console.log "Blahhhh"
		# console.log "@http.get", @http.get
		@http.get("/legislators/"+id+".json").success (data) =>
			console.log(data)
			@scope.pols = data.response.legislator
		.error (data)->
			console.log "Try again"

	findPers: (cid)->
		console.log "checking person"
		@http.get("legislator/"+cid+".json").success (data)=>
			console.log(data)
			@scope.candidate = data.response.summary
		.error (data)->
			console.log "Problem w/ search"

	findDon: (cid)->
		console.log "checking data"
		@http.get("donors/"+cid+".json").success (data)=>
			console.log(data)
			@scope.donors = data.response.contributors.contributor
		.error (data)->
			console.log "Problem w/ donor search"

	findInd: (cid)->
		console.log "checking findInd"
		@http.get("industries/"+cid+".json").success (data)=>
			console.log(data)
			@scope.industries = data.response
		.error (data)->
			console.log "problem w/ ind"


	sayHello: ()->
		"come an and work"

GraftCtrls.controller("GraftCtrl", ["$scope", "$http", GraftCtrl])