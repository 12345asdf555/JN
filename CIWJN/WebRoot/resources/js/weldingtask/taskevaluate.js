$(function(){
	weldedJunctionDatagrid();
	typeCombobox();
});

function weldedJunctionDatagrid(){
	$("#weldTaskTable").datagrid( {
//		fitColumns : true,
		height : $("#body").height(),
		width : $("#body").width(),
		idField : 'id',
		pageSize : 10,
		pageList : [ 10, 20, 30, 40, 50 ],
		url : "weldtask/getTaskResultList",
		singleSelect : true,
		rownumbers : true,
		showPageList : false,
		columns : [ [ {
			field : 'id',
			title : '序号',
			width : 30,
			halign : "center",
			align : "left",
			hidden:true
		}, {
			field : 'taskNo',
			title : '任务编号',
//			width : 90,
			halign : "center",
			align : "left"
		},{
			field : 'welderNo',
			title : '焊工编号',
//			width : 90,
			halign : "center",
			align : "left"
		}, {
			field : 'machineNo',
			title : '焊机编号',
//			width : 90,
			halign : "center",
			align : "left",
//			hidden:true
		}, {
			field : 'taskid',
			title : '任务ID',
//			width : 90,
			halign : "center",
			align : "left",
			hidden:true
		}, {
			field : 'welderid',
			title : '焊工id',
//			width : 90,
			halign : "center",
			align : "left",
			hidden:true
		}, {
			field : 'machineid',
			title : '焊机id',
//			width : 90,
			halign : "center",
			align : "left",
			hidden:true
		}, {
			field : 'statusid',
			title : '状态id',
			width : 100,
			halign : "center",
			align : "left",
			hidden: true
		},{
			field : 'result',
			title : '任务评价',
//			width : 90,
			halign : "center",
			align : "left"
		}, {
			field : 'resultName',
			title : '评价等级',
//			width : 90,
			halign : "center",
			align : "left"
		},{
			field : 'resultid',
			title : '评价id',
//			width : 90,
			halign : "center",
			align : "left",
			hidden:true
		},{
			field : 'operateid',
			title : '状态id',
//			width : 90,
			halign : "center",
			align : "left",
			hidden:true
		}, {
			field : 'operatetype',
			title : '任务状态',
//			width : 90,
			halign : "center",
			align : "left",
			formatter: function(value,row,index){
				var str;
				if(row.operateid==0||row.operateid==2){
					str = '<a id="confirm" href="javascript:confirm()" class="easyui-linkbutton">';
				}
				if(row.operateid==1){
					str = '<a id="confirm1" href="javascript:confirm()" class="easyui-linkbutton" disabled=true>';
				}
				return str;
			}
		},{
			field : 'edit',
			title : '编辑',
			width : 220,
			halign : "center",
			align : "left",
			formatter: function(value,row,index){
				var 
//				var str = '<a id="edit" class="easyui-linkbutton" href="javascript:editWeldedjunction()"/>';
//				str += '<a id="remove" class="easyui-linkbutton" href="javascript:removeWeldedjunction()"/>';
				 str = '<a id="evaluation" class="easyui-linkbutton" href="javascript:evaluation()"/>';
				return str;
			}
		}] ],
		pagination : true,
		rowStyler: function(index,row){
            if ((index % 2)!=0){
            	//处理行代背景色后无法选中
            	var color=new Object();
                color.class="rowColor";
                return color;
            }
        },
		onLoadSuccess: function(data){
			$("a[id='evaluation']").linkbutton({text:'评价',plain:true,iconCls:'icon-newadd'});
			if($("#confirm").length!=0){
				$("a[id='confirm']").linkbutton({text:'确认完成',plain:true,iconCls:'icon-update'});
			}
			if($("#confirm1").length!=0){
				$("a[id='confirm1']").linkbutton({text:'已完成',plain:true,iconCls:'icon-update'});
			}
		}
	});
}


//导入
function importclick(){
	$("#importdiv").dialog("open").dialog("setTitle","从excel导入数据");
}

function importWeldingMachine(){
	var file = $("#file").val();
	if(file == null || file == ""){
		$.messager.alert("提示", "请选择要上传的文件！");
		return false;
	}else{
		$('#importfm').form('submit', {
			url : "import/importWeldedJunction",
			success : function(result) {
				if(result){
					var result = eval('(' + result + ')');
					if (!result.success) {
						$.messager.show( {
							title : 'Error',
							msg : result.msg
						});
					} else {
						$('#importdiv').dialog('close');
						$('#weldTaskTable').datagrid('reload');
						$.messager.alert("提示", result.msg);
					}
				}
				
			},  
		    error : function(errorMsg) {  
		        alert("数据请求失败，请联系系统管理员!");  
		    } 
		});
	}
}

var url = "";
var flag = 1;
function evaluation(){
	flag = 1;
	var row = $('#weldTaskTable').datagrid('getSelected');
	if(row.operateid==0){
		 alert("任务未完成，无法进行评价"); 
	}
	else{
	if (row) {
		$('#mdlg').window( {
			title : "工作评价",
			modal : true
		});
		$('#mdlg').window('open');
		$('#fm').form('load', row);
		if(row.resultid==0||row.resultid==""||row.resultid==null){
			var data = $('#resultid').combobox('getData');
			$('#resultid').combobox('select',data[0].value);
		}
		//$('#resultid').combobox('select', row.resultName);
		url = "weldtask/getEvaluate?id="+row.id+"&taskid="+row.taskid+"&welderid="+row.welderid+"&machineid="+row.machineid;
	}
}
}
//评价的保存
function saveconment(){
	var temp;
	var url2;
	//var resultname=resultName.options[this.selectedIndex];
	var resultName = $('#resultid').combobox('getValue');
/*	alert(resultName.value);*/
	var result=document.getElementById("result").value;
	//alert(result.length);
    var rows = $("#weldTaskTable").datagrid("getSelections");
	if(flag==1){
		temp=1;
		url2=url+"&result="+result+"&resultid="+resultName+"&welderNo="+rows[0].welderNo+"&operateid="+temp+"&taskNo="+rows[0].taskNo+"&machineNo="+rows[0].machineNo;
	}
	else if(flag==2){
		temp=2;
		url2=url+"&resultName="+row.desc+"&operatetype="+temp+"&result="+row.resultied;
	}
	else if(flag==3){
		temp=3;
		url2=url+"&resultName="+row.desc+"&operatetype="+temp+"&result="+row.resultied;
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
					$('#mdlg').dialog('close');
					$('#weldTaskTable').datagrid('reload');
				}
			}

		},
		error : function(errorMsg) {
			alert("数据请求失败，请联系系统管理员!");
		}
	});
}
//设备类型
function typeCombobox(){
	$.ajax({  
      type : "post",  
      async : false,
      url : "weldtask/getStatusAll",  
      data : {},  
      dataType : "json", //返回数据形式为json  
      success : function(result) {
          if (result) {
              var optionStr = '';  
              for (var i = 0; i < result.ary.length; i++) { 
                  optionStr += "<option value=\"" + result.ary[i].id + "\" >"  
                          + result.ary[i].name + "</option>";  
              } 
              $("#resultid").append(optionStr);
          }  
      },  
      error : function(errorMsg) {  
          alert("数据请求失败，请联系系统管理员!");  
      }  
 }); 
	$("#resultid").combobox();
}

function confirm(){
	var url2="";
	var temp=1;
	$.messager.confirm('提示', '此操作不可撤销，是否确认?', function(flag) {
		if(flag){
			var row = $('#weldTaskTable').datagrid('getSelected');
			url = "weldtask/getEvaluate?id="+row.id+"&taskid="+row.taskid+"&welderid="+row.welderid+"&machineid="+row.machineid;
			url2=url+"&result="+""+"&resultid="+""+"&welderNo="+row.welderNo+"&operateid="+temp+"&taskNo="+row.taskNo+"&machineNo="+row.machineNo;
			$.ajax({  
			      type : "post",  
			      async : false,
			      url : url2,  
			      data : {},  
			      dataType : "json", //返回数据形式为json  
			      success : function(result) {
			          if (result) {
							var result = eval(result);
							if (!result.success) {
								$.messager.show( {
									title : 'Error',
									msg : result.msg
								});
							} else {
								$('#weldTaskTable').datagrid('reload');
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

//监听窗口大小变化
window.onresize = function() {
	setTimeout(domresize, 500);
}

//改变表格高宽
function domresize() {
	$("#weldTaskTable").datagrid('resize', {
		height : $("#body").height(),
		width : $("#body").width()
	});
}

