$(function(){
//	getHiddenMenu();
	getUserInsframework();
	addWelcom("欢迎使用","welcome.jsp");
	tabsIncident();
	$("#persondiv").hide();
	$("#junctiondiv").hide();
	$("#machinediv").hide();
})

/**
 * 隐藏特定菜单
 */
function getHiddenMenu(){
	$.ajax({
		type : "post",
		async : true,
		url : "hierarchy/getHiddenMenu",
		data : {},
		dataType : "json",
		success : function(result){
			var li=document.getElementsByTagName("li");
			for(var r=0;r<result.ary.length;r++){
				for(var i=0;i<li.length;i++){
					if(li[i].innerText.replace(/\s+/g,"") == result.ary[r].name){
						li[i].style.display="none";
					}
				}
				for(var i=0;i<$("#persondiv ul li").length;i++){
					if($("#persondiv ul li")[i].innerText.replace(/\s+/g,"") == result.ary[r].name){
						$("#persondiv ul li")[i].style.display="none";
					}
				}
				for(var i=0;i<$("#junctiondiv ul li").length;i++){
					if($("#junctiondiv ul li")[i].innerText.replace(/\s+/g,"") == result.ary[r].name){
						$("#junctiondiv ul li")[i].style.display="none";
					}
				}
				for(var i=0;i<$("#machinediv ul li").length;i++){
					if($("#machinediv ul li")[i].innerText.replace(/\s+/g,"") == result.ary[r].name){
						$("#machinediv ul li")[i].style.display="none";
					}
				}
			}
			
		},
		error : function(errorMsg){
			alert("数据请求失败，请联系系统管理员!");
		}
	})
}

function getUserInsframework(){
	$.ajax({
		type : "post",
		async : true,
		url : "hierarchy/getUserInsframework",
		data : {},
		dataType : "json",
		success : function(result){
			var str = "<span>"+result.uname+"</span>";
			$("#username").append(str);
			for(var r=0;r<result.ary.length;r++){
				resourceary.push(result.ary[r].resource);
			}
			anaylsis(result.ipurl);
		},
		error : function(errorMsg){
			alert("数据请求失败，请联系系统管理员!");
		}
	})
}

function openSubmenus(index1,index2){
	$("#subimg"+index1+"_"+index2).css("transform","rotate(0deg)");
	if($("#div"+index1+"_"+index2).is(":hidden")){
		$("#div"+index1+"_"+index2).show();
	}else{
		$("#div"+index1+"_"+index2).hide();
	}
}

function loadxmlDoc(file) {
	try {
		//IE
		xmlDoc = new ActiveXObject("Microsoft.XMLDOM");
	} catch (e) {
		//Firefox, Mozilla, Opera, etc
		xmlDoc = document.implementation.createDocument("", "", null);
	}

	try {
		xmlDoc.async = false;
		xmlDoc.load(file); //chrome没有load方法
	} catch (e) {
		//针对Chrome,不过只能通过http访问,通过file协议访问会报错
		var xmlhttp = new window.XMLHttpRequest();
		xmlhttp.open("GET", file, false);
		xmlhttp.send(null);
		xmlDoc = xmlhttp.responseXML.documentElement;
	}
	return xmlDoc;
}

var resourceary = [];
/*function s() {
	$.ajax({
		type : "post",
		async : true,
		url : "resource/getUserResource",
		data : {},
		dataType : "json",
		success : function(result){
			for(var r=0;r<result.ary.length;r++){
				resourceary.push(result.ary[r].resource);
				getResource(ipurl);
			}
		},
		error : function(errorMsg){
			alert("数据请求失败，请联系系统管理员!");
		}
	})
}*/

function anaylsis(ipurl){
	var object = loadxmlDoc(ipurl+"ConfigFile/menu.xml");
	var menuinfo = object.getElementsByTagName("Menuinfo");
	for(var m = 1; m <= menuinfo.length; m++){
		for (var i = 0; i < menuinfo.length; i++) {
			var showIndex = menuinfo[i].getElementsByTagName("ShowIndex");//显示位置
			if (document.all) {
				showIndex = showIndex[0].text;
			} else {
				showIndex = showIndex[0].textContent;
			}
			if(m == showIndex){
				var menuName = menuinfo[i].getElementsByTagName("Name");//菜单名
				var submenus = menuinfo[i].getElementsByTagName("Submenus");//二级菜单
				var imgName = menuinfo[i].getElementsByTagName("ImgName");//菜单图标
				var array = [], firstcontext = "";
				if (document.all) {
					menuName = menuName[0].text,imgName = imgName[0].text;
				} else {
					menuName = menuName[0].textContent,imgName = imgName[0].textContent;
				}
				var context = '<ul id="ul'+showIndex+'">';
				for (var x = 0; x < submenus.length; x++) {
					var firstName = submenus[x].getElementsByTagName("FirstName");
					var firstResource = submenus[x].getElementsByTagName("FirstResource");
					var firstimgName = submenus[x].getElementsByTagName("FirstImgName");//菜单图标
					var firstsubmenus = submenus[x].getElementsByTagName("FirstSubmenus");//三级菜单
					var firstshowIndex = submenus[x].getElementsByTagName("FirstShowIndex");//显示位置
					var subnenustext,flag = true,lastcontext = "";
					if (document.all) { //IE
						firstName = firstName[0].text,firstResource = firstResource[0].text,firstimgName = firstimgName[0].text,
						subnenustext = firstsubmenus[0].text,firstshowIndex = firstshowIndex[0].text;
					} else {
						firstName = firstName[0].textContent,firstResource = firstResource[0].textContent,firstimgName = firstimgName[0].textContent,
						subnenustext = firstsubmenus[0].textContent,firstshowIndex = firstshowIndex[0].textContent;
					}
					if(subnenustext.trim()){
						flag = false;
						array.push(firstshowIndex);
						firstcontext +='<li onclick="changeColor(this)" id="'+firstshowIndex+'"><a href="javascript:openSubmenus('+showIndex+','+firstshowIndex+')">'+
						'<div><img src="resources/images/'+firstimgName+'" />&nbsp;&nbsp;'+firstName+'&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<img src="resources/images/arrow.png" id="subimg'+showIndex+'_'+firstshowIndex+'"/></div>'+
						'</a></li><li><div id="div'+showIndex+'_'+firstshowIndex+'" style="display:none;"><ul id="last'+firstshowIndex+'">';
						for (var j = 0; j < firstsubmenus.length; j++) {
							var LastName = firstsubmenus[j].getElementsByTagName("LastName");
							var LastResource = firstsubmenus[j].getElementsByTagName("LastResource");
							var LastimgName = firstsubmenus[j].getElementsByTagName("LastImgName");//菜单图标
							var lastshowIndex = firstsubmenus[j].getElementsByTagName("LastShowIndex");//显示位置
							if (document.all) { //IE
								LastName = LastName[0].text,LastResource = LastResource[0].text,LastimgName = LastimgName[0].text,lastshowIndex = lastshowIndex[0].text;
							} else {
								LastName = LastName[0].textContent,LastResource = LastResource[0].textContent,LastimgName = LastimgName[0].textContent,lastshowIndex = lastshowIndex[0].textContent;
							}
							if(resourceary.indexOf(LastResource)!=-1){
								lastcontext += '<li onclick="changeColor(this)" id="last'+lastshowIndex+'"><a href="javascript:openTab(\''+encodeURI(LastName)+'\',\''+LastResource+'\')" ><div><img src="resources/images/'+LastimgName+'" />&nbsp;&nbsp;'+LastName+'</div></a></li>';
							}
						}
						firstcontext += lastcontext+'</ul></div></li>';
						if(lastcontext == null || lastcontext == ""){
							firstcontext = "";
						}
					}
					if(flag){
						if(resourceary.indexOf(firstResource)!=-1){
							firstcontext +='<li onclick="changeColor(this)" id="'+firstshowIndex+'"><a href="javascript:openTab(\''+encodeURI(firstName)+'\',\''+firstResource+'\')" ><div><img src="resources/images/'+firstimgName+'" />&nbsp;&nbsp;'+firstName+'</div></a></li>';
						}
					}
				}
				context += firstcontext+'</ul>';
				if(firstcontext != null && firstcontext != ""){
					//动态渲染easyui的菜单样式
					$('#accordiondiv').accordion('add', {
						title : menuName,
						content : context,
						iconCls: imgName,
						selected : false
					});
					menusort("ul"+showIndex,true);
					for(var f=0;f<array.length;f++){
						menusort("last"+array[f],false);
					}
				}
				$("#accordiondiv").accordion({
		            selected:0
		        })
			}
		}
	}
	$.parser.parse($("#accordiondiv"));
}

//根据位置进行排序
function menusort(name,flag){
	var ul=document.getElementById(name);
    var li=ul.getElementsByTagName("li");
    var list=[];
    //将li添加到list数组
    for(var n=0;n<li.length;n++){
    	var subid = li[n].id.substring(0, 4);
    	if(flag){
        	if(subid!="last"){
            	list.push(li[n]);
        	}
    	}else{
            list.push(li[n]);
    	}
    	
    }
    //对数组进行比较排序
    list.sort(function (li1,li2){
    	var n1,n2
    	if(flag){
    		n1=parseInt(li1.id);
    		n2=parseInt(li2.id);
    	}else{
    		n1=parseInt(li1.id.substring(4));
    		n2=parseInt(li2.id.substring(4));
    	}
        return n1-n2;
    })
    for(var x=0;x<list.length;x++){
       ul.appendChild(list[x]);
    }
}

//打开标签页
function openTab(name,resource){
	addTab(name,resource);
}

/*function openMachineTask(){
	addTab("焊机任务表","datastatistics/openMachineTask");
}

function openTaskDetai(){
	addTab("生产任务详情","datastatistics/goTaskDetail");
}

function openFauit(){
	addTab("故障报表","datastatistics/goFauit");
}

function openItemData(){
	addTab("班组生产数据","datastatistics/goItemData");
}

function openMachineData(){
	addTab("设备生产数据","datastatistics/goMachineData");
}

function openPersonData(){
	addTab("人员生产数据","datastatistics/goPersonData");
}

function openWorkpieceData(){
	addTab("工件生产数据","datastatistics/goWorkpieceData");
}

function openWeldItemData(){
	addTab("班组焊接数据","datastatistics/goWeldItemData");
}

function openWeldMachineData(){
	addTab("设备焊接数据","datastatistics/goWeldMachineData");
}

function openWeldPersonData(){
	addTab("人员焊接数据","datastatistics/goWeldPersonData");
}

function openWeldWorkpieceData(){
	addTab("工件焊接数据","datastatistics/goWeldWorkpieceData");
}

function openUser(){
	addTab("用户管理","user/AllUser");
}

function openRole(){
	addTab("角色管理","role/AllRole");
}

function openAuthority(){
	addTab("权限管理","authority/AllAuthority");
}

function openResource(){
	addTab("资源管理","resource/AllResource");
}

function openInsframework(){
	addTab("组织机构管理","insframework/goInsframework");
}

function openDictionary(){
	addTab("字典管理",'Dictionary/goDictionary');
}

function openCompanytEfficiency(){
	addTab("焊工工效","companyChart/goCompanyEfficiency");
}

function openCompanyUse(){
	addTab("单台设备运行数据统计","companyChart/goCompanyUse");
}
function openMachine(){
	addTab("维修记录管理","maintain/goMaintain");
}

function openMaxMin(){
	addTab("对照分析","companyChart/goContrast");
}

function openCompanyovertime(){
	addTab("超时待机统计","companyChart/goCompanyOvertime");
}
function openCompanyIdle(){
	addTab("设备闲置率","companyChart/goCompanyIdle");
}
function openWeldParameter(){
	addTab("焊接参数维度表","rep/weldpara");
}

function openWireUse(){
	addTab("焊丝用量维度表","rep/wireuse");
}

function openWelderReport(){
	addTab("焊工维度表","rep/welderreport");
}

function openParameter(){
	addTab("参数设置","Dictionary/goParameter");
}

function openProduct(){
	addTab("产品管理","product/AllProduct");
}

function openWps(){
	addTab("工艺管理","wps/goWpslib");
}

function openWeldTask(){
	addTab("派工任务管理","weldtask/goWeldTask");
}

function openTaskResult(){
	addTab("执行任务修改","weldtask/goTaskResult");
}
function openTaskEvaluate(){
	addTab("任务确认评价","weldtask/goTaskEvaluate");
}
function openSpe(){
	addTab("规范管理","wps/AllSpe");
}

function openWeldingmachineMax(){
	addTab("焊机工时最高","companyChart/goCompanyWmMax");
}

function openWeldingmachineMin(){
	addTab("焊机工时最低","companyChart/goCompanyWmMin");
}

function openWelderMax(){
	addTab("焊工工时最高","companyChart/goCompanyWelderMax");
}

function openWelderMin(){
	addTab("焊工工时最低","companyChart/goCompanyWelderMin");
}

function openWeldingMachine(){
	addTab("焊机设备管理","weldingMachine/goWeldingMachine");
}

function openWedJunction(){
	addTab("任务管理","weldedjunction/goWeldedJunction");
}

function openPerson(){
	addTab("焊工管理","welders/AllWelder");
}

function openGather(){
	addTab("采集模块管理","gather/goGather");
}

function openCompanyHour(){
	addTab("任务焊接工时","companyChart/goCompanyHour");
}

function openCompanyoverproof(){
	addTab("焊接工艺超标","companyChart/goCompanyOverproof");
}

function openCompanyLoads(){
	addTab("设备负荷率","companyChart/goCompanyLoads");
}

function openCompanyNoLoads(){
	addTab("设备空载率","companyChart/goCompanyNoLoads");
}

function openCompanyTd(){
	window.open("td/AllTd");
}

function openHistory(){
	addTab("历史曲线","rep/history");
}

function openHistoryJunction(){
	addTab("历史曲线.","rep/historyJunction");
}*/

function addWelcom(title,url){
	//该面板是否已打开
	if(!$("#tabs").tabs('exists',title)){
		$("#tabs").tabs('add',{    
		    title:title,
		    content:createFrame(url)
		});
	}else{
		$("#tabs").tabs('select',title);
	}
	// 为选项卡绑定右键
	$(".tabs-inner").bind('contextmenu', function(e) {
		$('#tabMenu').menu('show', {
			left : e.pageX,
			top : e.pageY
		});

		var subtitle = $(this).children(".tabs-closable").text();

		$('#tabMenu').data("currtab", subtitle);
		$('#tabs').tabs('select', subtitle);
		return false;
	});
	
}

function addTab(title,url){
	//该面板是否已打开
	if(!$("#tabs").tabs('exists',title)){
		$("#tabs").tabs('add',{    
		    title:title,
		    content:createFrame(url),    
		    closable:true 
		});
	}else{
		$("#tabs").tabs('select',title);
	}
	// 为选项卡绑定右键
	$(".tabs-inner").bind('contextmenu', function(e) {
		$('#tabMenu').menu('show', {
			left : e.pageX,
			top : e.pageY
		});

		var subtitle = $(this).children(".tabs-closable").text();

		$('#tabMenu').data("currtab", subtitle);
		$('#tabs').tabs('select', subtitle);
		return false;
	});
	
}

function createFrame(url) {
	var s = '<iframe scrolling="auto" frameborder="0"  src="' + url + '" style="width:100%;height:100%;"></iframe>';
	return s;
}


//标签页事件
function tabsIncident(){
	//刷新
	$('#refreshtab').click(function() {
		var currTab = $('#tabs').tabs('getSelected');
		var url = $(currTab.panel('options').content).attr('src');
		$('#tabs').tabs('update', {
			tab : currTab,
			options : {
				content : createFrame(url)
			}
		})
	})
	//关闭标签页
	$("#closetab").click(function(){
		var currtab_title = $('#tabMenu').data("currtab");
		$('#tabs').tabs('close', currtab_title);
	})
	// 全部关闭
	$('#closeAll').click(function() {
		$('.tabs-inner span').each(function(i, n) {
			var t = $(n).text();
			if(t!="欢迎使用"){
				$('#tabs').tabs('close', t);
			}
		});
	});
	// 关闭其他标签页
	$('#closeOther').click(function() {
		$("#closeRight").click();
		$('#closeLeft').click();
	});
	//关闭右侧标签页
	$('#closeRight').click(function(){
		var nextall = $('.tabs-selected').nextAll();
		nextall.each(function(i, n) {
			var t = $('a:eq(0) span', $(n)).text();
			if(t!="欢迎使用"){
				$('#tabs').tabs('close', t);
			}
		});
	})
	//关闭左侧标签页
	$('#closeLeft').click(function() {
		var prevall = $('.tabs-selected').prevAll();
		prevall.each(function(i, n) {
			var t = $('a:eq(0) span', $(n)).text();
			if(t!="欢迎使用"){
				$('#tabs').tabs('close', t);
			}
		});
	});
}

//选中时改变背景颜色
function changeColor(obj){
	$("ul li").css("backgroundColor","#ffffff");
	obj.style.background = "#fecf5d";
}

//显示系统当前时间
function time(){
	var week,week_index;
	week = ["星期天","星期一","星期二","星期三","星期四","星期五","星期六"];
	var date =  new Date();
	year = date.getFullYear();
	month = date.getMonth() + 1;
	day = date.getDate();
	hours = date.getHours();
	oldminutes = date.getMinutes();
	week_index = date.getDay();
	minutes = oldminutes;
	if(oldminutes < 10){
		minutes = "0" + oldminutes;
    }
	$("#headtime").html(year + "-" + month + "-" + day + " / " + week[week_index]  + " / " + hours + ":" + minutes);

};

setInterval("time()",1000);

