$(function(){
	weldedJunctionDatagrid();
	itemcombobox();
	//dgDatagrid();
//	typeCombobox();
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
			field : 'resultName',
			title : '评价等级',
//			width : 90,
			halign : "center",
			align : "left"
		},{
			field : 'result',
			title : '任务评价',
//			width : 90,
			halign : "center",
			align : "left"
		}, {
			field : 'itemid',
			title : '班组id',
//			width : 90,
			halign : "center",
			align : "left",
			hidden : true
		},{
			field : 'itemname',
			title : '所属班组',
//			width : 90,
			halign : "center",
			align : "left"
		}, {
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
		},{
			field : 'getdatatime',
			title : '操作时间',
//			width : 100,
			halign : "center",
			align : "left"
        },{
			field : 'starttime',
			title : '开始时间',
//			width : 100,
			halign : "center",
			align : "left"
        },{
			field : 'endtime',
			title : '结束时间',
//			width : 100,
			halign : "center",
			align : "left"
        },{
			field : 'operatetype',
			title : '任务状态',
			width : 100,
			halign : "center",
			align : "left",
			formatter: function(value,row,index){
				var str;
				if(row.operateid==0||row.operateid==2){
					str = '<a id="confirm" href="javascript:confirm()" class="easyui-linkbutton" disabled=true >';
				}
				if(row.operateid==1){
					str = '<a id="confirm1" href="javascript:confirm()" class="easyui-linkbutton" disabled=true>';
				}
				return str;
			}
		},{
			field : 'edit',
			title : '编辑',
			width : 150,
			halign : "center",
			align : "left",
			formatter: function(value,row,index){
				var str = '<a id="edit" class="easyui-linkbutton" href="javascript:editWeldedjunction()"/>';
				str += '<a id="remove" class="easyui-linkbutton" href="javascript:removeWeldedjunction()"/>';
				//str += '<a id="evaluation" class="easyui-linkbutton" href="javascript:evaluation()"/>';
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
	        $("a[id='remove']").linkbutton({text:'取消',plain:true,iconCls:'icon-delete'});
	        if($("#confirm").length!=0){
				$("a[id='confirm']").linkbutton({text:'未完成',plain:true,iconCls:'icon-newcancel'});
			}
			if($("#confirm1").length!=0){
				$("a[id='confirm1']").linkbutton({text:'已完成',plain:true,iconCls:'icon-over'});
			}
		}
	});
}
//搜索
function serach(){
	$("#chartLoading").show();
	chartStr = "";
	setTimeout(function(){
		dgDatagrid();
	},500);
}
//组织机构
function itemcombobox(){
	$.ajax({  
      type : "post",  
      async : false,
      url : "weldingMachine/getInsframeworkAll",  
      data : {},  
      dataType : "json", //返回数据形式为json  
      success : function(result) {  
          if (result) {
              var optionStr = '<option value="0">请选择</option>';
              for (var i = 0; i < result.ary.length; i++) {  
                  optionStr += "<option value=\"" + result.ary[i].id + "\" >"  
                          + result.ary[i].name + "</option>";
              }
              $("#item").html(optionStr);
          }  
      },  
      error : function(errorMsg) {  
          alert("数据请求失败，请联系系统管理员!");  
      }  
	}); 
	$("#item").combobox();
	$("#item").combobox('select',0);
}

function confim(){}
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


//var flag;
function confirm(){
	var url2="";
	$.messager.confirm('提示', '此操作不可撤销，是否确认?', function(flag) {
		if(flag){
		    	$('#fm').form('submit', {
		    		url : url2,
		    		onSubmit : function() {
		    			return $(this).form('enableValidation').form('validate');
		    		},
		    		success : function(result) {
		    			if(result){
		    				var result = eval('(' + result + ')');
		    				if (!result.success) {
		    					document.getElementById("load").style.display ='none';
		    		    		document.getElementById("show").style.display ='none';
		    					$.messager.show( {
		    						title : 'Error',
		    						msg : result.errorMsg
		    					});
		    				}else{
		    					document.getElementById("load").style.display ='none';
		    		    		document.getElementById("show").style.display ='none';
		    					$.messager.alert("提示", messager);
		    					//$('#dlg').dialog('close');
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

function serach(){
	var searchStr = "";
	var parent = "";
	var itemid = $("#item").combobox("getValue");
	var status = $("#status").combobox("getValue");
	if(itemid!=0){
		parent = "i.fid = "+itemid;
	}
	if(status==1){
		searchStr = " foperatetype=1";
	}else if(status==0){
		searchStr = " foperatetype=0 or foperatetype=2";
	}
	$("#weldTaskTable").datagrid('reload',{
		"searchStr" : searchStr,
		"parent" : parent
	})
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

