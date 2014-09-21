GraftCtrls = angular.module("GraftCtrls", [])

class GraftCtrls

	constructor: (@scope, @User) ->
		@greeting = "Fuck off motherscratchers!"
		@User.all()
		return this

	addGraft: (newUser) ->
		@User.create(newUser)
		.success (data) ->
			console.log(data)

	sayHello: () ->
		"crazy-ass beyotch"


GraftCtrls.controller("GraftsCtrl", ["$scope", "Graft", GraftsCtrl])