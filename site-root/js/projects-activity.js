var svg = d3.select("svg"),
  margin = {top: 20, right: 20, bottom: 30, left: 40},
  width = +svg.attr("width") - margin.left - margin.right,
  height = +svg.attr("height") - margin.top - margin.bottom,
  g = svg.append("g").attr("transform", "translate(" + margin.left + "," + margin.top + ")");

var x = d3.scaleBand()
  .rangeRound([0, width])
  .paddingInner(0.05)
  .align(0.1);

var y = d3.scaleLinear()
  .rangeRound([height, 0]);

var z = d3.scaleOrdinal()
  .range(d3.schemeCategory20);

function getProjects(commits) {
  let projects = Object.keys(commits)
    .map(date => Object.keys(commits[date]))
    .reduce((a, b) => a.concat(b));
  return [...new Set(projects)];
}

function getTimeline(commits) {
  let projects = getProjects(commits);
  let eventsModel = {date: ''};
  projects.forEach(a => eventsModel[a] = 0);

  dates = Object.keys(commits)
  dates = getDates(dates);

  let timeline = dates.map((date, index) => {
    let events = Object.assign({}, eventsModel);
    events.date = new Date(date);
    let total = 0;

    if (date in commits) {
        Object.keys(commits[date]).forEach(project => {
          events[project] = commits[date][project];
          total += commits[date][project];
        });
    }
    events.total = total;
    return events;
  });
  timeline.columns = ['date'].concat(projects);
  console.log('Timeline: ', timeline);
  return timeline;
}

function getDates(listOfDates) {
  listOfDates.sort()
  let first = new Date(listOfDates[0]), last = new Date(listOfDates[listOfDates.length-1]);
  let itr = moment.twix(first, last).iterate("days")
  let range = [];
  while (itr.hasNext()) {
    let date = momentToDate(itr.next());
    range.push(date);
  }
  return range.slice(1);
}

function momentToDate(m) {
    return m.format("YYYY-MM-DD");
}

function entryToDate(d) {
  return (d.date.getMonth() + 1) + "-" + d.date.getDate();
}

function loadData(d) {
  var data = getTimeline(d.commitsByDate);
  var keys = data.columns.slice(1);

  x.domain(data.map(entryToDate));
  y.domain([0, d3.max(data, function(d) { return d.total; })]).nice();
  z.domain(keys);

  stack = d3.stack().keys(keys.slice().reverse())

  g.append("g")
    .selectAll("g")
    .data(stack(data))
    .enter().append("g")
      .attr("fill", function(d) { return z(d.key); })
    .selectAll("rect")
    .data(function(d) { return d; })
    .enter().append("rect")
      .attr("x", function(d) { return x(entryToDate(d.data)); })
      .attr("y", function(d) { return y(d[1]); })
      .attr("height", function(d) { return y(d[0]) - y(d[1]); })
      .attr("width", x.bandwidth())
      .on("mouseover", function() { tooltip.style("display", null); })
      .on("mouseout", function() { tooltip.style("display", "none"); })
      .on("mousemove", function(d) {
        var xPosition = d3.mouse(this)[0];
        var yPosition = d3.mouse(this)[1];
        tooltip.attr("transform", "translate(" + xPosition + "," + yPosition + ")");
        var project = d3.select(this.parentNode).datum().key;
        var numCommits = d[1] - d[0];
        var commitText = numCommits > 1 ? " commits" : " commit";
        var tooltipText = project + " - " + numCommits + commitText;
        tooltip.select("text").text(tooltipText);
    }); 

  g.append("g")
      .attr("class", "axis")
      .attr("transform", "translate(0," + height + ")")
      .call(d3.axisBottom(x));

  g.append("g")
      .attr("class", "axis")
      .call(d3.axisLeft(y).ticks(null, "s"))
    .append("text")
      .attr("x", 2)
      .attr("y", y(y.ticks().pop()) + 0.5)
      .attr("dy", "0.32em")
      .attr("fill", "#000")
      .attr("font-weight", "bold")
      .attr("text-anchor", "start")
      .text("Commits");

  var legend = g.append("g")
      .attr("font-family", "sans-serif")
      .attr("font-size", 10)
      .attr("text-anchor", "end")
    .selectAll("g")
    .data(keys)
    .enter().append("g")
      .attr("transform", function(d, i) { return "translate(0," + i * 20 + ")"; });

  legend.append("rect")
      .attr("x", width - 19)
      .attr("width", 19)
      .attr("height", 19)
      .attr("fill", z);

  legend.append("text")
      .attr("x", width - 24)
      .attr("y", 9.5)
      .attr("dy", "0.32em")
      .text(function(d) { return d; });

  var tooltip = svg.append("g")
    .attr("class", "tooltip")
    .style("display", "none");
      
  tooltip.append("text")
    .style("text-anchor", "middle")
    .attr("font-size", "12px")
    .attr("font-weight", "bold");
}

if (window.ProjectsActivityData) {
    loadData(ProjectsActivityData);
} else {
    d3.json('/projects-activity?format=json', loadData);
}


