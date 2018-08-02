$(function(){
	$("#welderNo").next().hide();
	InsframeworkCombobox();
	$('#dlg').dialog( {
		onClose : function() {
			$('#itemid').combobox('clear');
			$("#fm").form("disableValidation");
		}
	});
	$("#fm").form("disableValidation");
})

var url = "";
var flag = 1;
function addWeldedjunction(){
	flag = 1;
	$('#dlg').window( {
		title : "新增任务",
		modal : true
	});
	$('#dlg').window('open');
	$('#fm').form('clear');
	url = "weldtask/addWeldTask";
}

function editWeldedjunction(){
	flag = 2;
	var row = $('#weldTaskTable').datagrid('getSelected');
	if(row.operateid==1){
		 alert("任务已完成，无法进行修改或删除！！！"); 
	}
	else{
	$('#fm').form('clear');
	if (row) {
		$('#dlg').window( {
			title : "修改任务",
			modal : true
		});
		$('#dlg').window('open');
		$('#fm').form('load', row);
		$("#oldno").val(row.taskNo);
		$("#machineid").val(row.machineid);
		$("#taskid").val(row.taskid);
		url = "weldtask/getEvaluate?id="+row.id+"&result="+""+"&welderid="+row.welderid;
	}
}
}
function saveedit(){
	var temp;
	var url2;
	var taskNo= document.getElementById("taskNo").value;
	var taskid= document.getElementById("taskid").value;
	var machineid= document.getElementById("machineid").value;
	var machineNo=document.getElementById("machineNo").value;
	var resultName="";
	//alert(resultName.value);
    var rows = $("#weldTaskTable").datagrid("getSelections");
	if(flag==2){
		temp=2;
		url2=url+"&resultid="+""+"&welderNo="+rows[0].welderNo+"&taskid="+taskid+"&machineid="+machineid+"&operateid="+temp+"&taskNo="+taskNo+"&machineNo="+machineNo;
	}
	$('#fm').form('submit', {
		url : url2,
		onSubmit : function() {
			return $(this).form('enableValidation').form('validate');
		},
		success : function(result) {
			if (result) {
				var result = eval('(' + result + ')');
				if (!result.success) {
					$.messager.show({
						title : 'Error',
						msg : result.errorMsg
					});
				} else {
					if(!result.msg==null){
						$.messager.alert("提示", messager);
					}
					$('#dlg').dialog('close');
					$('#weldTaskTable').datagrid('reload');
				}
			}

		},
		error : function(errorMsg) {
			alert("数据请求失败，请联系系统管理员!");
		}
	});
}

//所属项目
function InsframeworkCombobox(){
	$.ajax({  
      type : "post",  
      async : false,
      url : "weldingMachine/getInsframeworkAll",  
      data : {},  
      dataType : "json", //返回数据形式为json  
      success : function(result) {  
          if (result) {
              var optionStr = '';
              for (var i = 0; i < result.ary.length; i++) {  
                  optionStr += "<option value=\"" + result.ary[i].id + "\" >"  
                          + result.ary[i].name + "</option>";
              }
              $("#itemid").html(optionStr);
          }  
      },  
      error : function(errorMsg) {  
          alert("数据请求失败，请联系系统管理员!");  
      }  
	}); 
	$("#itemid").combobox();
}
function selectMachine() {
	$('#fdlg').window({
		title : "任务编号",
		modal : true
	});
	$('#fdlg').window('open');
	weldingMachineDatagrid();
}


function weldingMachineDatagrid() {
	$("#dg").datagrid( {
//		fitColumns : true,
		height : $("#fdlg").height(),
		width : $("#fdlg").width(),
		idField : 'id',
		pageSize : 10,
		pageList : [ 10, 20, 30, 40, 50 ],
		url : "weldtask/getWeldTaskList",
		singleSelect : true,
		rownumbers : true,
		showPageList : false,
		columns : [ [ {
			field : 'ck',
			checkbox : true
		},{ 
			field : 'id',
			title : '序号',
			width : 30,
			halign : "center",
			align : "left",
			hidden:true
		}, {
			field : 'weldedJunctionno',
			title : '任务编号',
//			width : 90,
			halign : "center",
			align : "left"
		}, {
			field : 'serialNo',
			title : '任务描述',
//			width : 90,
			halign : "center",
			align : "left",
//			hidden:true
		}, {
			field : 'pipelineNo',
			title : '焊工工号',
//			width : 90,
			halign : "center",
			align : "left"
		},  {
			field : 'itemid',
			title : '项目id',
//			width : 90,
			halign : "center",
			align : "left",
			hidden:true
		}, {
			field : 'itemname',
			title : '所属项目',
//			width : 150,
			halign : "center",
			align : "left"
		}
		] ],
		toolbar : '#dlgSearch',
		pagination : true,
		fitColumns : true,
//		onLoadSuccess:function(data){
//	          $("a[id='edit']").linkbutton({text:'修改',plain:true,iconCls:'icon-edit'});
//	          $("a[id='remove']").linkbutton({text:'删除',plain:true,iconCls:'icon-remove'});
//	    }
	});
}
function saveWeldingMachine() {
	var row = $("#dg").datagrid('getSelected');
	if(row==null){
		$('#fdlg').dialog('close');
	}else{
		$("#taskNo").textbox('setValue', row.weldedJunctionno);
		$("#taskid").val(row.id);
		$("#oldno").val(row.weldedJunctionno);
		//$("#itemid").val(row.itemid);
		$('#fdlg').dialog('close');
		$("#dg").datagrid("clearSelections");   //每次退出表格时去掉表格的勾选
	}
}



