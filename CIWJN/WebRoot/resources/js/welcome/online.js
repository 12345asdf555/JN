var work = new Array();
var wait = new Array();
var weld = new Array();
var websocketURL;
var socket;
var redata;
var symbol=0;
var machine;
var namex;
$(function(){
	welder();
	machine();
	websocketurl();
	websocket();
})

$(document).ready(function(){
	showPersonChart();
	showWelderChart();
})

function welder(){
	//焊工总数name.length
	$.ajax({  
	      type : "post",  
	      async : false,
	      url : "td/allWeldname",  
	      data : {},  
	      dataType : "json", //返回数据形式为json  
	      success : function(result) {
	          if (result) {
	        	  namex=eval(result.rows);
	          }  
	      },
	      error : function(errorMsg) {  
	          alert("数据请求失败，请联系系统管理员!");  
	      }  
	 });
}

function machine(){
	//焊机总数machine.length
	$.ajax({  
	      type : "post",  
	      async : false,
	      url : "td/getAllPosition",  
	      data : {},  
	      dataType : "json", //返回数据形式为json  
	      success : function(result) {
	    	  if (result) {
	    		  machine = eval(result.rows);
	          }  
	      },
	      error : function(errorMsg) {  
	          alert("数据请求失败，请联系系统管理员!");  
	      }  
	 });
}

function websocketurl(){
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
}

function websocket() {
	if(typeof(WebSocket) == "undefined") {
		WEB_SOCKET_SWF_LOCATION = "resources/js/WebSocketMain.swf";
		WEB_SOCKET_DEBUG = true;
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
/*		setTimeout(function(){
			if(symbol==0){
				alert("在线统计连接成功，但未接收到任何数据");
			}
		},5000);*/
	};
	socket.onmessage = function(msg) {
		var xxx = msg.data;
		if(xxx.substring(0,2)!="7E"){
		redata=msg.data;
		//53改为69
		for(var i = 0;i < redata.length;i+=69){
			if(redata.substring(8+i, 12+i)!="0000"){
				if(weld.length==0){
					weld.push(redata.substring(8+i, 12+i));
				}else{
					for(var j=0;j<weld.length;j++){
						if(weld[j]!=redata.substring(8+i, 12+i)){
							if(j==weld.length-1){
								weld.push(redata.substring(8+i, 12+i));
							}
						}else{
							break;
						}
					}
				}
				if(redata.substring(0+i,2+i)=="03"||redata.substring(0+i,2+i)=="05"||redata.substring(0+i,2+i)=="07"){
					if(work.length==0){
						work.push(redata.substring(4+i, 8+i));
					}else{
						for(var j=0;j<work.length;j++){
							if(work[j]!=redata.substring(4+i, 8+i)){
								if(j==work.length-1){
									work.push(redata.substring(4+i, 8+i));
								}
							}else{
								break;
							}
						}
					}
			  }
			if(redata.substring(0+i,2+i)=="00"){
				if(wait.length==0){
					wait.push(redata.substring(4+i, 8+i));
				}else{
					for(var j=0;j<wait.length;j++){
						if(wait[j]!=redata.substring(4+i, 8+i)){
							if(j==wait.length-1){
								wait.push(redata.substring(4+i, 8+i));
							}
						}else{
							break;
						}
					}
				}
			}
		};
		//新增定时器
		if(symbol==0){
			window.setInterval(function() {
				work.length=0;
				weld.length=0;
				wait.length=0;
			}, 2950)
		}
		symbol=1;
		}
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
}

var personcharts;
function showPersonChart(){
   	//初始化echart实例
	personcharts = echarts.init(document.getElementById("person"));
	//显示加载动画效果
	personcharts.showLoading({
		text: '稍等片刻,精彩马上呈现...',
		effect:'whirling'
	});
	option = {
		    title: {
		        text: '焊工总数\n'+namex.length+'人',
		        left: 'center',
		        top:'45%',//标题显示在pie中间
		        textStyle:{
		            fontSize:12,
		            align:'center'
		          }
		    },
		    tooltip : {
		        trigger: 'item',
		        formatter: "{a} <br/>{b} : {c} ({d}%)"
		    },
		    series : [
		        {
		            name:'焊工在线统计',
		            type:'pie',
		            radius : ['40%', '60%'],
		            color:['#F6C95E','#82B3E0'],
		            data:[
		                {value:weld.length, name:'在线'},
		                {value:namex.length-weld.length, name:'离线'}
		            ].sort(function (a, b) { return a.value - b.value; }),
		            label: {
		            	widthL:10,
		                normal: {
		                	formatter: '{b}:\n{d}%',
		                    textStyle: {
		                        color: '#000'
		                    }
		                }
		            },
		            labelLine: {
		                normal: {
		                    length: 10,
		                    length2: 5
		                }
		            },
		            animationType: 'scale',
		            animationEasing: 'elasticOut',
		            animationDelay: function (idx) {
		                return Math.random() * 200;
		            }
		        }
		    ]
	}
	//为echarts对象加载数据
	personcharts.setOption(option);
	//隐藏动画加载效果
	personcharts.hideLoading();
}

function refreshPersonData(data){
    if(!personcharts){
         return;
    }
    //更新数据
     var option = personcharts.getOption();
     option.series[0].data = data.sort(function (a, b) { return a.value - b.value; });   
     personcharts.setOption(option);    
}
window.setInterval(function () {
	var data = [{value:weld.length, name:'在线'},{value:namex.length-weld.length, name:'离线'}];
	refreshPersonData(data);
},30000);

var weldercharts;
function showWelderChart(){
   	//初始化echart实例
	weldercharts = echarts.init(document.getElementById("welder"));
	//显示加载动画效果
	weldercharts.showLoading({
		text: '稍等片刻,精彩马上呈现...',
		effect:'whirling'
	});
	option = {
		    title: {
		        text: '焊机总数\n'+machine.length+'台',
		        left: 'center',
		        top:'45%',//标题显示在pie中间
		        textStyle:{
		            fontSize:12,
		            align:'center'
		          }
		    },
		    tooltip : {
		        trigger: 'item',
		        formatter: "{a} <br/>{b} : {c} ({d}%)"
		    },
		    series : [
		        {
		            name:'焊机在线统计',
		            type:'pie',
		            radius : ['40%', '60%'],
		            color:['#F6C95E','#6870B3','#82B3E0'],
		            data:[
		                {value:work.length, name:'工作'},
		                {value:wait.length, name:'待机'},
		                {value:machine.length-work.length-wait.length, name:'关机'}
		            ].sort(function (a, b) { return a.value - b.value; }),
		            label: {
		                normal: {
			            	formatter: '{b}:\n{d}%',
		                    textStyle: {
		                        color: '#000'
		                    }
		                }
		            },
		            labelLine: {
		                normal: {
		                    length: 10,
		                    length2: 5
		                }
		            },
		            animationType: 'scale',
		            animationEasing: 'elasticOut',
		            animationDelay: function (idx) {
		                return Math.random() * 200;
		            }
		        }
		    ]
	}
	//为echarts对象加载数据
	weldercharts.setOption(option);
	//隐藏动画加载效果
	weldercharts.hideLoading();
}

function refreshWelderData(data){
    if(!weldercharts){
         return;
    }
    //更新数据
     var option = weldercharts.getOption();
     option.series[0].data = data.sort(function (a, b) { return a.value - b.value; });   
     weldercharts.setOption(option);    
}
window.setInterval(function () {
	var data = [{value:work.length, name:'工作'},{value:wait.length, name:'待机'},{value:machine.length-work.length-wait.length, name:'关机'}];
	refreshWelderData(data);
},30000);