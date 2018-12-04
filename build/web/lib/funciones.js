/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

 function  generarGraficaPastel(chartData2, ubicacion2, ejeX1, ejeY1) {
    var chart;
    var legend;
    chart = new AmCharts.AmPieChart();
    chart.dataProvider = chartData2;
    chart.titleField = ejeX1;
    chart.valueField = ejeY1;
    chart.outlineColor = "#FFFFFF";
    chart.outlineAlpha = 0.8;
    chart.outlineThickness = 2;
    chart.balloonText = "[[title]]<br><span style='font-size:14px'><b>[[value]]</b> ([[percents]]%)</span>";
    // this makes the chart 3D
    chart.depth3D = 15;
    chart.angle = 30;

    // WRITE
    chart.write(ubicacion2);
}


