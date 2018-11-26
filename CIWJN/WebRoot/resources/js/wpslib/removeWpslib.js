/**
 * 
 */
$(function(){
	$('#rmwltdlg').dialog( {
		onClose : function() {
			$("#rmwltfm").form("disableValidation");
		}
	})
	$("#rmwltfm").form("disableValidation");
})

var url = "";
function openRemoveWpslib(){
	$('#rmwltfm').form('clear');
	var row = $('#wpslibTable').datagrid('getSelected');
	if (row) {
		$('#rmwltdlg').window( {
			title : "删除整个工艺库",
			modal : true
		});
		$('#rmwltdlg').window('open');
		$('#rmwltfm').form('load', row);
		url = "wps/removeWpslib?fid="+row.fid;
	}
}

function removeWpslib(){
	$.messager.confirm('提示', '此操作不可撤销并同时该库内所有工艺，是否确认删除?', function(flag) {
		if (flag) {
			$.ajax({  
		        type : "post",  
		        async : false,
		        url : url,  
		        data : {},  
		        dataType : "json", //返回数据形式为json  
		        success : function(result) {
		            if (result) {
		            	if (!result.success) {
							$.messager.show( {
								title : 'Error',
								msg : result.msg
							});
						} else {
							$.messager.alert("提示", "删除成功！");
							$('#rmwltdlg').dialog('close');
							$('#wpslibTable').datagrid('reload');
						}
		            }  
		        },  
		        error : function(errorMsg) {  
		            alert("数据请求失败，请联系系统管理员!");  
		        }  
		   }); 
		}
	});
}

function openRemoveMainWps(row){
	$('#rmmwfm').form('clear');
	if (row) {
		$('#rmmwdlg').window( {
			title : "删除工艺",
			modal : true
		});
		$('#rmmwdlg').window('open');
/*  		$('#chanel').combobox('select',row.fchanel);
  		$('#fselect').combobox('select',row.fselect);
		$("#ftime").numberbox('setValue',row.ftime);
		$("#fadvance").numberbox('setValue',row.fadvance);
		$("#fini_ele").numberbox('setValue',row.fini_ele);
		$("#fini_vol").numberbox('setValue',row.fini_vol);
		$("#fini_vol1").numberbox('setValue',row.fini_vol1);
		$("#fweld_vol").numberbox('setValue',row.fweld_vol);
		$("#fweld_vol1").numberbox('setValue',row.fweld_vol1);
		$("#farc_vol").numberbox('setValue',row.farc_vol);
		$("#farc_vol1").numberbox('setValue',row.farc_vol1);
		$("#fweld_ele").numberbox('setValue',row.fweld_ele);
		$("#farc_ele").numberbox('setValue',row.farc_ele);
		$("#fhysteresis").numberbox('setValue',row.fhysteresis);
		$("#fcharacter").numberbox('setValue',row.fcharacter);
		$('#fgas').combobox('select',row.fgas);
		$('#fdiameter').combobox('select',row.fdiameter);
		$('#fmaterial').combobox('select',row.fmaterial);
		$("#fweld_tuny_ele").numberbox('setValue',row.fweld_tuny_ele);
		$("#fweld_tuny_vol").numberbox('setValue',row.fweld_tuny_vol);
		$("#farc_tuny_ele").numberbox('setValue',row.farc_tuny_ele);
		$("#farc_tuny_vol").numberbox('setValue',row.farc_tuny_vol);
		if(row.finitial=="是"){
			$("#finitial").prop("checked",true);
		}
		$('#farc').combobox('select',row.farc);
		if(row.fcontroller=="是"){
			$("#fcontroller").prop("checked",true);
		}
		if(row.fmode=="是"){
			$("#fmode").prop("checked",true);
		}*/
		$('#rmmwfm').form('load', row);
		url = "wps/removeMainWps?fid="+row.fid;
	}
}

function removeMainwps(){
	$.messager.confirm('提示', '此操作不可撤销，是否确认删除?', function(flag) {
		if (flag) {
			$.ajax({  
		        type : "post",  
		        async : false,
		        url : url,  
		        data : {},  
		        dataType : "json", //返回数据形式为json  
		        success : function(result) {
		            if (result) {
		            	if (!result.success) {
							$.messager.show( {
								title : 'Error',
								msg : result.msg
							});
						} else {
							$.messager.alert("提示", "删除成功！");
							$('#rmmwdlg').dialog('close');
							$('#wpslibTable').datagrid('reload');
						}
		            }  
		        },  
		        error : function(errorMsg) {  
		            alert("数据请求失败，请联系系统管理员!");  
		        }  
		   }); 
		}
	});
}