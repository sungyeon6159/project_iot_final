<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<title>Insert title here</title>
		<link rel="stylesheet" href="${pageContext.request.contextPath}/resource/bootstrap/css/bootstrap.min.css">
		<script src="${pageContext.request.contextPath}/resource/jquery/jquery.min.js"></script>
		<script src="${pageContext.request.contextPath}/resource/popper/popper.min.js"></script>
		<script src="${pageContext.request.contextPath}/resource/bootstrap/js/bootstrap.min.js"></script>
		<link rel="stylesheet" href="${pageContext.request.contextPath}/resource/jquery-ui/jquery-ui.min.css">
		<script src="${pageContext.request.contextPath}/resource/jquery-ui/jquery-ui.min.js"></script>
		
		<script src="https://cdnjs.cloudflare.com/ajax/libs/paho-mqtt/1.0.1/mqttws31.min.js" type="text/javascript"></script>
		
		<script src="<%=application.getContextPath()%>/resource/highcharts/code/highcharts.js"></script>
		<script src="<%=application.getContextPath()%>/resource/highcharts/code/themes/gray.js"></script>
		
		<script src="${pageContext.request.contextPath}/resource/js/dc.js"></script>
		<script src="${pageContext.request.contextPath}/resource/js/sensor.js"></script>
		<script src="${pageContext.request.contextPath}/resource/js/servo.js"></script>
		<script src="${pageContext.request.contextPath}/resource/js/chart.js"></script>
		<script src="${pageContext.request.contextPath}/resource/js/speedmaster.js"></script>
		<script src="${pageContext.request.contextPath}/resource/js/toggle_and_hover.js"></script>
		
		<script src="https://code.highcharts.com/modules/solid-gauge.js"></script>
		<script src="https://code.highcharts.com/modules/exporting.js"></script>
		<script src="https://code.highcharts.com/modules/export-data.js"></script>
		<script src="https://code.highcharts.com/modules/accessibility.js"></script>
		
<!-- 		<script src="https://code.highcharts.com/highcharts.js"></script>
		<script src="https://code.highcharts.com/highcharts-more.js"></script>
		<script src="https://code.highcharts.com/modules/solid-gauge.js"></script>
		<script src="https://code.highcharts.com/modules/exporting.js"></script>
		<script src="https://code.highcharts.com/modules/export-data.js"></script>
		<script src="https://code.highcharts.com/modules/accessibility.js"></script>  -->
		 <style type="text/css">
		    .toggleBG{background: #CCCCCC; width: 70px; height: 30px; border: 1px solid #CCCCCC; border-radius: 15px;}
		    .toggleFG{background: #FFFFFF; width: 30px; height: 30px; border: none; border-radius: 15px; position: relative; left: 0px;}
		</style>
		 
		<style>       
			 @font-face {           
	        font-family: "digital";           
	        src: url("http://joekuan.org/digital.ttf") format("truetype");}    
   		</style>
		<style>
		html, body{
			height: 100%;
			width: 100%;
		}
		p {
			color:white
			}
		
				.highcharts-figure .chart-container {
			width: 300px;
			height: 200px;
			float: left;
		}
		
		.highcharts-figure, .highcharts-data-table table {
			width: 600px;
			margin: 0 auto;
		}
		
		.highcharts-data-table table {
		    font-family: Verdana, sans-serif;
		    border-collapse: collapse;
		    border: 1px solid #EBEBEB;
		    margin: 10px auto;
		    text-align: center;
		    width: 100%;
		    max-width: 500px;
		}
		.highcharts-data-table caption {
		    padding: 1em 0;
		    font-size: 1.2em;
		    color: #555;
		}
		.highcharts-data-table th {
			font-weight: 600;
		    padding: 0.5em;
		}
		.highcharts-data-table td, .highcharts-data-table th, .highcharts-data-table caption {
		    padding: 0.5em;
		}
		.highcharts-data-table thead tr, .highcharts-data-table tr:nth-child(even) {
		    background: #f8f8f8;
		}
		.highcharts-data-table tr:hover {
		    background: #f1f7ff;
		}
		
		@media (max-width: 600px) {
			.highcharts-figure, .highcharts-data-table table {
				width: 100%;
			}
			.highcharts-figure .chart-container {
				width: 300px;
				float: none;
				margin: 0 auto;
			}
		
		}
		</style>
		
		<style>
    .chart_container {
    	overflow:hidden;
        -webkit-transform:scale(1);
        -moz-transform:scale(1);
        -ms-transform:scale(1); 
        -o-transform:scale(1);  
        transform:scale(1);
        -webkit-transition:.3s;
        -moz-transition:.3s;
        -ms-transition:.3s;
        -o-transition:.3s;
        transition:.3s;
    }
    .chart_container:hover{
    	margin-top:10px;
        -webkit-transform:scale(1.2);
        -moz-transform:scale(1.2);
        -ms-transform:scale(1.2);   
        -o-transform:scale(1.2);
        transform:scale(1.2);
    }
             </style>
		<style>
         #position button{
            border: 1px solid black; 
                background-color: rgba(0,0,0,1); 
                color: white;
                padding: 3px; 
                font-size:30px;
                border-radius: 10px
         }
         #position2 button{
            border: 1px solid black; 
                background-color: rgba(0,0,0,1); 
                color: white;
                padding: 3px; 
                font-size:30px;
                border-radius: 10px
         }
         
        
      </style>
		<script>
         $(document).keyup(function(event) {
              if (event.keyCode == '37') {
                 $(".left").css('background-color', 'black')
              }
              else if (event.keyCode == '38') {
                 $(".up").css('background-color', 'black')
              }
              else if (event.keyCode == '39') {
                 $(".right").css('background-color', 'black')
              }
              else if (event.keyCode == '40') {
                 $(".down").css('background-color', 'black')
              }
              else if (event.keyCode == '32') {
                 $(".center").css('background-color', 'black')
              }
            });
         
         $(document).keydown(function(event) {
              if (event.keyCode == '37') {
                 $(".left").css('background-color', 'pink')
              }
              else if (event.keyCode == '38') {
                 $(".up").css('background-color', 'pink')
              }
              else if (event.keyCode == '39') {
                 $(".right").css('background-color', 'pink')
              }
              else if (event.keyCode == '40') {
                 $(".down").css('background-color', 'pink')
              }
              else if (event.keyCode == '32') {
                 $(".center").css('background-color', 'pink')
              }
            });
		</script>
		<script>
         $(document).keyup(function(event) {
              if (event.keyCode == '65') {
                 $(".left2").css('background-color', 'black')
              }
              else if (event.keyCode == '87') {
                 $(".up2").css('background-color', 'black')
              }
              else if (event.keyCode == '68') {
                 $(".right2").css('background-color', 'black')
              }
              else if (event.keyCode == '83') {
                 $(".down2").css('background-color', 'black')
              }
              else if (event.keyCode == '32') {
                 $(".center2").css('background-color', 'black')
              }
            });
         
         $(document).keydown(function(event) {
              if (event.keyCode == '65') {
                 $(".left2").css('background-color', 'pink')
              }
              else if (event.keyCode == '87') {
                 $(".up2").css('background-color', 'pink')
              }
              else if (event.keyCode == '68') {
                 $(".right2").css('background-color', 'pink')
              }
              else if (event.keyCode == '83') {
                 $(".down2").css('background-color', 'pink')
              }
              else if (event.keyCode == '32') {
                 $(".center2").css('background-color', 'pink')
              }
            });
		</script>
		<script>
			count=0;
			speed = 0
			servo1 = 20
			servo2 = 90
			servo3 = 90
			servo4 = 90
			servo5 = 90
			temperatureValue = 0;
			photoValue = 0;
			ultraSonicValue = 0;
			gasValue = 0;
			trackingValue = 0;
			//센서 구독자
			$(function(){
				sensorClient = new Paho.MQTT.Client(location.hostname, 61614, new Date().getTime().toString());
				sensorClient.onMessageArrived = onMessageArrived;
				console.log("실행 센서 ")
				sensorClient.connect({onSuccess:onConnect});
			});
			function onConnect() {
				console.log("sensor mqtt broker connected");
				sensorClient.subscribe("/temperature_photo");
				sensorClient.subscribe("/gas_tracking");
				sensorClient.subscribe("/ultraSonic");
				sensorClient.subscribe("/camera");
				//sensorClient.subscribe("/actuator"); 
				
			}
			function onMessageArrived(message) {
				console.log(message.destinationName)
				if(message.destinationName == "/camera"){
					//$("#cameraView").attr("src", "data:image/jpg;base64," +message.payloadString);
					$("#cameraView").attr("style","background-image: url(data:image/jpg;base64," + message.payloadString + ");background-repeat: no-repeat;background-size: 100%;"); /* ;background-repeat: no-repeat;background-size: 100%" */
				}
				if(message.destinationName == "/temperature_photo"){
					//가정  {"temperature": 값, "gas":값}
					var obj = JSON.parse(message.payloadString);
					temperatureValue = obj.temperature;
					photoValue = obj.photo;
					$("#sensordata #temperature").attr("value", temperatureValue);
					$("#sensordata #photo").attr("value", photoValue);
					
					
					/* message = new Paho.MQTT.Message("value:photo");
					message.destinationName = "/sensor2";
					message.qos = 0;
					sensorClient.send(message); */
					function request_temp_Data() {
						var series = temp_chart.series[0];
				        var shift = series.data.length > 20;
					    
			        	var point = {x:new Date().getTime(), y:temperatureValue}
			           
			            temp_chart.series[0].addPoint(point, true, shift);
			        			        
					}
					
				} 
				if (message.destinationName == "/gas_tracking") {
					var obj = JSON.parse(message.payloadString);
					
					gasValue = obj.gas
					trackingValue = obj.tracking;
					
					$("#sensordata #gas").attr("value", gasValue);
					$("#sensordata #tracking").attr("value", trackingValue);
					
				}
				if (message.destinationName == "/ultraSonic") {
					var obj = JSON.parse(message.payloadString);
					ultraSonicValue = obj.ultraSonic;
					$("#sensordata #ultraSonic").attr("value", ultraSonicValue);
					
				}
				
						
			}
		</script>
			
		<script>
			function publish() {
				
				speed = $("#speed").val();
								
				message = new Paho.MQTT.Message("value:"+ speed);
				message.destinationName = "/speed";
				message.qos = 0;
				sensorClient.send(message);
			}
		</script>
		<script>
			function autoStart() {
				message = new Paho.MQTT.Message("autostart");
				message.destinationName = "/auto/start";
				message.qos = 0;
				sensorClient.send(message);
			}
		</script>
		<script>
			function autoStop() {
				message = new Paho.MQTT.Message("autostop");
				message.destinationName = "/auto/stop";
				message.qos = 0;
				sensorClient.send(message);
			}
		</script>
		<script>
			
		</script>
		
		<script>
			function servoTire() {
				
				servo4 = $("#servoTire").val();
								
				message = new Paho.MQTT.Message("value:"+ servo4);
				message.destinationName = "/servo/servo4";
				message.qos = 0;
				sensorClient.send(message);
			}
		</script>
		<script type="text/javascript"> // 데이터 저장 부분
			/* intervalId = window.setInterval(function() {
				console.log("실행ultra")
					$.ajax({
						url: "ultraSonic.do",
					
						data: {value: ultraSonicValue},
					
						success: function(data) {
							console.log("실행5");
						}
						
					}); 
				}, 3000
			); */
		</script>
				
		
		<script>
		//키보드 전용 토픽 서보 만들기
		$(document).keydown(function(event) {
			
			if (event.keyCode == '37' && event.keyCode == '39') { //좌우키를 동시 누르는 중
			    
			    console.log("좌우 키보드 누름")
				servo4 = 90
								
				message = new Paho.MQTT.Message("value:"+ servo4);
				message.destinationName = "/servo/servo4/middle";
				message.qos = 0;
				sensorClient.send(message);
			}
			  
			  
			if (event.keyCode == '40' && event.keyCode == '38') { //앞이랑 뒤 키를 동시에 눌렀을때 : 일단 멈춤
				    speed = 0
				    console.log("상하 키보드 동시에 누름")
				  	message = new Paho.MQTT.Message("value:"+ speed);
					message.destinationName = "/speed/stop";
					message.qos = 0;
					sensorClient.send(message);
			}
			  
			if (event.keyCode == '38') { //위쪽 화살표
				  	speed += 1;
				  	console.log("상 키보드 누름")
				  	console.log(speed)
				  	message = new Paho.MQTT.Message("value:"+ speed);
					message.destinationName = "/speed/forward";
					message.qos = 0;
					sensorClient.send(message);
			}
			if (event.keyCode == '40') { //후진
				    speed += 1;
				    console.log("하 키보드 누름")
				  	message = new Paho.MQTT.Message("value:"+ speed);
					message.destinationName = "/speed/backward";
					message.qos = 0;
					sensorClient.send(message);
			}
			  
			    
			if (event.keyCode == '32') { //스페이스바
					buzzerOn()
			}
		});
		
		//***************************************서보 ***************************************************************************		
		$(document).keydown(function(event) {
			
				  /* if (event.keyCode == '37') {
			  	servo4 -= 1
			  	
			  	if (servo4 < 70) {
			  		servo4 = 70
			  	}
			  	console.log("좌")
				message = new Paho.MQTT.Message("value:"+ servo4);
				message.destinationName = "/keyboard/servo/servo4/left";
				message.qos = 0;
				sensorClient.send(message);
		  }
		  
		if (event.keyCode == '39') {
			  	servo4 += 1
			  	if (servo4 > 110) {
			  		servo4 = 110
			  	}
			  	console.log("우")
				message = new Paho.MQTT.Message("value:"+ servo4);
				message.destinationName = "/keyboard/servo/servo4/right";
				message.qos = 0;
				sensorClient.send(message);
		}

		//상하ws 좌우ad
		
		if (event.keyCode == '87') {
		  	servo1 += 2
		  	if (servo1 > 150) {
		  		servo1 = 150
		  	}
		  	console.log("카페라 상")
			message = new Paho.MQTT.Message("value:"+ servo1);
			message.destinationName = "/keyboard/servo/servo1/up";
			message.qos = 0;
			sensorClient.send(message);
		}
		if (event.keyCode == '83') {
		  	servo1 -= 2
		  	if (servo1 < 20) {
		  		servo1 = 20
		  	}
		  	console.log("카메라 하")
			message = new Paho.MQTT.Message("value:"+ servo1);
			message.destinationName = "/keyboard/servo/servo1/down";
			message.qos = 0;
			sensorClient.send(message);
		}
		if (event.keyCode == '65') {
		  	servo2 -= 2
		  	if (servo2 < 60) {
		  		servo2 = 60
		  	}
		  	console.log("카메라 좌")
			message = new Paho.MQTT.Message("value:"+ servo2);
			message.destinationName = "/keyboard/servo/servo2/left";
			message.qos = 0;
			sensorClient.send(message);
		}
		if (event.keyCode == '68') {
		  	servo2 += 2
		  	if (servo2 > 120) {
		  		servo2 = 120
		  	}
		  	console.log("카메라 우")
			message = new Paho.MQTT.Message("value:"+ servo2);
			message.destinationName = "/keyboard/servo/servo2/right";
			message.qos = 0;
			sensorClient.send(message);
		}
		*/
	
		if (event.keyCode == '37') {
			servo4 -= 5
				
		  	if (servo4 < 70) {
		  		servo4 = 70
		  	}
		  	console.log(servo4)
		  	console.log("인터벌 실행")

		}	
			
			
	  
	  
		if (event.keyCode == '39') {
		  	servo4 += 5
		  	if (servo4 > 110) {
		  		servo4 = 110
		  	}
		  	console.log("우")
			
			
		}

	//상하ws 좌우ad
	
		if (event.keyCode == '87') {
		  	servo1 += 10
		  	
		  	if (servo1 > 160) {
		  		servo1 = 160
		  	}
		  	console.log("카페라 상")
			
		}
		if (event.keyCode == '83') {
		  	servo1 -= 10
		  	
		  	if (servo1 < 10) {
		  		servo1 = 10
		  	}
		  	console.log("카메라 하")
			
		}
		if (event.keyCode == '68') {
		  	servo2 -= 10
		  	
		  	if (servo2 < 40) {
		  		servo2 = 40
		  	}
		  	

		  	console.log("카메라 좌")
			
		}
		if (event.keyCode == '65') {
		  	servo2 += 10
		  	
		  	if (servo2 > 140) {
		  		servo2 = 140
		  	}
		  	console.log("카메라 우")
			
		}
		if (event.keyCode == '81') {
		  	servo5 -= 10
		  	if (servo5 < 30) {
		  		servo5 = 30
		  	}
		  	console.log("레이저 좌")
			
		}
		if (event.keyCode == '69') {
		  	servo5 += 10
		  	if (servo5 > 150) {
		  		servo5 = 150
		  	}
		  	console.log("레이저 우")
			
		}
		message = new Paho.MQTT.Message("value:" + servo1+ "/" + servo2 + "/" + servo3 + "/" + servo4 + "/" + servo5);
		message.destinationName = "/keyboard/servo/";
		message.qos = 0;
		sensorClient.send(message);
			
			
		
		}); //setInterval 닫힘
		</script>
		
		<script>
			$(document).keyup(function(event) {
			  
				
			  
			  if (event.keyCode == '40' && event.keyCode == '38') { //멈춤
				    speed = 0
				    console.log("상하 동시 뗌")
				  	message = new Paho.MQTT.Message("value:"+ speed);
					message.destinationName = "/speed";
					message.qos = 0;
					sensorClient.send(message);
			  }
			  
			  if (event.keyCode == '38') { //멈춤
				  	speed = 0
				  	console.log("상 키보드 뗌")
				  	message = new Paho.MQTT.Message("value:"+ speed);
					message.destinationName = "/speed";
					message.qos = 0;
					sensorClient.send(message);
				  }
			  
			  if (event.keyCode == '37' && event.keyCode == '39') { //좌우 동시 뗄때
				  	servo4 = 90
				  	console.log("좌우 키보드 동시 뗌")
					message = new Paho.MQTT.Message("value:"+ servo4);
					message.destinationName = "/servo4";
					message.qos = 0;
					sensorClient.send(message);
			  }
			  
			  /* if (event.keyCode == '39') { //우측 뗄때
				    servo4 = 90
				    console.log("우 키보드 뗌")
					message = new Paho.MQTT.Message("value:"+ servo4);
					message.destinationName = "/servo4";
					message.qos = 0;
					sensorClient.send(message);
				  }  */
			  
			  if (event.keyCode == '40') { //멈춤
				    speed = 0
				    console.log("하 키보드 뗌")
				  	message = new Paho.MQTT.Message("value:"+ speed);
					message.destinationName = "/speed/down";
					message.qos = 0;
					sensorClient.send(message);
			  }
			  
			  
			  
			  if (event.keyCode == '32') { //스페이스바
				  buzzerOff()
			  }
			});
		</script>
		
		<script type="text/javascript">
		$("#tracking_window").attr
		
		
		</script>
		
		<script>
			///////////////////////////////////////////////////////////////////////////////////
		</script>		
		<!-- <style type="text/css">
		.wrap { position:relative; /*감싸는 레이어에 포지션 속성을 잡아주는 게 필수!(relative, absolute, fixed 중 택1*/ width:500px; height:500px; background:#F66; text-align:center; line-height:100px; margin:0 auto;  color:#000; font-size:12px; }
		.over { position:absolute; bottom:0px; right:0px;/*위에 올라가는 레이어의 포지션은 top, bottom 둘 중 하나, left, right 둘 중 하나의 속성을 선택하여 잡아준다.*/ width:300px; height:300px; background:#FFFFCC; text-align:center; line-height:300px;}
		</style> -->


		
		
	</head>
	<body>
	
		<div class="container-fluid text-center" >
			<div class="row bg-dark">
				<div class="col-sm-3 card bg-dark">
					<div class="card bg-dark" style="margin-top: 20px">
						<div class="chart_container chart-container" id="container-speed"></div>
					</div>
					<div class="row">
						<div class="col-sm-6">
							<div>
					           <p style="width:100px;" align="center" > 버저
					           <input class="btn btn-outline-primary" onclick="buzzerOn()" type="button" value="buzzerOn" />
					           <input class="btn btn-outline-secondary" onclick="buzzerOff()" type="button" value="buzzerOff" />
					           </p>
					        </div>
					       <div>
					        <p style="width:100px" align="center">
					           		레이져
					           <input class="btn btn-outline-primary" onclick="laserOn()" type="button" value="laserOn" />
					           <input class="btn btn-outline-secondary" onclick="laserOff()" type="button" value="laserOff" />
					           </p>
					        </div>
					    </div>
					    <div class="col-sm-6">
					        <div>
					        <p style="width:100px" align="center">
					           LedRed
					           <input class="btn btn-outline-danger" onclick="ledRedOn()" type="button" value="ledRedOn" />
					           <input class="btn btn-outline-secondary" onclick="ledRedOff()" type="button" value="ledRedOff" />
					           </p>
					           <p style="width:100px" align="center">
					         LedGreen           
					           <input class="btn btn-outline-success" onclick="ledGreenOn()" type="button" value="ledGreenOn" />
					           <input class="btn btn-outline-secondary" onclick="ledGreenOff()" type="button" value="ledGreenOff" />
					           </p>
					           <p style="width:100px" align="center">
					           LedBlue
					           <input class="btn btn-outline-primary" onclick="ledBlueOn()" type="button" value="ledBlueOn" />
					           <input class="btn btn-outline-secondary" onclick="ledBlueOff()" type="button" value="ledBlueOff" />
					           </p>
					           <p style="width:100px" align="center">
					           LedOff
					           <input class="btn btn-outline-secondary" onclick="ledOff()" type="button" value="ledOff" />
					           </p>
					        </div>
					     </div>
					  </div>
				</div>
				<div class="col-sm-3 card bg-dark" >
					<div class="chart_container" id="light_container" style="margin-top: 20px"></div>
					<div class="toggleBG text-left">
                      <button id="buttonID" class='toggleFG' onclick="getToggleBtnState('buttonID')"></button>
                 	</div>
					<div id = "button_state_mode">
						<div class="button_menual1" style="display: none;">		
									<p>수동 주행 메뉴얼<p><br>
									<p>1. 키보드 상하좌우 = 차의 이동</p>	
						</div>
						<div class="button_menual2">
									<p>자율 주행 메뉴얼</p><br>
									<p>1. 거리가 10 이하가 되면 운행을 중지하고 뒤로 갑니다<br>
									<p>2. 이후 추가 바람.</p><br>
						</div>
					</div>
				</div>
				
				<!-- <div class="col-sm-2 card bg-light">
					<div class="card bg-light">
						<div class="chart_container" id="gas_container"></div>
					</div>
				</div> -->
				<!--<div class="col-sm-6 card bg-dark" >
					<div class="col-sm-12" id="cameraView"></div>
				</div>-->
				 <div class="col-sm-6 card bg-dark" >
               		<div class="row"  style="width: 100%; height: 100%;">
                     	<div class="col-sm-12" id="cameraView" style="width: 100%; height: 100%;"></div>
                  	</div>
                 	<div class="row">
	                     <div class="col-sm-6 card bg-dark" style="opacity: 0.3">
	                         <div id="position2" class="position2" >
	                           <button class="up2"  style="height:50px; width:50px;">W</button>
	                           <br/>
	                           <button class="left2"  style="height:50px; width:50px;">A</button>
	                           <button class="center2" style="height:50px; width:50px;">□</button>
	                           <button class="right2" style="height:50px; width:50px;">D</button>
	                           <br/>
	                           <button class="down2" style="height:50px; width:50px;">S</button>
	                     </div>
                    </div>
                    <div class="col-sm-6 card bg-dark">
                        <div id="position" class="position" style="opacity: 0.3">
                              <button class="up"  style="height:50px; width:50px;">△</button>
                              <br/>
                              <button class="left"  style="height:50px; width:50px;">◁</button>
                              <button class="center" style="height:50px; width:50px;">□</button>
                              <button class="right" style="height:50px; width:50px;">▷</button>
                              <br/>
                              <button class="down" style="height:50px; width:50px;">▽</button>
                           </div>
                        </div>
                  </div>
             </div>
			</div>
		</div>	
			
			
			
			
	</div>
		<!-- <div id="sensordata">
			<table>
				<tr>
					<th>온도 </th>
				</tr>
				<tr>
					<td><input id="temperature" type="text" value=""/></td>
				</tr>
				<tr>
					<th>포토</th>
				</tr>
				<tr>
					<td><input id="photo" type="text" value=""/></td>
				</tr>
				<tr>
					<th>게스 </th>
				</tr>
				<tr>
					<td><input id="gas" type="text" value=""/></td>
				</tr>
				
				<tr>
					<th>초음파</th>
				</tr>
				<tr>
					<td><input id="ultraSonic" type="text" value=""/></td>
				</tr>
				<tr>
					<th>트래킹</th>
				</tr>
				<tr>
					<td><input id="tracking" type="text" value=""/></td>
				</tr>
				
				
			</table>
		</div>
--> 
		<div>
	  		Auto모드 테스트
	  		<input class="togglebtn" onclick="autoStart()" type="button" value="autoStart" />
	  		<input class="togglebtn" onclick="autoStop()" type="button" value="autoStop" />
	  	</div>
		
		 <!-- <div>
	  		DC모터
	  		<input id="speed" name="speed" type="text" />
	  		<input class="togglebtn" onclick="publish()" type="button" value="speed" />
	  	</div> -->
	  	<!-- <div>
	  		servoCameraVertical()
	  		<input id="servoCameraVertical" name="servoCameraVertical" type="text" />
	  		<input class="togglebtn" onclick="servoCameraVertical()" type="button" value="servoCameraVertical" />
	  	</div>
	  	<div>
	  		servoCameraHorigental()
	  		<input id="servoCameraHorigental" name="servoCameraHorigental" type="text" />
	  		<input class="togglebtn" onclick="servoCameraHorigental()" type="button" value="servoCameraHorigental" />
	  	</div> -->
	  	<!-- <div>
	  		servoUltra()
	  		<input id="servoUltra" name="servoUltra" type="text" />
	  		<input class="togglebtn" onclick="servoUltra()" type="button" value="servoUltra" />
	  	</div>
	  	<div>
	  		servoTire()
	  		<input id="servoTire" name="servoTire" type="text" />
	  		<input class="togglebtn" onclick="servoTire()" type="button" value="servoTire" />
	  	</div> -->
		
		<div>
	  		빵빵
	  		<input class="togglebtn" onclick="buzzerOn()" type="button" value="buzzerOn" />
	  		<input class="togglebtn" onclick="buzzerOff()" type="button" value="buzzerOff" />
	  	</div>
	  	<div>
	  		레이져
	  		<input class="togglebtn" onclick="laserOn()" type="button" value="laserOn" />
	  		<input class="togglebtn" onclick="laserOff()" type="button" value="laserOff" />
	  	</div>
	  	<div>
	  		LedRed
	  		<input class="togglebtn" onclick="ledRedOn()" type="button" value="ledRedOn" />
	  		<input class="togglebtn" onclick="ledRedOff()" type="button" value="ledRedOff" />
			LedGreen	  		
	  		<input class="togglebtn" onclick="ledGreenOn()" type="button" value="ledGreenOn" />
	  		<input class="togglebtn" onclick="ledGreenOff()" type="button" value="ledGreenOff" />
	  		LedBlue
	  		<input class="togglebtn" onclick="ledBlueOn()" type="button" value="ledBlueOn" />
	  		<input class="togglebtn" onclick="ledBlueOff()" type="button" value="ledBlueOff" />
	  		LedOff
	  		<input class="togglebtn" onclick="ledOff()" type="button" value="ledOff" />
	  	</div>

	</body>
</html>