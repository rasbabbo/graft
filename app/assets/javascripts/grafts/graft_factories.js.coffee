GraftFactories = angular.module("GraftFactories", [])

GraftFactories.factory("Graft", ["$http", ($http) ->
	return {
		all: () ->
			console.log("geting something")
 	}

	])