GraftRouter = angular.module("GraftRouter", [
	"ngRoute"
])

class Router

	constructor: (@routeProvider, @locationProvider) ->
		console.log("Initializing Router")
		console.log("setting up holmes!")
		@routeProvider.
			when "/",
				templateUrl: "/graft_templates",
				controller: "GraftsCtrl as grafts"
			.when "/grafts",
				templateUrl: "/graft_templates",
				controller: "GraftsCtrl as grafts"

			@locationProvider.html5Mode(true)

GraftRouter.config(["$routeProvider", "locationProvider", Router])

GraftRouter.config(["$httpProvider", ($httpProvider) ->
	$httpProvider.defaults.headers.common['X-CSRF-Token'] = $('meta[name=csrf-token]').attr('content')
	])
	