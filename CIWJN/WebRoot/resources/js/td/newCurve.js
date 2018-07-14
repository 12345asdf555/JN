/**
 * 
 */
var machine = new Array();
var time = new Array();
var ele = new Array();
var vol = new Array();
var work = new Array();
var wait = new Array();
var dglength;
var websocketURL;
var welderName;
var symbol=0;
var symbol1=0;
var sym=0;
var timerele;
var timervol;
var socket;
var redata;
var rowdex=0;
var maxele=0;
var minele=0;
var maxvol=0;
var minvol=0;
var rows;
var fmch;
var sint=0;
var led=["0,1,2,4,5,6","2,5","0,2,3,4,6","0,2,3,5,6","1,2,3,5","0,1,3,5,6","0,1,3,4,5,6","0,2,5","0,1,2,3,4,5,6","0,1,2,3,5,6"];
$(function(){
	var width = $("#treeDiv").width();
	$(".easyui-layout").layout({
		onCollapse:function(){
			$("#dg").datagrid({
				height : $("#body").height(),
				width : $("#body").width()
			})
		},
		onExpand:function(){
			$("#dg").datagrid({
				height : $("#body").height(),
				width : $("#body").width()
			})
		}
	});
	$("#myTree").tree({  
		onClick : function(node){
			$("#bodys").empty();
			getMachine(node.id);
		 }
	})
	$.ajax({  
	      type : "post",  
	      async : false,
	      url : "td/AllTdbf",  
	      data : {},  
	      dataType : "json", //返回数据形式为json  
	      success : function(result) {
	          if (result) {
	        	  websocketURL = eval(result.web_socket);
	          }  
	      },
	      error : function(errorMsg) {  
	          alert("数据请求失败，请联系系统管理员!");  
	      }  
	 });
	$.ajax({  
	      type : "post",  
	      async : false,
	      url : "td/allWeldname",  
	      data : {},  
	      dataType : "json", //返回数据形式为json  
	      success : function(result) {
	          if (result) {
	        	  welderName=eval(result.rows);
	          }  
	      },
	      error : function(errorMsg) {  
	          alert("数据请求失败，请联系系统管理员!");  
	      }  
	 });
	getMachine();
    websocket();
})
	
	function getMachine(value){
	if(value==""||value==null){
		var url="td/getAllPosition";
	}else{
		var url="td/getAllPosition?parent="+value;
	}
		$.ajax({  
		      type : "post",  
		      async : false,
		      url : url,  
		      data : {},  
		      dataType : "json", //返回数据形式为json  
		      success : function(result) {
		          if (result) {
		        	fmch=eval(result.rows);
		        	for(var f=0;f<fmch.length;f++){
						var	str = '<div style="width:25%;height:20%;float:left">'+
						'<div style="width:30%;height:100%;float:left"><img id='+f+' src="resources/images/WDgj.png" onclick="javascript:imgfun(this.id)" width="100%" height="70%"></div>'+
						'<div style="float:left">'+
						'<div><label id="lab1'+fmch[f].fequipment_no+'">设备编号：'+fmch[f].fequipment_no+'</label></div>'+
						'<div><label id="lab2'+fmch[f].fequipment_no+'">焊缝编号：--</label></div>'+
						'<div><label id="lab3'+fmch[f].fequipment_no+'">操作人员：--</label></div>'+
						'<div><label id="lab4'+fmch[f].fequipment_no+'">焊接电流：--A</label></div>'+
						'<div><label id="lab5'+fmch[f].fequipment_no+'">焊接电压：--V</label></div>'+
						'<div><label id="lab6'+fmch[f].fequipment_no+'">焊机状态：关机</label></div>'+
						'</div>'+
						'</div>';
						$("#bodys").append(str);
		        	}
		          }  
		      },
		      error : function(errorMsg) {  
		          alert("数据请求失败，请联系系统管理员!");  
		      }  
		 });
	}
	
	function imgfun(id){
		var url = "td/goNextcurve?value="+fmch[id].fequipment_no;
		var img = new Image();
	    img.src = url;  // 设置相对路径给Image, 此时会发送出请求
	    url = img.src;  // 此时相对路径已经变成绝对路径
	    img.src = null; // 取消请求
		window.location.href = url;
	};

    function websocket() {
		if(typeof(WebSocket) == "undefined") {
			alert("您的浏览器不支持WebSocket");
			return;
		}
		webclient();
	};
	function webclient(){
		try{
			socket = new WebSocket(websocketURL);
		}catch(err){
			alert("地址请求错误，请清除缓存重新连接！！！")
		}
		setTimeout(function(){
			if(socket.readyState!=1){
				alert("与服务器连接失败,请检查网络设置!");
			}
		},10000);
		socket.onopen = function() {
//			datatable();
			//监听加载状态改变  
			document.onreadystatechange = completeLoading();  
			   
			//加载状态为complete时移除loading效果 
			function completeLoading() {
			        var loadingMask = document.getElementById('loadingDiv');  
			        loadingMask.parentNode.removeChild(loadingMask);  
			}
/*			setTimeout(function(){
				if(symbol==0){
					alert("连接成功，但未接收到任何数据");
				}
			},5000);*/
		};
		socket.onmessage = function(msg) {
			redata=msg.data;
			iview();
			symbol++;
		};
		//关闭事件
		socket.onclose = function(e) {
            if (e.code == 4001 || e.code == 4002 || e.code == 4003 || e.code == 4005 || e.code == 4006){
                //如果断开原因为4001 , 4002 , 4003 不进行重连.
                return;
            }else{
                return;
            }
            // 重试3次，每次之间间隔5秒
            if (tryTime < 3) {
                setTimeout(function () {
                    socket = null;
                    tryTime++;
                    var _PageHeight = document.documentElement.clientHeight,  
                    _PageWidth = document.documentElement.clientWidth;   
                    var _LoadingTop = _PageHeight > 61 ? (_PageHeight - 61) / 2 : 0,  
                    	_LoadingLeft = _PageWidth > 215 ? (_PageWidth - 215) / 2 : 0;  
                    var _LoadingHtml = '<div id="loadingDiv" style="position:absolute;left:0;width:100%;height:' + _PageHeight + 'px;top:0;background:#f3f8ff;opacity:0.8;filter:alpha(opacity=80);z-index:10000;"><div style="position: absolute; cursor1: wait; left: ' + _LoadingLeft + 'px; top:' + _LoadingTop + 'px; width: auto; height: 57px; line-height: 57px; padding-left: 50px; padding-right: 5px; background: #fff url(resources/images/load.gif) no-repeat scroll 5px 10px; border: 2px solid #95B8E7; color: #696969;">""正在尝试第"'+tryTime+'"次重连，请稍候..."</div></div>';  
                	document.write(_LoadingHtml);
                    ws();
                }, 5000);
            } else {
                tryTime = 0;
            }
        };
		//发生了错误事件
		socket.onerror = function() {
			aler("发生异常，正在尝试重新连接服务器！！！");
		}
	}

	function iview(){
		for(var i = 0;i < redata.length;i+=69){
			if(redata.substring(8+i, 12+i)!="0000"){
				for(var f=0;f<fmch.length;f++){
					if((document.getElementById("lab1"+fmch[f].fequipment_no).innerText)==("设备编号："+redata.substring(4+i, 8+i))){
						for(var k=0;k<welderName.length;k++){
							if(welderName[k].fwelder_no==redata.substring(8+i, 12+i)){
								document.getElementById("lab3"+fmch[f].fequipment_no).innerHTML="操作人员："+welderName[k].fname;
							}
						}
						document.getElementById("lab4"+fmch[f].fequipment_no).innerHTML="焊接电流："+parseInt(redata.substring(12+i, 16+i))+"A";
						document.getElementById("lab5"+fmch[f].fequipment_no).innerHTML="焊接电压："+parseFloat((parseInt(redata.substring(16+i, 20+i))/10).toFixed(2))+"V";
						var mstatus=redata.substring(0+i, 2+i);
						switch (mstatus){
						case "00":
							document.getElementById("lab6"+fmch[f].fequipment_no).innerHTML="焊机状态：待机";
							document.getElementById("lab6"+fmch[f].fequipment_no).style.backgroundColor="#84baed";
							document.getElementById(f).src="resources/images/i_blue.png";
							break;
						case "01":
							document.getElementById("lab6"+fmch[f].fequipment_no).innerHTML="焊机状态：E-010 焊枪开关OFF等待";
							document.getElementById("lab6"+fmch[f].fequipment_no).style.backgroundColor="#FF0000";
							document.getElementById(f).src="resources/images/ROBOTdj.png";
							break;
						case "02":
							document.getElementById("lab6"+fmch[f].fequipment_no).innerHTML="焊机状态：E-000工作停止";
							document.getElementById("lab6"+fmch[f].fequipment_no).style.backgroundColor="#FF0000";
							document.getElementById(f).src="resources/images/ROBOTdj.png";
							break;
						case "03":
							document.getElementById("lab6"+fmch[f].fequipment_no).innerHTML="焊机状态：焊接";
							document.getElementById("lab6"+fmch[f].fequipment_no).style.backgroundColor="#00FF00";
							document.getElementById(f).src="resources/images/i_green.png";
							break;						
						case "04":
							document.getElementById("lab6"+fmch[f].fequipment_no).innerHTML="焊机状态：电流过低";
							document.getElementById("lab6"+fmch[f].fequipment_no).style.backgroundColor="#FF0000";
							document.getElementById(f).src="resources/images/ROBOTdj.png";
							break;
							
						case "05":
							document.getElementById("lab6"+fmch[f].fequipment_no).innerHTML="焊机状态：收弧";
							document.getElementById("lab6"+fmch[f].fequipment_no).style.backgroundColor="#00FF00";
							document.getElementById(f).src="resources/images/i_green.png";
							break;
						case "06":
							document.getElementById("lab6"+fmch[f].fequipment_no).innerHTML="焊机状态：电流过高";
							document.getElementById("lab6"+fmch[f].fequipment_no).style.backgroundColor="#FF0000";
							document.getElementById(f).src="resources/images/ROBOTdj.png";
							break;
						case "07":
							document.getElementById("lab6"+fmch[f].fequipment_no).innerHTML="焊机状态：启弧";
							document.getElementById("lab6"+fmch[f].fequipment_no).style.backgroundColor="#00FF00";
							document.getElementById(f).src="resources/images/i_green.png";
							break;
						case "08":
							document.getElementById("lab6"+fmch[f].fequipment_no).innerHTML="焊机状态：电压过低";
							document.getElementById("lab6"+fmch[f].fequipment_no).style.backgroundColor="#FF0000";
							document.getElementById(f).src="resources/images/ROBOTdj.png";
							break;
						case "09":
							document.getElementById("lab6"+fmch[f].fequipment_no).innerHTML="焊机状态：电压过高";
							document.getElementById("lab6"+fmch[f].fequipment_no).style.backgroundColor="#FF0000";
							document.getElementById(f).src="resources/images/ROBOTdj.png";
							break;
						case "10":
							document.getElementById("lab6"+fmch[f].fequipment_no).innerHTML="焊机状态：E-100控制电源异常";
							document.getElementById("lab6"+fmch[f].fequipment_no).style.backgroundColor="#FF0000";
							document.getElementById(f).src="resources/images/ROBOTdj.png";
							break;
						case "15":
							document.getElementById("lab6"+fmch[f].fequipment_no).innerHTML="焊机状态：E-150一次输入电压过高";
							document.getElementById("lab6"+fmch[f].fequipment_no).style.backgroundColor="#FF0000";
							document.getElementById(f).src="resources/images/ROBOTdj.png";
							break;
						case "16":
							document.getElementById("lab6"+fmch[f].fequipment_no).innerHTML="焊机状态：E-160一次输入电压过低";
							document.getElementById("lab6"+fmch[f].fequipment_no).style.backgroundColor="#FF0000";
							document.getElementById(f).src="resources/images/ROBOTdj.png";
							break;
						case "20":
							document.getElementById("lab6"+fmch[f].fequipment_no).innerHTML="焊机状态：E-200一次二次电流检出异常";
							document.getElementById("lab6"+fmch[f].fequipment_no).style.backgroundColor="#FF0000";
							document.getElementById(f).src="resources/images/ROBOTdj.png";
							break;
						case "21":
							document.getElementById("lab6"+fmch[f].fequipment_no).innerHTML="焊机状态：E-210电压检出异常";
							document.getElementById("lab6"+fmch[f].fequipment_no).style.backgroundColor="#FF0000";
							document.getElementById(f).src="resources/images/ROBOTdj.png";
							break;
						case "22":
							document.getElementById("lab6"+fmch[f].fequipment_no).innerHTML="焊机状态：E-220逆变电路反馈异常";
							document.getElementById("lab6"+fmch[f].fequipment_no).style.backgroundColor="#FF0000";
							document.getElementById(f).src="resources/images/ROBOTdj.png";
							break;
						case "30":
							document.getElementById("lab6"+fmch[f].fequipment_no).innerHTML="焊机状态：E-300温度异常";
							document.getElementById("lab6"+fmch[f].fequipment_no).style.backgroundColor="#FF0000";
							document.getElementById(f).src="resources/images/ROBOTdj.png";
							break;
						case "70":
							document.getElementById("lab6"+fmch[f].fequipment_no).innerHTML="焊机状态：E-700输出过流异常";
							document.getElementById("lab6"+fmch[f].fequipment_no).style.backgroundColor="#FF0000";
							document.getElementById(f).src="resources/images/ROBOTdj.png";
							break;
						case "71":
							document.getElementById("lab6"+fmch[f].fequipment_no).innerHTML="焊机状态：E-710输入缺相异常";
							document.getElementById("lab6"+fmch[f].fequipment_no).style.backgroundColor="#FF0000";
							document.getElementById(f).src="resources/images/ROBOTdj.png";
							break;
						}
					}
				}
			}
		};
	}
	
    //监听窗口大小变化
    window.onresize = function() {
    	setTimeout(domresize, 500);
    }

    //改变表格高宽
    function domresize() {
    	$("#dg").datagrid('resize', {
    		height : $("#body").height(),
    		width : $("#body").width()
    	});
    }
  	