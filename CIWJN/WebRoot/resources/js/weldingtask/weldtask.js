$(function(){
	weldedJunctionDatagrid();
	dayinDatagrid();
	exporttable();
	statusChange();
});

function statusChange(){
	$("#status").combobox({
		onChange : function(newValue,oldValue){
			var searchStr = "";
			if(newValue==1){
				searchStr = " foperatetype=1";
			}else if(newValue==0){
				searchStr = " foperatetype=0 or foperatetype=2";
			}else if(newValue==3){
				searchStr = " foperatetype is null"
			}
			$("#weldTaskTable").datagrid('reload',{
				"searchStr" : searchStr
			})
		}
	})
	
}

function weldedJunctionDatagrid(){
	$("#weldTaskTable").datagrid( {
//		fitColumns : true,
		height : $("#body").height(),
		width : $("#body").width(),
		idField : 'id',
		pageSize : 10,
		pageList : [ 10, 20, 30, 40, 50 ],
		url : "weldtask/getWeldTaskList",
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
			field : 'weldedJunctionno',
			title : '任务编号',
//			width : 90,
			halign : "center",
			align : "left"
		}, /*{
			field : 'serialNo',
			title : '任务描述',
//			width : 90,
			halign : "center",
			align : "left"
		}, */{
			field : 'levelname',
			title : '任务等级',
//			width : 150,
			halign : "center",
			align : "left"
		}, {
			field : 'pipelineNo',
			title : '焊工工号',
//			width : 90,
			halign : "center",
			align : "left"
		}, {
			field : 'roomNo',
			title : '焊工资质',
//			width : 90,
			halign : "center",
			align : "left"
		}, {
			field : 'welderid',
			title : '焊工id',
//			width : 90,
			halign : "center",
			align : "left",
			hidden:true
		},{
			field : 'quali',
			title : '资质id',
//			width : 90,
			halign : "center",
			align : "left",
			hidden:true
		},{
			field : 'itemid',
			title : '项目id',
//			width : 90,
			halign : "center",
			align : "left",
			hidden:true
		}, {
			field : 'itemname',
			title : '所属班组',
//			width : 150,
			halign : "center",
			align : "left"
		}, {
			field : 'levelid',
			title : '任务等级id',
//			width : 150,
			halign : "center",
			align : "left",
			hidden:true
		},{
			field : 'dtoTime1',
			title : '计划开始时间',
//			width : 150,
			halign : "center",
			align : "left"
		},{
			field : 'dtoTime2',
			title : '计划结束时间',
//			width : 150,
			halign : "center",
			align : "left"
		},{
			field : 'dyne',
			title : '焊工id',
			width : 90,
			halign : "center",
			align : "left",
			hidden:true
		},{
			field : 'status',
			title : '状态值',
			width : 90,
			halign : "center",
			align : "left",
			hidden:true
		},{
			field : 'operatetype',
			title : '任务状态',
			width : 90,
			halign : "center",
			align : "left",
			formatter: function(value,row,index){
				var str = "";
				if(row.status==0||row.status==2){
					str = '<a id="confirm" class="easyui-linkbutton" href="javascript:confirm()" disabled="true"/>';
				}
				if(row.status==1){
					str = '<a id="confirm1" class="easyui-linkbutton" href="javascript:confirm()" disabled="true"/>';
				}
				if(row.status==2){
					str = '<a id="confirm2" class="easyui-linkbutton" href="javascript:confirm()" disabled="true"/>';
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
				var str = '<a id="edit" class="easyui-linkbutton" href="javascript:editWeldedjunction()"/>';
				str += '<a id="remove" class="easyui-linkbutton" href="javascript:removeWeldedjunction()"/>';
				return str;
			}
		}] ],
		pagination : true,
		rowStyler: function(index,row){
            if ((index % 2)!=0){
            	//处理行代背景色后无法选中
            	var color=new Object();
                return color;
            }
        },
		onLoadSuccess: function(data){
	        $("a[id='edit']").linkbutton({text:'修改',plain:true,iconCls:'icon-update'});
	        $("a[id='remove']").linkbutton({text:'删除',plain:true,iconCls:'icon-delete'});
	        if($("#confirm").length!=0){
				$("a[id='confirm']").linkbutton({text:'进行中',plain:true,iconCls:'icon-unfinished'});
			}
			if($("#confirm1").length!=0){
				$("a[id='confirm1']").linkbutton({text:'已完成',plain:true,iconCls:'icon-finish'});
			}
			if($("#confirm2").length!=0){
				$("a[id='confirm2']").linkbutton({text:'未领取',plain:true,iconCls:'icon-assign'});
			}
		}
	});
}

function dayinDatagrid(){
	$("#dayintable").datagrid( {
//		fitColumns : true,
		height : $("#dayin").height(),
		width : $("#dayin").width(),
		idField : 'id',
		pageSize : 10,
		pageList : [ 10, 20, 30, 40, 50 ],
		url : "weldtask/getWeldTaskList",
		singleSelect : true,
		rownumbers : true,
		showPageList : false,
		columns : [ [ {
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
			align : "left"
//			hidden:true
		}, {
			field : 'pipelineNo',
			title : '焊工工号',
//			width : 90,
			halign : "center",
			align : "left"
		}, {
			field : 'roomNo',
			title : '焊工资质',
//			width : 90,
			halign : "center",
			align : "left"
		}, {
			field : 'itemname',
			title : '所属班组',
//			width : 150,
			halign : "center",
			align : "left"
		}, {
			field : 'dtoTime1',
			title : '计划开始时间',
//			width : 150,
			halign : "center",
			align : "left"
		},{
			field : 'dtoTime2',
			title : '计划结束时间',
//			width : 150,
			halign : "center",
			align : "left"
		}] ],
		pagination : true
	});
}

function exporttable(){
	$("#exporttable").datagrid( {
//		fitColumns : true,
		height : $("#exportdlg").height(),
		width : $("#exportdlg").width(),
		idField : 'id',
//		pageSize : 10,
//		pageList : [ 10, 20, 30, 40, 50 ],
		url : "import/",
		singleSelect : true,
		rownumbers : true,
		showPageList : false,
		columns : [ [ {
			field : 'taskNo',
			title : '任务编号',
//			width : 90,
			halign : "center",
			align : "left"
		}, {
			field : 'levelname',
			title : '任务等级',
//			width : 90,
			halign : "center",
			align : "left"
//			hidden:true
		},{
			field : 'levelid',
			title : '任务等级id',
//			width : 90,
			halign : "center",
			align : "left",
			hidden:true
		}, {
			field : 'welderNo',
			title : '焊工工号',
//			width : 90,
			halign : "center",
			align : "left"
		}, {
			field : 'quali',
			title : '焊工资质',
//			width : 90,
			halign : "center",
			align : "left"
		}, {
			field : 'welderId',
			title : '焊工id',
//			width : 90,
			halign : "center",
			align : "left",
			hidden:true
		},{
			field : 'qualiid',
			title : '资质id',
//			width : 90,
			halign : "center",
			align : "left",
			hidden:true
		},{
			field : 'insId',
			title : '项目id',
//			width : 90,
			halign : "center",
			align : "left",
			hidden:true
		}, {
			field : 'insName',
			title : '所属班组',
//			width : 150,
			halign : "center",
			align : "left"
		}, {
			field : 'start',
			title : '计划开始时间',
//			width : 150,
			halign : "center",
			align : "left"
		},{
			field : 'end',
			title : '计划结束时间',
//			width : 150,
			halign : "center",
			align : "left"
		},{
			field : 'str',
			title : '错误描述',
//			width : 150,
			halign : "center",
			align : "left"
		}] ]
	});
}

function openDayin(){
	$('#dayin').dialog('open');
}

//打印
function printWeldedjunction(){
	CreateFormPage("datagrid",$("#dayintable"),"任务列表");
	$('#dayin').dialog('close');
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
		document.getElementById("load").style.display="block";
		var sh = '<div id="show" style="align="center""><img src="resources/images/load.gif"/>正在加载，请稍等...</div>';
		$("#body").append(sh);
		document.getElementById("show").style.display="block";
		$('#importfm').form('submit', {
			url : "import/importWeldTask",
			success : function(result) {
				if(result){
					var result = eval('(' + result + ')');
					if (result) {
			    		document.getElementById("load").style.display ='none';
			    		document.getElementById("show").style.display ='none';
						$('#importdiv').dialog('close');
						$("#exporttable").datagrid("loadData", result.rows);
						$('#exportdlg').window( {
							title : "任务确认与导入",
							modal : true
						});
						if(result.biaozhi==1){
							$('#imexcel').linkbutton('disable');
						}else{
							$('#imexcel').linkbutton('enable');
						}
						$('#exportdlg').window('open');
					}
				}
				
			},  
		    error : function(errorMsg) {  
		        alert("数据请求失败，请联系系统管理员!");  
		    } 
		});
		
	}
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

