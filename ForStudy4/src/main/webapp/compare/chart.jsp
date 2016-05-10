<%@ page language="java" contentType="text/html; charset=utf-8"
   pageEncoding="utf-8"%>
   <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<link rel="stylesheet" href="css/chartnormalize.css">
<link rel="stylesheet" href="css/chartstyle.css">
<script type="text/javascript" src="https://www.google.com/jsapi"></script>
</head>
<body>
   
   <canvas id="myChart" style="margin-left:260px; "></canvas>
   
   <script src='http://www.chartjs.org/assets/Chart.min.js'></script>
   
   <script type="text/javascript">
//Based on a pen by @tedgoas
var ctx = document.getElementById("myChart").getContext("2d");
var maxnum = 0;
var colorchange=["rgba(43,176,212,","rgba(140,200,50,","rgba(67,137,162,","rgba(113,178,128,","rgba(43,192,228,",
                 "rgba(147,249,185,","rgba(247,187,151,"];
var i=0;
var data = { 
    labels: ["가격", "정원", "교습시간", "강사수", "평점"],
      
    datasets: [
      <c:forEach var="d" items="${copylist}">
        {   
           
            label: "${d.ac_name}",
            fillColor: colorchange[i]+".4)",
            strokeColor: colorchange[i]+"1)",
            pointColor: colorchange[i]+"1)",
            pointHighlightStroke: colorchange[i++]+"1)",
            data: ['${d.ac_totalval}','${d.ac_inwon}' ,'${d.ac_time}', '${d.ac_teacher}', '${d.ac_masterDTO.ac_reviewavg}'],
            
        },
        </c:forEach>
        
    ]
};


new Chart(ctx).Radar(data, {
   animationSteps: 30,
   animationEasing: "easeInOutExpo",
   responsive: true,
   showTooltips: true,
   scaleOverride: true,
    scaleSteps: 5,
    scaleStepWidth: 20,
    scaleStartValue: 0,
    scaleLineColor: "rgba(0,0,0,.15)",
   
    angleShowLineOut: true,
    angleLineWidth : 1,
    angleLineColor : "rgba(0,0,0,.15)",
    pointLabelFontFamily : "'freight-sans-pro', Calibri, Candara, Segoe, 'Segoe UI', Optima, Arial, sans-serif",
    pointLabelFontSize : 14,
   pointLabelFontColor : "#99b",
   pointDot : false,
   datasetStrokeWidth : 1
});
/* function maxdata(data){
   for(var i=0;i<data.length;i++){
      for(var j=0;j<data.length;j++){
         if(i!=j){
            if(data[i]>=data[j]){
               if(data[i]>=maxnum){
                  maxnum=data[i];
               }
            }
         }         
      }   
   }
} */


</script>

<script type="text/javascript">
(function() {
	  var barHeight, chartHeight, createAxis, createBars, createCategories, createColumn, createGroups, createValuesElements, data, highlight, offset, resetColor, scale, series, svg, titleArea, width;
	  
	  data = [
	    {
	      categories: [
	        {
	          name: "가격",
	          values: [
				<c:forEach var="d" items="${copylist}">
	            {
	              percent: '${d.ac_totalval}',
	              value: 5.1
	            }, 
	            </c:forEach>
	          ]
	        }, {
	          name: "정원",
	          values: [
				<c:forEach var="d" items="${copylist}">
				{
				  percent: '${d.ac_inwon}',
				  value: 5.1
				}, 
				</c:forEach>
	          ]
	        }, {
	          name: "교습시간",
	          values: [
				<c:forEach var="d" items="${copylist}">
				{
				  percent: '${d.ac_time}',
				  value: 5.1
				}, 
				</c:forEach>
	          ]
	        }, {
		          name: "강사수",
		          values: [
				<c:forEach var="d" items="${copylist}">
				{
				  percent: '${d.ac_teacher}',
				  value: 5.1
				}, 
				</c:forEach>
		          ]
		        }, {
			          name: "평점",
			          values: [
   				<c:forEach var="d" items="${copylist}">
				{
				  percent: '${d.ac_masterDTO.ac_reviewavg}',
				  value: 5.1
				}, 
				</c:forEach>
			          ]
			        }
	      ]
	    }
	  ];

	  width = 500;

	  barHeight = 20;

	  offset = {
	    category: 15,
	    group: 30
	  };

	  scale = d3.scale.linear().domain([0, 100]).range([0, width]);

	  highlight = function() {
	    var el;
	    el = d3.select(this);
	    el.style("fill", d3.rgb(el.style("fill")).darker(0.8));
	    return d3.select($(this).parent()[0]).select("text.column-value").style("font-weight", "bold");
	  };

	  resetColor = function() {
	    d3.select(this).style("fill", null);
	    return d3.select($(this).parent()[0]).select("text.column-value").style("font-weight", null);
	  };

	  createColumn = function(g) {
	    return g.append("text").attr("class", "column-value").attr("transform", "translate(" + (width + 100) + ",0)").attr("y", function(d, i) {
	      return i * barHeight;
	    }).attr("dy", 13).attr("text-anchor", "middle").text(function(d) {
	      return d.value.toFixed(1);
	    });
	  };

	  createBars = function(g) {
	    var label, rect;
	    rect = g.append("rect");
	    rect.attr("width", 0).attr("height", barHeight).attr("y", function(d, i) {
	      return i * barHeight;
	    }).attr("class", function(d, i) {
	      return "bar" + (i + 1);
	    }).on("mouseover", highlight).on("mouseout", resetColor);
	    rect.transition().duration(1000).attr("width", function(d) {
	      return scale(d.percent);
	    });
	    label = g.append("text").attr("class", "bar-percentage").attr("dx", 3).attr("dy", "1.2em").attr("y", function(d, i) {
	      return i * barHeight;
	    }).text(function(d) {
	      return d.percent + "%";
	    });
	    return label.transition().duration(function(d, i) {
	      return 1000 + i * 100;
	    }).attr("x", function(d) {
	      return scale(d.percent);
	    });
	  };

	  createValuesElements = function(g) {
	    return g.each(function(d, i) {
	      var bar;
	      bar = d3.select(this).selectAll("g").data(d.values).enter().append("g");
	      bar.call(createBars);
	      return bar.call(createColumn);
	    });
	  };

	  createCategories = function(g) {
	    g.attr("class", "category").attr("height", function(d) {
	      return d.values.length * barHeight;
	    }).attr("transform", function(d, i) {
	      return "translate(0," + (i * (d.values.length * barHeight + offset.category)) + ")";
	    });
	    g.append("text").text(function(d) {
	      return d.name;
	    }).attr("transform", "translate(100,0)").attr("y", function(d) {
	      return d.values.length * barHeight / 2;
	    }).attr("dy", ".5em").attr("text-anchor", "end");
	    return g.append("g").attr("class", "bars").attr("transform", "translate(110,0)").call(createValuesElements);
	  };

	  createGroups = function(g) {
	    return g.each(function(d, i) {
	      var group, groupWidth;
	      groupWidth = chartHeight([d]) - offset.group;
	      group = d3.select(this);
	      group.attr("transform", "translate(0," + (chartHeight(data.slice(0, i))) + ")");
	      g = group.append("g");
	      g.attr("class", "group").attr("transform", "translate(0," + groupWidth + ") rotate(-90)");
	      g.append("rect").attr("height", 25).attr("width", groupWidth);
	      g.append("text").text(function(d) {
	        return d.name;
	      }).attr("dy", "1.1em").attr("x", groupWidth / 2).attr("text-anchor", "middle");
	      return group.append("g").attr("class", "categories").attr("transform", "translate(30, 0)").selectAll("g").data(d.categories).enter().append("g").call(createCategories);
	    });
	  };

	  createAxis = function(height) {
	    return function(g) {
	      var axis, id;
	      axis = d3.svg.axis().scale(d3.scale.linear().domain([0, 1]).range([0, width])).orient('top').ticks(10).tickSize(5, 0, -2).tickFormat(d3.format("%"));
	      g.append("g").attr("transform", "translate(0,30)").attr("class", "axis").call(axis);
	      id = d3.scale.identity().domain([0, 100]);
	      return g.append("g").attr("transform", "translate(0,30)").selectAll("line").data(id.ticks(10)).enter().append("line").attr("class", "x-line").attr("x1", function(d) {
	        return scale(d);
	      }).attr("x2", function(d) {
	        return scale(d);
	      }).attr("y1", -4).attr("y2", height + 8).style("stroke", "gray");
	    };
	  };

	  chartHeight = function(d) {
	    var add, categoryHeight, groupHeight;
	    add = function(i, s) {
	      return i + s;
	    };
	    categoryHeight = function(category) {
	      return category.values.length * barHeight;
	    };
	    groupHeight = function(group) {
	      return _(group.categories).map(categoryHeight).reduce(add) + (group.categories.length - 1) * offset.category;
	    };
	    return _(d).map(groupHeight).reduce(add) + d.length * offset.group;
	  };

	  svg = d3.select(".chart").append("svg").attr("width", width + 400).attr("height", chartHeight(data) + 50);

	  titleArea = svg.append("g").attr("transform", "translate(150,10)").attr("class", "title");

	  titleArea.append("text").attr("x", width / 2).attr("dy", "1.4em").attr("text-anchor", "middle").text("Chart title");

// 	  titleArea.append("text").attr("x", width + 100).attr("dy", "1.4em").attr("text-anchor", "middle").text("Column title");

	  svg.append("g").attr("class", "axis").attr("height", 30).attr("transform", "translate(150, 40)").call(createAxis(chartHeight(data)));

	  svg.append("g").attr("class", "groups").attr("transform", "translate(10,80)").selectAll("g").data(data).enter().append("g").call(createGroups);

	  svg.select(".bars").selectAll("g").data(series).append("text").attr("class", function(d, i) {
	    return "bar-label" + (i + 1);
	  }).attr("dy", "1.25em").attr("y", function(d, i) {
	    return i * barHeight;
	  }).attr("dx", 5).text(function(d) {
	    return d;
	  });

	}).call(this);
</script>
  <script src='http://d3js.org/d3.v3.min.js'></script>
<script src='http://cdnjs.cloudflare.com/ajax/libs/lodash.js/1.2.1/lodash.min.js'></script>
<div class='chart'></div>

</body>
</html>