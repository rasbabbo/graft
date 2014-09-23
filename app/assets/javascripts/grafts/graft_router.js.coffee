class Router

	constructor: (@routeProvider, @locationProvider) ->
		console.log("Initializing Router")
		console.log("setting up!")
		@routeProvider			
			.when "/",
				templateUrl: "/graft_templates",
				controller: "GraftCtrl as grafts"
			.when "/grafts",
				templateUrl: "/graft_templates",
				controller: "GraftCtrl as grafts"

		@locationProvider.html5Mode(true)

GraftRouter = angular.module("GraftRouter", ["ngRoute"])

GraftRouter.config(["$routeProvider", "$locationProvider", Router])

GraftRouter.config(["$httpProvider", ($httpProvider) ->
	$httpProvider.defaults.headers.common['X-CSRF-Token'] = $('meta[name=csrf-token]').attr('content')
	])
	