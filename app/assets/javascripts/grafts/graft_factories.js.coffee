GraftFactories = angular.module("GraftFactories", [])

class Graft
	constructor: (@http)->

	searchOpen: (query, callback)->
 			$http.get('http://opensecrets.org/api/?method=candIndustry&cid=N00007360&cycle=2012&apikey=372c032ce003d03628fd519bd97d5f7e').success (data) ->
 				console.log(data)

GraftFactories.service("Graft", ["$http", Graft])		



		# all: () ->
		# 	console.log("geting something")
		# 	$http.get("/users.json").success (data) ->
		# 		console.log(data)
		# ,
		# create: (newUser) ->
		# 	console.log(newUser)
		# 	$http.post("users.json", (user: newUser))
		# ,