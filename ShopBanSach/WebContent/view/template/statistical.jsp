<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>Sales Charts</title>
  
  <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
  <style>
   
    .chart-container {
      display: flex;
      justify-content: space-around;
      margin-top: 10px;
      flex-wrap: wrap;
    }
    .chart-container .barChart{
    flex-basis: 80%;
    }
    .chart-container .pieChart{
    	flex-basis: 50%;
    	
    }
    .chart-container .myChart{
    	flex-basis: 50%;
    	
    }
    .chart-container .choose-date{
    flex-basis:100%;
    display:flex;
    justify-content: space-between;
    padding-bottom:10px;
    }
    .chart-container .choose-date div{
    flex-basis: 50%;}
	
    #barChart {
      max-width: 100%;
      max-height: 250px;
      
    }
    #pieChart{
    max-width: 100%;
      max-height: 250px;
    }
    #myChart {
      max-width: 100%;
     	max-height: 250px;
    }
    p{
    text-align: center;
    font-weight: bold;
    font-size:20px;
    margin:0;
    padding:0;
    }
    input[type='date']{
    width: 200px; 
    height: 30px;
    border: 1px solid #ccc;
    border-radius: 4px;
    background-color: #f0f0f0;
    color: #333; 
    cursor: pointer;
    margin-right: 20px;
    }
    input[type='submit']{
    	width: 50px;
    	height: 32px;
    	border: 1px solid #ccc;
    border-radius: 4px;
    background-color: #f0f0f0;
    color: #333; 
    cursor: pointer;
    padding: 1px 0px;
    transition : all 0.5s linear;
    }
    .date{
    	padding-left:35px;
    }
     input[type='submit']:hover{
     background-color: #b9b9ec;
     }
    form{
    max-width: 80%;
    display: flex;
    background: white;
    }
    span{
    display: block;
    font-weight:bold;
    width:100%;
    text-align:center;}
  </style>
</head>
<body>

  <div class="chart-container">
  <div class="choose-date">
  <div class="date">
  	<form action="/ShopBanSach/statisticalServlet" method="POST">
  	<input type="date" name="date" value="${date}">
  	<input type="submit" name="action" value="Xem">
  	</form>
  </div>
  <div><p> Doanh thu ngày : ${total_date}</p></div>
  </div>
    <div class="pieChart">
    <p> Loại sản phẩm bán chạy theo tháng</p>
    <canvas id="pieChart"></canvas>
    <span>Tổng doanh thu tháng: ${total} VNĐ</span>
    </div>
    <div class="myChart">
    <p>Doanh thu loại sản phẩm theo Quý</p>
    <canvas id="myChart"></canvas>
    <span>Tổng doanh thu quý ${quarter}: ${total_quarter} VNĐ</span>
    </div>
    <div class="barChart">
    <p>Doanh thu các tháng trong năm</p>
  <canvas id="barChart"></canvas>
  <span>Tổng doanh thu năm: ${totalYear} VNĐ</span>
  </div>
  </div>
  <script>
  
    const salesData = {
      labels: ['Tháng 1', 'Tháng 2', 'Tháng 3', 'Tháng 4', 'Tháng 5', 'Tháng 6', 'Tháng 7', 'Tháng 8', 'Tháng 9', 'Tháng 10', 'Tháng 11', 'Tháng 12'],
      datasets: [{
        label: 'VNĐ',
        backgroundColor: 'rgba(54, 162, 235, 0.5)',
        borderColor: 'rgba(54, 162, 235, 1)',
        borderWidth: 1,
        data: [${total_1}, ${total_2}, ${total_3}, ${total_4}, ${total_5}, ${total_6}, ${total_7}, ${total_8}, ${total_9}, ${total_10}, ${total_11}, ${total_12}],
      }]
    };
    
    const percentageData = {
      labels: ['Sách ngoại ngữ', 'Sách giáo khoa ', 'Sách thiếu nhi', 'Văn học'],
      datasets: [{
        label: 'Sales Percentage',
        backgroundColor: ['#FF6384', '#36A2EB', '#FFCE56', '#4BC0C0'],
        data: [${snn},${sgk},${tn},${vh}],
      }]
    };
    const ctxBar = document.getElementById('barChart').getContext('2d');
    const barChart = new Chart(ctxBar, {
      type: 'bar',
      data: salesData,
      options: {
        responsive: true,
        scales: {
          y: {
            beginAtZero: true
          }
        }
      }
    });
    const ctxPie = document.getElementById('pieChart').getContext('2d');
    const pieChart = new Chart(ctxPie, {
      type: 'pie',
      data: percentageData,
      options: {
        responsive: true,
        plugins: {
          legend: {
            position 	: 'bottom',
          },
          tooltip: {
            callbacks: {
              label: function(context) {
                let label = context.label || '';
                if (label) {
                  label += ': ';
                }
                label += Math.round(context.parsed * 100) / 100 + '%';
                return label;
              }
            }
          }
        }
      }
    });
    const salesData1 = {
    	      labels: ['Sách ngoại ngữ', 'Sách giáo khoa ', 'Sách thiếu nhi', 'Văn học'],
    	      datasets: [{
    	        label: 'Sales Percentage',
    	        backgroundColor: ['#FF6384', '#36A2EB', '#FFCE56', '#4BC0C0'],
    	        data: [${snn_quarter},${sgk_quarter},${tn_quarter},${vh_quarter}],
    	      }]
    	    };


    	    const ctx = document.getElementById('myChart').getContext('2d');


    	    const myChart = new Chart(ctx, {
    	      type: 'pie',
    	      data: salesData1,
    	      options: {
    	        responsive: true,
    	        plugins: {
    	          legend: {
    	            position: 'bottom', 
    	          },
    	          tooltip: {
    	            callbacks: {
    	              label: function(context) {
    	                let label = context.label || '';
    	                if (label) {
    	                  label += ': ';
    	                }
    	                label += Math.round(context.parsed * 100) / 100 + '%';
    	                return label;
    	              }
    	            }
    	          }
    	        }
    	      }
    	    });
  </script>
</body>
</html>
