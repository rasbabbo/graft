GraftCtrls = angular.module("GraftCtrls", [])

class GraftCtrl

	constructor: (@scope, @http)->
		@scope.candidatesInfo = []
		@scope.candidate = []
		@scope.cid = []
		@scope.pols = []
		@scope.donors = []
		@scope.industries = []

	reset: ()->
		@scope.candidatesInfo = []
		@scope.candidate = []
		@scope.cid = []
		@scope.pols = []
		@scope.donors = []
		@scope.industries = []
		@scope.id = []
		d3.select("svg").remove()
		d3.select("svg").remove()
		d3.select("svg").remove()
		d3.select("svg").remove()


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
			@scope.industries = {}
			@scope.donors = {}
		.error (data)->
			console.log "Problem w/ search"

	findDon: (cid)->
		console.log "checking data"
		@http.get("donors/"+cid+".json").success (data)=>
			console.log(data)
			results = {}
			data.response.contributors.contributor.forEach (item)->
				results[item['@attributes'].org_name] = item['@attributes'].total
			@scope.donors = results
			@graphChartD()

		.error (data)->
			console.log "Problem w/ donor search"

	findInd: (cid)->
		console.log "checking findInd"
		@http.get("industries/"+cid+".json").success (data)=>
			console.log(data)
			
			results = {}
			data.response.industries.industry.forEach (item)->
				results[item['@attributes'].industry_name] = item['@attributes'].total
			@scope.industries = results
			@graphChart()


	sayHello: ()->
		"come an and work"

	graphChart:  ()=>
		console.log "running"
		w = 600;
		h = 250;

		dataset = []
		domain = []
		for key of @scope.industries 
			dataset.push(@scope.industries[key])
			domain.push key

		console.log(dataset)
		xScale = d3.scale.ordinal().domain(d3.range(dataset.length)).rangeRoundBands([
			0,
			w
		], 0.05)

		yScale = d3.scale.linear().domain([0, d3.max(dataset)]).range([0, h])

		svg = d3.select("#graph").append("svg").attr("width", w).attr("height", h)

		svg.selectAll("rect")
		.data(dataset).enter()
		.append("rect").attr("x", (d, i) ->
			xScale i
		).attr("y", (d) ->
			h - yScale(d)
		).attr("width", xScale.rangeBand()).attr("height", (d) ->
			yScale d
		).attr("fill", (d) ->
			"rgb(0, 0, " + (d * 10) + ")"
		).on("mouseover", (d, index) ->
			console.log arguments
			if sortOrder 
				index = dataset.length - index - 1
			xPosition = parseFloat(d3.select(this).attr("x")) + xScale.rangeBand() / 2
			yPosition = parseFloat(d3.select(this).attr("y")) + h / 2
			d3.select("#tooltip").style("left", xPosition + "px").style("top", yPosition).select("#value").text domain[index] + " $" + d 
			d3.select("#tooltip").classed "hidden", false
			return
		).on("mouseout", ->
			d3.select("#tooltip").classed "hidden", true
			return
		).on "click", ->
			sortBars()
			return

		sortOrder = false

	graphChartD:  ()=>
		console.log "running"
		w = 600;
		h = 250;

		dataset = []
		domain = []
		for key of @scope.donors 
			dataset.push(@scope.donors[key])
			domain.push key

		console.log(dataset)
		xScale = d3.scale.ordinal().domain(d3.range(dataset.length)).rangeRoundBands([
			0,
			w
		], 0.05)

		yScale = d3.scale.linear().domain([0, d3.max(dataset)]).range([0, h])

		svg = d3.select("#graph").append("svg").attr("width", w).attr("height", h)

		svg.selectAll("rect")
		.data(dataset).enter()
		.append("rect").attr("x", (d, i) ->
			xScale i
		).attr("y", (d) ->
			h - yScale(d)
		).attr("width", xScale.rangeBand()).attr("height", (d) ->
			yScale d
		).attr("fill", (d) ->
			"rgb(0, 0, " + (d * 10) + ")"
		).on("mouseover", (d, index) ->
			console.log arguments
			if sortOrder 
				index = dataset.length - index - 1
			xPosition = parseFloat(d3.select(this).attr("x")) + xScale.rangeBand() / 2
			yPosition = parseFloat(d3.select(this).attr("y")) + h / 2
			d3.select("#tooltip").style("left", xPosition + "px").style("top", yPosition).select("#value").text domain[index] + " $" + d 
			d3.select("#tooltip").classed "hidden", false
			return
		).on("mouseout", ->
			d3.select("#tooltip").classed "hidden", true
			return
		).on "click", ->
			sortBars()
			return

		sortOrder = false

		sortBars = ->
			sortOrder = !sortOrder
			svg.selectAll("rect")
			.sort( (a, b) ->
				if sortOrder
					return d3.ascending a, b
				else	
					return d3.descending a, b
			).transition()
			.delay( (d, i) ->
				i * 50
			).duration(1000)
			.attr "x", (d, i) ->
				return xScale i



           
      

GraftCtrls.controller("GraftCtrl", ["$scope", "$http", GraftCtrl])