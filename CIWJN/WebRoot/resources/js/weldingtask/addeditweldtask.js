$(function(){
	InsframeworkCombobox();
	WelderCombobox();
	$('#dlg').dialog( {
		onClose : function() {
			$('#itemid').combobox('clear');
			$("#fm").form("disableValidation");
		}
	});
	$("#fm").form("disableValidation");
/*	$("#weldedJunctionno").textbox('textbox').blur(function(){
		var wjno = $("#weldedJunctionno").val();
		var len = wjno.length;
		if(len!=6){
			for(var i=0;i<6-len;i++){
				wjno = "0"+wjno;
			}
		}
		$("#weldedJunctionno").textbox('setValue',wjno);
	});*/
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
	$('#fm').form('clear');
	var row = $('#weldTaskTable').datagrid('getSelected');
	$.ajax({  
	      type : "post",  
	      async : false,
	      url : "weldedjunction/getCouneByTaskid?taskid="+row.id,  
	      data : {},  
	      dataType : "json", //返回数据形式为json  
	      success : function(result) {  
	          if (result==false) {
	        	  alert("任务已被执行或者已完成，无法进行操作！！");
	          }else{
	        		if (row) {
	        			$('#dlg').window( {
	        				title : "修改焊缝",
	        				modal : true
	        			});
	        			$('#dlg').window('open');
	        			$('#fm').form('load', row);
	        			$('#oldno').val(row.weldedJunctionno);
	        			url = "weldtask/editWeldTask?id="+ row.id;
	        		}
	          }
	      },  
	      error : function(errorMsg) {  
	          alert("数据请求失败，请联系系统管理员!");  
	      }  
	}); 
}

//提交
function save(){
	var dtoTime1 = $("#dtoTime1").datetimebox('getValue');
	var dtoTime2 = $("#dtoTime2").datetimebox('getValue');
	var fwelderid = $('#welderid').val();
	var fitemid = $('#itemid').combobox('getValue');
	var quali = $('#quali').combobox('getValue');
	var messager = "";
	var url2 = "";
	if(flag==1){
		messager = "新增成功！";
		url2 = url+"?fitemid="+fitemid+"&fwelderid="+fwelderid+"&dtoTime1="+dtoTime1+"&dtoTime2="+dtoTime2+"&quali="+quali;
	}else{
		messager = "修改成功！";
		url2 = url+"&fitemid="+fitemid+"&fwelderid="+fwelderid+"&dtoTime1="+dtoTime1+"&dtoTime2="+dtoTime2+"&quali="+quali;
	}
	$('#fm').form('submit', {
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

//焊工资质
function WelderCombobox(){
	$.ajax({  
    type : "post",  
    async : false,
    url : "Dictionary/getValueByTypeid",  
    data : {},  
    dataType : "json", //返回数据形式为json  
    success : function(result) {  
        if (result) {
            var optionStr = '';
            for (var i = 0; i < result.ary.length; i++) {  
                optionStr += "<option value=\"" + result.ary[i].value + "\" >"  
                        + result.ary[i].name + "</option>";
            }
            $("#quali").html(optionStr);
        }  
    },  
    error : function(errorMsg) {  
        alert("数据请求失败，请联系系统管理员!");  
    }  
	}); 
	$("#quali").combobox();
}


function selectWelder(){
	  $('#fdlg').window( {
		    modal : true
		  });
		  $('#fdlg').window('open');
		  WelderDatagrid();
}

var searchStr="";
function WelderDatagrid(){
	$("#welderTable").datagrid( {
		height : $("#fdlg").height(),
		width : $("#fdlg").width(),
		idField : 'id',
		pageSize : 10,
		pageList : [ 10, 20, 30, 40, 50 ],
		url : "welders/getAllWelder?searchStr="+encodeURI(searchStr),
		singleSelect : true,
		rownumbers : true,
		showPageList : false,
		pagination : true,
		fitColumns : true,
		columns : [ [ {
		      field : 'ck',
		      checkbox : true
		},{
			field : 'id',
			title : '序号',
			width : 100,
			halign : "center",
			align : "left",
			hidden:true
		}, {
			field : 'name',
			title : '姓名',
			width : 80,
			halign : "center",
			align : "left"
		}, {
			field : 'welderno',
			title : '编号',
			width : 100,
			halign : "center",
			align : "left"
		},{
			field : 'quali',
			title : '资质id',
			width : 100,
			halign : "center",
			align : "left",
			hidden:true
		}, {
			field : 'qualiname',
			title : '资质',
			width : 100,
			halign : "center",
			align : "left"
		},{
			field : 'owner',
			title : '部门id',
			width : 100,
			halign : "center",
			align : "left",
			hidden:true
		}, {
			field : 'ownername',
			title : '部门',
			width : 150,
			halign : "center",
			align : "left"
		},{
			field : 'back',
			title : '备注',
			width : 100,
			halign : "center",
			align : "left"
		}
		] ],
		rowStyler: function(index,row){
            if ((index % 2)!=0){
            	//处理行代背景色后无法选中
            	var color=new Object();
                color.class="rowColor";
                return color;
            }
        },
		nowrap : false
	});
}

function dlgSearchGather(){
	  if($("#searchname").val()){
		    searchStr =  "tb_welder.fwelder_no=" + $("#searchname").val();
		  }
		  WelderDatagrid();
		  searchStr = "";
}

function saveWelder(){
	  var row = $("#welderTable").datagrid('getSelected');
	  $("#pipelineNo").textbox('setValue',row.welderno);
	  $('#welderid').val(row.id);
	  $('#fdlg').dialog('close');
	  $('#welderTable').datagrid('clearSelections'); 
	}

function closeFdlog(){
	$('#fdlg').dialog('close');
}