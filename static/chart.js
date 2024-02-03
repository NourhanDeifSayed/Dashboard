/*chart 1*/


function fetchDataAndUpdateChart() {
    fetch('/get-datachart')
        .then(response => response.json())
        .then(data => {
            updateChart(data);
        })
        .catch(error => console.error('Error:', error));
}

function updateChart(data) {
    am5.ready(function () {
        var root = am5.Root.new("chartdiv");

        // Set themes
        root.setThemes([
            am5themes_Animated.new(root)
        ]);

        // Create chart
        var chart = root.container.children.push(am5xy.XYChart.new(root, {
            panX: true,
            panY: true,
            wheelX: "panX",
            wheelY: "zoomX",
            pinchZoomX: true,
            paddingLeft: 0,
            paddingRight: 1
        }));

        // Add cursor
        var cursor = chart.set("cursor", am5xy.XYCursor.new(root, {}));
        cursor.lineY.set("visible", false);

        // Create axes
        var xRenderer = am5xy.AxisRendererX.new(root, {
            minGridDistance: 30,
            minorGridEnabled: true
        });

        xRenderer.labels.template.setAll({
            rotation: -90,
            centerY: am5.p50,
            centerX: am5.p100,
            paddingRight: 15
        });

        xRenderer.grid.template.setAll({
            location: 1
        });

        var xAxis = chart.xAxes.push(am5xy.CategoryAxis.new(root, {
            maxDeviation: 0.3,
            categoryField: "Label",  // Change this to your actual data field
            renderer: xRenderer,
            tooltip: am5.Tooltip.new(root, {})
        }));

        var yRenderer = am5xy.AxisRendererY.new(root, {
            strokeOpacity: 0.1
        });

        var yAxis = chart.yAxes.push(am5xy.ValueAxis.new(root, {
            maxDeviation: 0.3,
            renderer: yRenderer
        }));

        // Create series
        var series = chart.series.push(am5xy.ColumnSeries.new(root, {
            name: "Series 1",
            xAxis: xAxis,
            yAxis: yAxis,
            valueYField: "Count",  // Change this to your actual data field
            sequencedInterpolation: true,
            categoryXField: "Label",  // Change this to your actual data field
            tooltip: am5.Tooltip.new(root, {
                labelText: "{valueY}"
            })
        }));

        series.columns.template.setAll({ cornerRadiusTL: 5, cornerRadiusTR: 5, strokeOpacity: 0 });
        series.columns.template.adapters.add("fill", function (fill, target) {
            return chart.get("colors").getIndex(series.columns.indexOf(target));
        });

        series.columns.template.adapters.add("stroke", function (stroke, target) {
            return chart.get("colors").getIndex(series.columns.indexOf(target));
        });

        // Set data
        xAxis.data.setAll(data);
        series.data.setAll(data);

        // Make stuff animate on load
        series.appear(1000);
        chart.appear(1000, 100);
    });
}





/*chart 2*/




var root; // Declare root outside the function to make it accessible globally
var series; // Declare series outside the function
var legend; // Declare legend outside the function

function fetchDataAndUpdateChart2() {
    fetch('/get-datachart-2')
        .then(response => response.json())
        .then(data => {
            // Convert currency-formatted values to floats
            data.forEach(item => {
                item.value = parseFloat(item.value.replace(/[^\d.-]/g, ''));
            });
            updateChart2(data);
        })
        .catch(error => console.error('Error:', error));
}

function updateChart2(data) {
    am5.ready(function() {
        // Check if root already exists
        if (!root) {
            // Create root element only if it doesn't exist
            root = am5.Root.new("chartdiv-2");

            // Set themes
            root.setThemes([
                am5themes_Animated.new(root)
            ]);

            // Create chart
            var chart = root.container.children.push(am5percent.PieChart.new(root, {
                layout: root.verticalLayout
            }));

            // Create series
            series = chart.series.push(am5percent.PieSeries.new(root, {
                valueField: "value",
                categoryField: "category"
            }));

            // Create legend
            legend = chart.children.push(am5.Legend.new(root, {
                centerX: am5.percent(50),
                x: am5.percent(50),
                marginTop: 15,
                marginBottom: 15
            }));

            // Play initial series animation
            series.appear(1000, 100);
        }

        // Set data for the series
        series.data.setAll(data);

        // Set legend data
        legend.data.setAll(series.dataItems);
    });
}

// Call fetchDataAndUpdateChart2 to fetch data and update the chart
fetchDataAndUpdateChart2();





/*chart3*/
function fetchDataAndUpdateChart3() {
    fetch('/get-datachart-3')
        .then(response => response.json())
        .then(data => {
            // Check if data is an array
            if (Array.isArray(data)) {
                // Convert values to floats
                data.forEach(item => {
                    if (typeof item.value === 'string' && item.value !== undefined) {
                        item.value = parseFloat(item.value);
                    }
                });
                updateChart3(data);
            } else {
                console.error('Error: Data is not an array', data);
            }
        })
        .catch(error => console.error('Error:', error));
}

function updateChart3(data) {
    var root = am5.Root.new("chartdiv-3");

// Set themes
root.setThemes([
  am5themes_Animated.new(root)
]);

// Create chart
var chart = root.container.children.push(am5xy.XYChart.new(root, {
  panX: true,
  panY: true,
  wheelX: "panX",
  wheelY: "zoomX",
  pinchZoomX: true,
  paddingLeft:0,
  layout: root.verticalLayout
}));

chart.set("colors", am5.ColorSet.new(root, {
  colors: [
    am5.color(0x73556E),
    am5.color(0x9FA1A6),
    am5.color(0xF2AA6B),
    am5.color(0xF28F6B),
    am5.color(0xA95A52),
    am5.color(0xE35B5D),
    am5.color(0xFFA446)
  ]
}));

// Create axes
var xRenderer = am5xy.AxisRendererX.new(root, {
  minGridDistance: 50,
  minorGridEnabled: true
});

xRenderer.grid.template.setAll({
  location: 1
});

var xAxis = chart.xAxes.push(am5xy.CategoryAxis.new(root, {
  maxDeviation: 0.3,
  categoryField: "category",
  renderer: xRenderer,
  tooltip: am5.Tooltip.new(root, {})
}));

var yAxis = chart.yAxes.push(am5xy.ValueAxis.new(root, {
  maxDeviation: 0.3,
  min: 0,
  renderer: am5xy.AxisRendererY.new(root, {
    strokeOpacity: 0.1
  })
}));

// Create series
var series = chart.series.push(am5xy.ColumnSeries.new(root, {
  name: "Series 1",
  xAxis: xAxis,
  yAxis: yAxis,
  valueYField: "value",
  categoryXField: "category",
  tooltip: am5.Tooltip.new(root, {
    labelText: "{valueY}"
  }),
}));

series.columns.template.setAll({
  tooltipY: 0,
  tooltipText: "{categoryX}: {valueY}",
  shadowOpacity: 0.1,
  shadowOffsetX: 2,
  shadowOffsetY: 2,
  shadowBlur: 1,
  strokeWidth: 2,
  stroke: am5.color(0xffffff),
  shadowColor: am5.color(0x000000),
  cornerRadiusTL: 50,
  cornerRadiusTR: 50,
  fillGradient: am5.LinearGradient.new(root, {
    stops: [
      {}, // will use original column color
      { color: am5.color(0x000000) }
    ]
  }),
  fillPattern: am5.GrainPattern.new(root, {
    maxOpacity: 0.15,
    density: 0.5,
    colors: [am5.color(0x000000), am5.color(0x000000), am5.color(0xffffff)]
  })
});

series.columns.template.states.create("hover", {
  shadowOpacity: 1,
  shadowBlur: 10,
  cornerRadiusTL: 10,
  cornerRadiusTR: 10
});

series.columns.template.adapters.add("fill", function (fill, target) {
  return chart.get("colors").getIndex(series.columns.indexOf(target));
});

// Fetch data from the Flask route
fetch('/get-datachart-3')
  .then(response => response.json())
  .then(data => {
    // Set data for the chart
    xAxis.data.setAll(data);
    series.data.setAll(data);

    // Make stuff animate on load
    series.appear(1000);
    chart.appear(1000, 100);
  })
  .catch(error => {
    console.error('Error fetching data:', error);
  });
}






/*chaer 4*/

function fetchDataAndUpdateChart4() {
    fetch('/get-datachart-4')
        .then(response => response.json())
        .then(data => {
            // Check if data is an array
            if (Array.isArray(data)) {
                // Convert values to floats
                data.forEach(item => {
                    if (typeof item.total_amount_spent === 'string' && item.total_amount_spent !== undefined) {
                        item.total_amount_spent = parseFloat(item.total_amount_spent);
                    }
                });
                updateChart4(data);
            } else {
                console.error('Error: Data is not an array', data);
            }
        })
        .catch(error => console.error('Error:', error));
}

function updateChart4(data) {
    am5.ready(function () {
        // Create root element
        var root4 = am5.Root.new("chartdiv-4");

        // Set themes
        root4.setThemes([
            am5themes_Animated.new(root4)
        ]);

        // Create chart
        var chart4 = root4.container.children.push(am5percent.SlicedChart.new(root4, {
            layout: root4.verticalLayout
        }));

        // Create series
        var series4 = chart4.series.push(am5percent.PictorialStackedSeries.new(root4, {
            alignLabels: true,
            orientation: "vertical",
            valueField: "total_amount_spent",
            categoryField: "customer_id",
            svgPath: "M53.5,476c0,14,6.833,21,20.5,21s20.5-7,20.5-21V287h21v189c0,14,6.834,21,20.5,21 c13.667,0,20.5-7,20.5-21V154h10v116c0,7.334,2.5,12.667,7.5,16s10.167,3.333,15.5,0s8-8.667,8-16V145c0-13.334-4.5-23.667-13.5-31 s-21.5-11-37.5-11h-82c-15.333,0-27.833,3.333-37.5,10s-14.5,17-14.5,31v133c0,6,2.667,10.333,8,13s10.5,2.667,15.5,0s7.5-7,7.5-13 V154h10V476 M61.5,42.5c0,11.667,4.167,21.667,12.5,30S92.333,85,104,85s21.667-4.167,30-12.5S146.5,54,146.5,42 c0-11.335-4.167-21.168-12.5-29.5C125.667,4.167,115.667,0,104,0S82.333,4.167,74,12.5S61.5,30.833,61.5,42.5z"
        }));

        series4.labelsContainer.set("width", 100);
        series4.ticks.template.set("location", 0.6);

        // Set data
        series4.data.setAll(data);

        // Play initial series animation
        chart4.appear(1000, 100);
    });
}

// Call the fetch and update functions for both charts
fetchDataAndUpdateChart3();
fetchDataAndUpdateChart4();





/*chart 5


function fetchDataAndUpdateChart5() {
    fetch('/get-datachart-5')
        .then(response => response.json())
        .then(data => {
            console.log('Received data:', data); // Log the data received from the server

            // Check if data is an array and not empty
            if (Array.isArray(data) && data.length > 0) {
                // Convert values to floats if needed
                data.forEach(item => {
                    if (typeof item.value === 'string' && item.value !== undefined) {
                        item.value = parseFloat(item.value);
                    }
                });
                updateChart5(data);
            } else {
                console.error('Error: Data is not an array or is empty', data);
            }
        })
        .catch(error => console.error('Error:', error));
}



function updateChart5(data) {
    // Create root element
    var root = am5.Root.new("chartdiv-5");
    root.setThemes([
        am5themes_Animated.new(root)
    ]);

    // Create chart
    var chart = root.container.children.push(
        am5xy.XYChart.new(root, {
            panX: true,
            panY: true,
            wheelX: "panX",
            wheelY: "zoomX",
            paddingLeft: 5,
            paddingRight: 5
        })
    );

    // Add cursor
    var cursor = chart.set("cursor", am5xy.XYCursor.new(root, {}));
    cursor.lineY.set("visible", false);

    // Create axes
    var xRenderer = am5xy.AxisRendererX.new(root, {
        minGridDistance: 60,
        minorGridEnabled: true
    });

    var xAxis = chart.xAxes.push(
        am5xy.CategoryAxis.new(root, {
            maxDeviation: 0.3,
            categoryField: "status",
            renderer: xRenderer,
            tooltip: am5.Tooltip.new(root, {})
        })
    );

    xRenderer.grid.template.setAll({
        location: 1
    });

    var yAxis = chart.yAxes.push(
        am5xy.ValueAxis.new(root, {
            maxDeviation: 0.3,
            renderer: am5xy.AxisRendererY.new(root, {
                strokeOpacity: 0.1
            })
        })
    );

    // Create series
    var series = chart.series.push(
        am5xy.ColumnSeries.new(root, {
            name: "Order Count",
            xAxis: xAxis,
            yAxis: yAxis,
            valueYField: "order_count",
            sequencedInterpolation: true,
            categoryXField: "status"
        })
    );

    series.columns.template.setAll({
        width: am5.percent(120),
        fillOpacity: 0.9,
        strokeOpacity: 0
    });

    series.columns.template.adapters.add("fill", (fill, target) => {
        return chart.get("colors").getIndex(series.columns.indexOf(target));
    });

    series.columns.template.adapters.add("stroke", (stroke, target) => {
        return chart.get("colors").getIndex(series.columns.indexOf(target));
    });

    series.columns.template.set("draw", function(display, target) {
        var w = target.getPrivate("width", 0);
        var h = target.getPrivate("height", 0);
        display.moveTo(0, h);
        display.bezierCurveTo(w / 4, h, w / 4, 0, w / 2, 0);
        display.bezierCurveTo(w - w / 4, 0, w - w / 4, h, w, h);
    });

    // Use the fetched data to update the chart
    xAxis.data.setAll(data);
    series.data.setAll(data);

    // Make stuff animate on load
    series.appear(1000);
    chart.appear(1000, 100);
}
*/






document.addEventListener('DOMContentLoaded', function () {
    fetchDataAndUpdateChart();
    fetchDataAndUpdateChart2();
    fetchDataAndUpdateChart3();
    fetchDataAndUpdateChart4();
    //fetchDataAndUpdateChart5();
});

