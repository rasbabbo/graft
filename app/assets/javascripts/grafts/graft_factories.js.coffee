GraftFactories = angular.module("GraftFactories", [])

GraftFactories.factory("Graft", ["$http", ($http) ->
	return {
		all: () ->
			console.log("geting something")
			$http.get("/thegrafts.json").success (data) ->
				console.log(data)
		,

		create: (newGraft) ->
			console.log(newGraft)
			$http.post("thegrafts.json", (thegraft: newGraft))

 		}
])