GraftFactories = angular.module("GraftFactories", [])

GraftFactories.factory("User", ["$http", ($http) ->
	return {
		all: () ->
			console.log("geting something")
			$http.get("/users.json").success (data) ->
				console.log(data)
		,
		create: (newUser) ->
			console.log(newUser)
			$http.post("users.json", (user: newUser))

 		}
])