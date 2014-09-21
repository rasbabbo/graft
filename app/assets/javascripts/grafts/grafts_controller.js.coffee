GraftCtrls = angular.module("GraftCtrls", [])

class GraftsCtrl

	constructor: (@scope, @User) ->
		@greeting = "Fuck off motherscratchers!"
		@User.all()
		return this

	addUser: (newUser) ->
		@User.create(newUser)
		.success (data) ->
			console.log(data)

	sayHello: () ->
		"crazy-ass beyotch"


GraftCtrls.controller("GraftsCtrl", ["$scope", "Graft", GraftsCtrl])