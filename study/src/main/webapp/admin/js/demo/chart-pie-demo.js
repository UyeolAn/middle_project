// Set new default font family and font color to mimic Bootstrap's default styling
Chart.defaults.global.defaultFontFamily = 'Nunito', '-apple-system,system-ui,BlinkMacSystemFont,"Segoe UI",Roboto,"Helvetica Neue",Arial,sans-serif';
Chart.defaults.global.defaultFontColor = '#858796';

// Pie Chart Example


  var ctx = document.getElementById("myPieChart");
  var midForCate = document.getElementById("mid").innerText;
  

  var bg = ['rgb(255, 99, 132)','rgb(255, 205, 86)','rgb(54, 162, 235)'];
  var hv = ['#2e59d9', '#17a673', '#2c9faf'];
  var idx = 0;
  fetch('ajaxmembercategorychart.do?mid='+midForCate)
  .then(resolve => resolve.json())
  .then(json=> {
    console.log(json);
    for(let prop in json) {
      console.log(prop);
      console.log(json[prop]);

      myPieChart.data.labels[idx] = prop.toUpperCase();
      myPieChart.data.datasets[0].data[idx] = json[prop];
      myPieChart.data.datasets[0].backgroundColor[idx] = bg[idx];
      myPieChart.data.datasets[0].hoverBackgroundColor[idx] = hv[idx];
      myPieChart.update();
      idx++;
    }
  });





var myPieChart = new Chart(ctx, {
  type: 'doughnut',
  data: {
    labels: [],
    datasets: [{
      data: [],
      backgroundColor: [],
      hoverBackgroundColor: [],
      hoverOffset: 4
    }],
  },
  options: {
    maintainAspectRatio: false,
    tooltips: {
      backgroundColor: "rgb(255,255,255)",
      bodyFontColor: "#858796",
      borderColor: '#dddfeb',
      borderWidth: 1,
      xPadding: 15,
      yPadding: 15,
      displayColors: false,
      caretPadding: 10,
    },
    legend: {
      display: false
    },
    cutoutPercentage: 80,
  },
});
