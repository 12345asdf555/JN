$(function(){
  statusRadio();
	weldingnumbersDatagrid(1);
})
var url = "";
var flag = "";
function removeWeldedjunction(){
	flag=3;
	$('#rfm').form('clear');
	var row = $('#weldTaskTable').datagrid('getSelected');
	if(row.operateid==1){
		 alert("任务已完成，无法进行修改或删除！！！"); 
	}
	else{
	if (row) {
		$('#rdlg').window( {
			title : "取消任务",
			modal : true
		});
		$('#rdlg').window('open');
		$('#rfm').form('load', row);
		$("#oldno").val(row.taskNo);
		url = "weldtask/getEvaluate?id="+row.id+"&result="+""+"&taskid="+row.taskid+"&welderid="+row.welderid+"&machineid="+row.machineid;
	}
  }
}
function remove(){
	var temp;
	var url2;
	flag==3
    var rows = $("#weldTaskTable").datagrid("getSelections");
	if(flag==3){
		temp=3;
		url2=url+"&resultid="+""+"&welderNo="+rows[0].welderNo+"&operateid="+temp+"&taskNo="+rows[0].taskNo+"&machineNo="+rows[0].machineNo;
	}
	$('#rfm').form('submit', {
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
					$('#rdlg').dialog('close');
					$('#weldTaskTable').datagrid('reload');
				}
			}

		},
		error : function(errorMsg) {
			alert("数据请求失败，请联系系统管理员!");
		}
	});
}

function selectMachinenumber() {
	$('#ddlg').window({
		title : "焊机编号选择",
		modal : true
	});
	$('#ddlg').window('open');
	var radio=$('input[name="radios"]');
	radio.change(function(){
	     var  radios = $(this).val();
	      if(radios=='1'){
	          weldingnumbersDatagrid(1);
	      }else{
	          weldingnumbersDatagrid(0);
	          }
	  });
}
function weldingnumbersDatagrid(value) {
	$("#wg").datagrid( {
		height : $("#body").height(),
		width : $("#body").width(),
		idField : 'id',
		pageSize : 10,
		pageList : [ 10, 20, 30, 40, 50 ],
		url : "weldtask/getWedlingMachineList?searchStr="+value,
		singleSelect : true,
		rownumbers : true,
		showPageList : false, 
        columns : [ [  {
			field : 'ck',
			checkbox : true
		},{
			field : 'id',
			title : '序号',
			width : 50,
			halign : "center",
			align : "left",
			hidden:true
		}, {
			field : 'equipmentNo',
			title : '焊机编号',
//			width : 80,
			halign : "center",
			align : "left"
		}, {
			field : 'typeName',
			title : '设备类型',
//			width : 80,
			halign : "center",
			align : "left"
		},  {
			field : 'insframeworkName',
			title : '所属项目',
//			width : 80,
			halign : "center",
			align : "left"
		}, {
			field : 'statusName',
			title : '状态',
//			width : 80,
			halign : "center",
			align : "left"
		} , {
			field : 'isnetworking',
			title : '是否在网',
//			width : 80,
			halign : "center",
			align : "left"
		}, {
			field : 'model',
			title : '设备型号',
//			width : 100,
			halign : "center",
			align : "left"
		},  {
			field : 'iId',
			title : '项目id',
			width : 100,
			halign : "center",
			align : "left",
			hidden: true
		}
		] ],
		toolbar : '#dlgSearch',
		pagination : true,
		fitColumns : true
	});
}
function saveWeldingnumber() {
	var row = $("#wg").datagrid('getSelected');
	if(row==null){
		$('#ddlg').dialog('close');;
	}else{
		$("#machineNo").textbox('setValue', row.equipmentNo);
		//var result=document.getElementById("id").value;
		$("#machineid").val(row.id);
		$('#ddlg').dialog('close');
		$("#wg").datagrid("clearSelections");
	}
}
//焊机状态
function statusRadio(){
$.ajax({  
    type : "post",  
    async : false,
    url : "weldtask/getStatusAll",  
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
