GraftCtrls = angular.module("GraftCtrls", [])

class GraftCtrl

	constructor: (@scope, @http)->
		@scope.candidatesInfo = []
		@scope.candidate = []
		@scope.cid = []
		@scope.pols = []
		@scope.donors = []
		@scope.industries = []

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
			@scope.donors= results

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


	sayHello: ()->
		"come an and work"

	graphChart:  ()=>
    var w = 600;
    var h = 250;
    
    var dataset = @scope.industries

    var xScale = d3.scale.ordinal()
                 	 .domain(d3.range(dataset.length))
                 	 .rangeRoundBands([0, w], 0.05);

    var yScale = d3.scale.linear()
                   .domain([0, d3.max(dataset)])
                   .range([0, h]);
    

    var svg = d3.select("body")
                .append("svg")
                .attr("width", w)
                .attr("height", h);

    //make bars
    svg.selectAll("rect")
       .data(dataset)
       .enter()
       .append("rect")
       .attr("x", function(d, i) {
            return xScale(i);
       })
       .attr("y", function(d) {
            return h - yScale(d);
       })
       .attr("width", xScale.rangeBand())
       .attr("height", function(d) {
            return yScale(d);
       })
       .attr("fill", function(d) {
            return "rgb(0, 0, " + (d * 10) + ")";
       })
       .on("mouseover", (d) ->

            //Get this bar's x/y values, then augment for the tooltip
            var xPosition = parseFloat(d3.select(this).attr("x")) + xScale.rangeBand() / 2;
            var yPosition = parseFloat(d3.select(this).attr("y")) / 2 + h / 2;

            //Update the tooltip position and value
            d3.select("#tooltip")
                .style("left", xPosition + "px")
                .style("top", yPosition + "px")                     
                .select("#value")
                .text(d);
       
            //Show the tooltip
            d3.select("#tooltip").classed("hidden", false);

       )
       .on("mouseout", () ->
       		d3.select("#tooltip").classed("hidden", true); 
       )
       .on("click", () ->
          sortBars();
       );

    var sortOrder = false;
    
    var sortBars = () ->
	    sortOrder = !sortOrder;

	    svg.selectAll("rect")
			.sort((a, b) ->
			    if (sortOrder) {
			        return d3.ascending(a, b);
			    } else {
			        return d3.descending(a, b);
			    }
			)
			.transition()
			.delay((d, i) ->
			   return i * 50;
			)
			.duration(1000)
			.attr("x", (d, i) ->
			    return xScale(i);
			);

           
      

GraftCtrls.controller("GraftCtrl", ["$scope", "$http", GraftCtrl])