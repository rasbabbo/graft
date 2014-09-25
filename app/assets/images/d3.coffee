xScale = d3.scale.ordinal().domain(d3.range(dataset.length)).rangeRoundBands([
  0
  w
], 0.05)
yScale = d3.scale.linear().domain([
  0
  d3.max(dataset)
]).range([
  0
  h
])

#Create SVG element
svg = d3.select("body").append("svg").attr("width", w).attr("height", h)

svg.selectAll("rect").data(dataset).enter().append("rect").attr("x", (d, i) ->
  xScale i
).attr("y", (d) ->
  h - yScale(d)
).attr("width", xScale.rangeBand()).attr("height", (d) ->
  yScale d
).attr("fill", (d) ->
  "rgb(0, 0, " + (d * 10) + ")"
).on("mouseover", (d) ->
  xPosition = parseFloat(d3.select(this).attr("x")) + xScale.rangeBand() / 2
  yPosition = parseFloat(d3.select(this).attr("y")) / 2 + h / 2
  d3.select("#tooltip").style("left", xPosition + "px").style("top", yPosition + "px").select("#value").text d
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
  
  #Flip value of sortOrder
  sortOrder = not sortOrder
  svg.selectAll("rect").sort((a, b) ->
    if sortOrder
      d3.ascending a, b
    else
      d3.descending a, b
  ).transition().delay((d, i) ->
    i * 50
  ).duration(1000).attr "x", (d, i) ->
    xScale i

  return