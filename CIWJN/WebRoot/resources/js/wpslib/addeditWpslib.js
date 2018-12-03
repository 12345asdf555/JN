/**
 * 
 */
var oldchanel = 0;
$(function(){
	rule();
	statusRadio();
	addWpslib();
	$('#wltdlg').dialog( {
		onClose : function() {
			$("#wltfm").form("disableValidation");
		}
	})
	$("#wltfm").form("disableValidation");
})

var url = "";
var flag = 1;
function addWpslib(){
	flag = 1;
	$('#wltfm').form('clear');
	$('#wltdlg').window( {
		title : "新增工艺库",
		modal : true
	});
	$('#wltdlg').window('open');
	var statusId = document.getElementsByName("statusId");
	statusId[0].checked =  'checked';
	url = "wps/addWpslib";
}

function editWpslib(){
	flag = 2;
	$('#wltfm').form('clear');
	var row = $('#wpslibTable').datagrid('getSelected');
	if (row) {
		$('#wltdlg').window( {
			title : "修改工艺库",
			modal : true
		});
		$('#wltdlg').window('open');
		$('#wltfm').form('load', row);
		$('#validwl').val(row.wpslibName);
		url = "wps/updateWpslib?fid="+row.fid;
	}
}

function saveWpslib(){
	var wpslibName = $('#wpslibName').val();
	var fstatus = $("input[name='statusId']:checked").val();
	var messager = "";
	var url2 = "";
	if(flag==1){
		messager = "新增成功！";
		url2 = url+"?fstatus="+fstatus+"&wpslibName="+encodeURI(wpslibName);
	}else{
		messager = "修改成功！";
		url2 = url+"&fstatus="+fstatus+"&wpslibName="+encodeURI(wpslibName);
	}
	$('#wltfm').form('submit', {
		url : url2,
		onSubmit : function() {
			return $(this).form('enableValidation').form('validate');
		},
		success : function(result) {
			if(result){
				var result = eval('(' + result + ')');
				if (!result.success) {
					$.messager.show( {
						title : 'Error',
						msg : result.errorMsg
					});
				}else{
					$.messager.alert("提示", messager);
					$('#wltdlg').dialog('close');
					$('#wpslibTable').datagrid('reload');
					$("#validwl").val("");
				}
			}
			
		},  
	    error : function(errorMsg) {  
	        alert("数据请求失败，请联系系统管理员!");  
	    } 
	});
}

//工艺库状态
function statusRadio(){
	$.ajax({  
	    type : "post",  
	    async : false,
	    url : "wps/getStatusAll",  
	    data : {},  
	    dataType : "json", //返回数据形式为json  
	    success : function(result) {
	    	if (result) {
	    		var str = "";
	    		for (var i = 0; i < result.ary.length; i++) {
	    			str += "<input type='radio' class='radioStyle' name='statusId' id='sId' value=\"" + result.ary[i].id + "\" />"  
                  + result.ary[i].name;
	    		}
	            $("#radios").html(str);
	            $("input[name='statusId']").eq(0).attr("checked",true);
	        }  
	    },  
	    error : function(errorMsg) {  
	        alert("数据请求失败，请联系系统管理员!");  
	    }  
	});
}

var mflag = 1;
function addMainWps(){
	mflag = 1;
	$('#mwfm').form('clear');
	$('#mwdlg').window( {
		title : "新增工艺",
		modal : true
	});
	$('#fchanel').combobox('select',1);
	$('#fselect').combobox('select',102);
	$("#ftime").numberbox('setValue',30.0);
	$("#fadvance").numberbox('setValue',1);
	$("#fini_ele").numberbox('setValue',100);
	$("#fini_vol").numberbox('setValue',19.0);
	$("#fini_vol1").numberbox('setValue',0.0);
	$("#fweld_vol").numberbox('setValue',19.0);
	$("#fweld_vol1").numberbox('setValue',0.0);
	$("#farc_vol").numberbox('setValue',19.0);
	$("#farc_vol1").numberbox('setValue',0.0);
	$("#fweld_ele").numberbox('setValue',100);
	$("#farc_ele").numberbox('setValue',100);
	$("#fhysteresis").numberbox('setValue',1);
	$("#fcharacter").numberbox('setValue',0);
	$('#fgas').combobox('select',121);
	$('#fdiameter').combobox('select',132);
	$('#fmaterial').combobox('select',91);
	$("#fweld_tuny_ele").numberbox('setValue',0);
	$("#fweld_tuny_vol").numberbox('setValue',0);
	$("#farc_tuny_ele").numberbox('setValue',0);
	$("#farc_tuny_vol").numberbox('setValue',0);
	$('#farc').combobox('select',111);
	$('#mwdlg').window('open');
	var wlrow = $('#wpslibTable').datagrid('getSelected');
	url = "wps/addMainWps?fid="+wlrow.fid;
}

function editMainWps(row){
	mflag = 2;
	$('#mwfm').form('clear');
	if (row) {
		$('#mwdlg').window( {
			title : "修改工艺",
			modal : true
		});
		$('#mwdlg').window('open');
		$('#mwfm').form('load', row);
		url = "wps/updateMainWps?fid="+row.fid;
		oldchanel = row.fchanel;
	}
}

function saveMainWps(){
	if($('#fadvance').numberbox('getValue')<0||$('#fadvance').numberbox('getValue')>100){
		alert("提前送气范围：0~100");
		return;
	}
	if($('#fini_ele').numberbox('getValue')<30||$('#fini_ele').numberbox('getValue')>550){
		alert("初期电流范围：30~550");
		return;
	}
	if($('#fini_vol').numberbox('getValue')<12||$('#fini_vol').numberbox('getValue')>50){
		alert("初期电压范围：12~50");
		return;
	}
	if($('#fini_vol1').numberbox('getValue')<(-30)||$('#fini_vol1').numberbox('getValue')>(30)){
		alert("初期电压一元范围：-30~30");
		return;
	}
	if($('#fweld_ele').numberbox('getValue')<30||$('#fweld_ele').numberbox('getValue')>550){
		alert("焊接电流范围：30~550");
		return;
	}
	if($('#fweld_vol').numberbox('getValue')<12||$('#fweld_vol').numberbox('getValue')>50){
		alert("焊接电压范围：12~50");
		return;
	}
	if($('#fweld_vol1').numberbox('getValue')<(-30)||$('#fweld_vol1').numberbox('getValue')>(30)){
		alert("焊接电压一元范围：-30~30");
		return;
	}
	if($('#farc_ele').numberbox('getValue')<30||$('#farc_ele').numberbox('getValue')>550){
		alert("收弧电流范围：30~550");
		return;
	}
	if($('#farc_vol').numberbox('getValue')<12||$('#farc_vol').numberbox('getValue')>50){
		alert("收弧电压范围：12~50");
		return;
	}
	if($('#farc_vol1').numberbox('getValue')<(-30)||$('#farc_vol1').numberbox('getValue')>(30)){
		alert("收弧电压一元范围：-30~30");
		return;
	}
	if($('#fhysteresis').numberbox('getValue')<0||$('#fhysteresis').numberbox('getValue')>100){
		alert("滞后送气范围：0~100");
		return;
	}
	if($('#fcharacter').numberbox('getValue')<(-99)||$('#fcharacter').numberbox('getValue')>(99)){
		alert("电弧特性范围：-99~99");
		return;
	}
	var wpsLibRow = $('#wpslibTable').datagrid('getSelected');
	if(parseInt(oldchanel)!=$('#fchanel').combobox('getValue')){
		var num;
		$.ajax({  
		      type : "post",  
		      async : false,
		      url : "wps/getCountByWpslibidChanel?wpslibid="+wpsLibRow.fid+"&chanel="+$('#fchanel').combobox('getValue'),  
		      data : {},  
		      dataType : "json", //返回数据形式为json  
		      success : function(result) {
		          if (result) {
		        	  num = eval(result.count);
		          }  
		      },
		      error : function(errorMsg) {  
		          alert("数据请求失败，请联系系统管理员!");  
		      }  
		 });
  	  if(num>0){
		  alert("该通道规范已经存在!!!");
		  return;
	  }
	}
	var messager = "";
	if(mflag==1){
		messager = "新增成功！";
	}else{
		messager = "修改成功！";
	}
	var url2 = "";
	var finitial;
	var fcontroller;
	var fmode;
	if($("#finitial").is(":checked")==true){
	    finitial = 1;
	}else{
	  	finitial = 0;
	}
	if($("#fcontroller").is(":checked")==true){
	  	fcontroller = 1;
	}else{
	  	fcontroller = 0;
	}
	if($("#finitial").is(":checked")==true){
	  	fmode = 1;
	}else{
	  	fmode = 0;
	}
	var fselect = $('#fselect').combobox('getValue');
	var farc = $('#farc').combobox('getValue');
	var fmaterial = $('#fmaterial').combobox('getValue');
	var fgas = $('#fgas').combobox('getValue');
	var fdiameter = $('#fdiameter').combobox('getValue');
	var chanel = $('#fchanel').combobox('getValue');
	var ftime = $('#ftime').numberbox('getValue');
	var fadvance = $('#fadvance').numberbox('getValue');
	var fini_ele = $('#fini_ele').numberbox('getValue');
	var fweld_ele = $('#fweld_ele').numberbox('getValue');
	var farc_ele = $('#farc_ele').numberbox('getValue');
	var fhysteresis = $('#fhysteresis').numberbox('getValue');
	var fcharacter = $('#fcharacter').numberbox('getValue');
	var fweld_tuny_ele = $('#fweld_tuny_ele').numberbox('getValue');
	var farc_tuny_ele = $('#farc_tuny_ele').numberbox('getValue');
	var fini_vol = $('#fini_vol').numberbox('getValue');
	var fweld_vol = $('#fweld_vol').numberbox('getValue');
	var farc_vol = $('#farc_vol').numberbox('getValue');
	var fini_vol1 = $('#fini_vol1').numberbox('getValue');
	var fweld_vol1 = $('#fweld_vol1').numberbox('getValue');
	var farc_vol1 = $('#farc_vol1').numberbox('getValue');
	var fweld_tuny_vol = $('#fweld_tuny_vol').numberbox('getValue');
	var farc_tuny_vol = $('#farc_tuny_vol').numberbox('getValue');
  	url2 = url+"&finitial="+finitial+"&fcontroller="+fcontroller+"&fmode="+fmode+"&fselect="+fselect+"&farc="+farc+"&fmaterial="+fmaterial+"&fgas="+fgas+"&fdiameter="+fdiameter+"&chanel="+chanel+"&ftime="+ftime+"&fadvance="+fadvance+"&fini_ele="+fini_ele+"&fweld_ele="+fweld_ele+"&farc_ele="+farc_ele+"&fhysteresis="+fhysteresis+"&fcharacter="+fcharacter+"&fweld_tuny_ele="+fweld_tuny_ele+"&farc_tuny_ele="+farc_tuny_ele+"&fini_vol="+fini_vol+"&fini_vol1="+fini_vol1+"&fweld_vol="+fweld_vol+"&fweld_vol1="+fweld_vol1+"&farc_vol="+farc_vol+"&farc_vol1="+farc_vol1+"&fweld_tuny_vol="+fweld_tuny_vol+"&farc_tuny_vol="+farc_tuny_vol;
  	$.ajax({  
  	      type : "post",  
  	      async : false,
  	      url : url2,  
  	      data : {},  
  	      dataType : "json", //返回数据形式为json  
  	      success : function(result) {
  				if (!result.success) {
  					$.messager.show( {
  						title : 'Error',
  						msg : result.errorMsg
  					});
  					oldchanel=0;
  				} else {
  					$.messager.alert("提示", messager);
  					oldchanel=0;
  					$('#mwdlg').dialog('close');
  					$('#wpslibTable').datagrid('reload');
  				}
  	      },
  	      error : function(errorMsg) {  
  	          alert("数据请求失败，请联系系统管理员!");  
  	          oldchanel=0;
  	      }  
  	 });
}

function rule(){
	$("#farc").combobox({
		onSelect: function (record) {
			if(record.value==111){
				$('#farc_ele').numberbox("disable",true);
				$('#farc_vol').numberbox("disable",true);
				$('#farc_tuny_ele').numberbox("disable",true);
				$('#farc_tuny_vol').numberbox("disable",true);
				$('#farc_tuny_vol1').numberbox("disable",true);
				$('#farc_vol1').numberbox("disable",true);
				$('#ftime').numberbox("disable",true);
				$('#fini_ele').numberbox("disable",true);
				$('#fini_vol').numberbox("disable",true);
				$('#fini_vol1').numberbox("disable",true);
			}else if(record.value==112){
				$('#farc_ele').numberbox("enable",true);
				$('#farc_vol').numberbox("enable",true);
				$('#farc_tuny_ele').numberbox("enable",true);
				$('#farc_tuny_vol').numberbox("enable",true);
				$('#farc_tuny_vol1').numberbox("enable",true);
				$('#farc_vol1').numberbox("enable",true);
				$('#ftime').numberbox("disable",true);
				if($("#finitial").is(":checked")){
					$('#fini_ele').numberbox("enable",true);
					$('#fini_vol').numberbox("enable",true);
					$('#fini_vol1').numberbox("enable",true);
				}else{
					$('#fini_ele').numberbox("disable",true);
					$('#fini_vol').numberbox("disable",true);
					$('#fini_vol1').numberbox("disable",true);
				}
			}else if(record.value==113){
				$('#farc_ele').numberbox("enable",true);
				$('#farc_vol').numberbox("enable",true);
				$('#farc_tuny_ele').numberbox("enable",true);
				$('#farc_tuny_vol').numberbox("enable",true);
				$('#farc_tuny_vol1').numberbox("enable",true);
				$('#farc_vol1').numberbox("enable",true);
				$('#ftime').numberbox("disable",true);
				if($("#finitial").is(":checked")){
					$('#fini_ele').numberbox("enable",true);
					$('#fini_vol').numberbox("enable",true);
					$('#fini_vol1').numberbox("enable",true);
				}else{
					$('#fini_ele').numberbox("disable",true);
					$('#fini_vol').numberbox("disable",true);
					$('#fini_vol1').numberbox("disable",true);
				}
			}else{
				$('#farc_ele').numberbox("disable",true);
				$('#farc_vol').numberbox("disable",true);
				$('#farc_tuny_ele').numberbox("disable",true);
				$('#farc_tuny_vol').numberbox("disable",true);
				$('#farc_tuny_vol1').numberbox("disable",true);
				$('#farc_vol1').numberbox("disable",true);
				$('#fini_ele').numberbox("disable",true);
				$('#fini_vol').numberbox("disable",true);
				$('#fini_vol1').numberbox("disable",true);
				$('#ftime').numberbox("enable",true);
				$('#ftime').numberbox("enable",true);
			}
		}
	});
	
	$("#finitial").click(function(){
		if($("#finitial").is(":checked")){
			if($('#farc').combobox('getValue')==112||$('#farc').combobox('getValue')==113){
				$('#fini_ele').numberbox("enable",true);
				$('#fini_vol').numberbox("enable",true);
				$('#fini_vol1').numberbox("enable",true);
			}else{
				$('#fini_ele').numberbox("disable",true);
				$('#fini_vol').numberbox("disable",true);
				$('#fini_vol1').numberbox("disable",true);
			}
		}else{
			$('#fini_ele').numberbox("disable",true);
			$('#fini_vol').numberbox("disable",true);
			$('#fini_vol1').numberbox("disable",true);
		}
	});
	
	$("#fmaterial").combobox({
		onSelect: function (record) {
			if(record.value==91){
				$('#fgas').combobox('clear');
				$('#fgas').combobox('loadData', [{"text": "CO2", "value": "121"},{"text": "MAG", "value": "122"}]);
				$('#fdiameter').combobox('clear');
				$('#fdiameter').combobox('loadData', [{"text": "Φ1.0", "value": "131"},{"text": "Φ1.2", "value": "132"},{"text": "Φ1.4", "value": "133"},{"text": "Φ1.6", "value": "134"}]);
			}else if(record.value==92){
				$('#fgas').combobox('clear');
				$('#fgas').combobox('loadData', [{"text": "MIG", "value": "123"}]);
				$('#fdiameter').combobox('clear');
				$('#fdiameter').combobox('loadData', [{"text": "Φ1.2", "value": "132"},{"text": "Φ1.6", "value": "134"}]);
			}else if(record.value==93){
				$('#fgas').combobox('clear');
				$('#fgas').combobox('loadData', [{"text": "CO2", "value": "121"}]);
				$('#fdiameter').combobox('clear');
				$('#fdiameter').combobox('loadData', [{"text": "Φ1.2", "value": "132"},{"text": "Φ1.4", "value": "133"},{"text": "Φ1.6", "value": "134"}]);
			}else{
				$('#fgas').combobox('clear');
				$('#fgas').combobox('loadData', [{"text": "CO2", "value": "121"}]);
				$('#fdiameter').combobox('clear');
				$('#fdiameter').combobox('loadData', [{"text": "Φ1.2", "value": "132"},{"text": "Φ1.6", "value": "134"}]);
			}
			var fgas = $('#fgas').combobox('getData');
			var fdiameter = $('#fdiameter').combobox('getData');
			$('#fgas').combobox('select',fgas[0].value);
			$('#fdiameter').combobox('select',fdiameter[0].value);
		}
	});
}