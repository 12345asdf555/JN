$(function(){
	weldedJunctionDatagrid();
});

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
			title : '所属项目',
//			width : 150,
			halign : "center",
			align : "left"
		}, {
			field : 'dtoTime1',
			title : '开始时间',
//			width : 150,
			halign : "center",
			align : "left"
		},{
			field : 'dtoTime2',
			title : '结束时间',
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
		}, {
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
                color.class="rowColor";
                return color;
            }
        },
		onLoadSuccess: function(data){
	        $("a[id='edit']").linkbutton({text:'修改',plain:true,iconCls:'icon-update'});
	        $("a[id='remove']").linkbutton({text:'删除',plain:true,iconCls:'icon-delete'});
		}
	});
}

//打印
function printWeldedjunction(){
	CreateFormPage("datagrid",$("#weldTaskTable"));
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
			url : "import/importWeldTask",
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

