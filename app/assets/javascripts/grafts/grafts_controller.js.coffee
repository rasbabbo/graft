GraftCtrls = angular.module("GraftCtrls", [
	"ngResource"
])

class GraftsCtrl

	constructor: (@scope, @User) ->
		@greeting = "Hey off guys!"
		@User.all()
		return this

	addUser: (newUser) ->
		@User.create(newUser)
		.success (data) ->
			console.log(data)

	sayHello: () ->
		"come an and work"


GraftCtrls.controller("GraftCtrls", ["$scope", "User", GraftsCtrl])