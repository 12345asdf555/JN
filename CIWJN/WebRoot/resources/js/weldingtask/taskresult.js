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
				var str = '<a id="confirm" class="easyui-linkbutton" href="javascript:confirm()"/>';
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
				str += '<a id="evaluation" class="easyui-linkbutton" href="javascript:evaluation()"/>';
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
			$("a[id='confirm']").linkbutton({text:'确认完成',plain:true});
	        $("a[id='edit']").linkbutton({text:'修改',plain:true,iconCls:'icon-update'});
	        $("a[id='remove']").linkbutton({text:'删除',plain:true,iconCls:'icon-delete'});
			$("a[id='evaluation']").linkbutton({text:'评价',plain:true,iconCls:'icon-newadd'});
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

function evaluation(){}

function confirm(){}

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

