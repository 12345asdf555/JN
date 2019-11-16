/**
 * 
 */
var oldchanel = 0;
$(function() {
	//	rule();
	groove();
	baseMaterial();
	getWeldmethod();
	wpslibCombobox();
	getWeldway();
	getWeldprocess();
	getWeldposition();
	welderCombobox();
	getGas();
	getClassificationSociety();
	getWeldMaterial();
	getWeldmanufacture();
	statusRadio();
	fmucai();
	machineModel();
	getDictionary(10,"sxfselect");
	getDictionary(24,"sxfgas");
	getDictionary(23,"sxfdiameter");
	getDictionary(18,"sxfmaterial");
	getDictionary(19,"sxfcontroller");
	getDictionary(20,"sxfinitial");
	getDictionary(21,"sxfarc");
	
	$('#editSxDlg').dialog( {
		onClose : function() {
			$('#sxfwpsnum').combobox('clear');
			$('#sxfselect').combobox('clear');
			$('#sxfgas').combobox('clear');
			$('#sxfdiameter').combobox('clear');
			$('#sxfmaterial').combobox('clear');
			$('#sxfinitial').combobox('clear');
			$('#sxfcontroller').combobox('clear');
			$("#sxfm").form("disableValidation");
		}
	})
	$('#smwdlg').dialog({
		onClose : function() {
			$('#mainWpsTable').datagrid('clearSelections');
		}
	})
	$('#smdlg').dialog({
		onClose : function() {
			$('#weldingmachineTable').datagrid('clearSelections');
		}
	})
	$('#sxSelectdlg').dialog( {
		onClose : function() {
			$('#sxSelectWpsTab').datagrid('clearSelections');
		}
	})
	$('#sxMachinedlg').dialog( {
		onClose : function() {
			$('#sxMachineTable').datagrid('clearSelections');
		}
	})
	$('#wltdlg').dialog({
		onClose : function() {
			$("#wltfm").form("disableValidation");
		}
	})
	$("#wltfm").form("disableValidation");
	$("#sxfm").form("disableValidation");
})

var url = "";
var flag = 1;
function addWpslib() {			//pqr
	flag = 1;
	$('#wltfm').form('clear');
	$('#wltdlg').window({
		title : "新增PQR",
		modal : true
	});
	$('#wltdlg').window('center');
	$('#wltdlg').window('open');
	url = "wps/addpqrWps";
}

function editWpslib() {		//pqr
	flag = 2;
	$('#wltfm').form('clear');
	var row = $('#wpslibTable').datagrid('getSelected');
	if (row) {
		$('#wltdlg').window({
			title : "修改PQR",
			modal : true
		});
		$('#wltdlg').window('open');
		$('#wltfm').form('load', row);
		url = "wps/updatepqrWps?fid=" + row.fid+"&fweld_material_id="+row.fweld_material_id+"&fwelder_id="+row.fwelder_id+"&fmanufacturer_id=" + row.fmanufacturer_id+"&fbase_material_id=" + row.fbase_material_id+"&fweld_method=" + row.fweld_method+"&fweld_position=" + row.fweld_position;
	}
}

function saveWpslib() {			//pqr
	//var fstatus = $("input[name='statusId']:checked").val();
	var fmanufacturer_id = $("#fmanufacturer_id").combobox("getValue");
	var fbase_material_id = $("#fbase_material_id").combogrid("getValue");
	var sfweld_method = $("#sfweld_method").combobox("getValue");
	var fweld_position = $("#fweld_position").combobox("getValue");
	var fweld_material_id = $("#fweld_material_id").combobox("getValue");
	var fwelder_id = $("#fwelder_id").combobox("getValue");
	var fgroove_id = $("#fgroove_id").combogrid("getValue");
	var messager = "";
	var url2 = "";
	if (flag == 1) {
		//var machineModel = $('#model').combobox('getValue');
		messager = "新增成功！";
		url2 = url+"?fmanufacturer_id=" + fmanufacturer_id+"&fbase_material_id=" + fbase_material_id+"&sfweld_method=" + sfweld_method+"&fweld_position=" + fweld_position+"&fweld_material_id=" + fweld_material_id+"&fwelder_id=" + fwelder_id+"&fgroove_id=" + fgroove_id;
	} else {
		messager = "修改成功！";
		url2 = url;
	}
	$('#wltfm').form('submit', {
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
function statusRadio() {
	$.ajax({
		type : "post",
		async : false,
		url : "wps/getStatusAll",
		data : {},
		dataType : "json", //返回数据形式为json  
		success : function(result) {
			if (result) {
				var str = "",sstr = "";
				for (var i = 0; i < result.ary.length; i++) {
					str += "<input type='radio' class='radioStyle' name='statusId' id='sId' value=\"" + result.ary[i].id + "\" />"
					+ result.ary[i].name;
					sstr += "<input type='radio' class='radioStyle' name='sstatusId' id='ssId' value=\"" + result.ary[i].id + "\" />"
					+ result.ary[i].name;
				}
				$("#radios").html(str);
				$("input[name='statusId']").eq(0).attr("checked", true);
				$("#sradios").html(str);
				$("input[name='sstatusId']").eq(0).attr("checked", true);
			}
		},
		error : function(errorMsg) {
			alert("数据请求失败，请联系系统管理员!");
		}
	});
}

var mflag = 1;
function addMainWps() {
	mflag = 1;
	$('#mwfm').form('clear');
	$('#mwdlg').window({
		title : "新增工艺",
		modal : true
	});
	var wlrow = $('#wpslibTable').datagrid('getSelected');
	url = "wps/addMainPqr?fqpr_id=" + wlrow.fid;
	$('#mwdlg').window('open');
}

function editMainWps(indexrow,row) {
	mflag = 2;
	$('#mwfm').form('clear');
	$('#mwdlg').window({
		title : "修改工艺",
		modal : true
	});
	$('#mwdlg').window('open');
	$('#mwfm').form('load', indexrow);
	url = "wps/updateMainPqr?fid=" + indexrow.fid;
}

function saveMainWps() {
	var wpsLibRow = $('#wpslibTable').datagrid('getSelected');
	var index = $('#wpslibTable').datagrid('getRowIndex',wpsLibRow);
	var messager = "";
	if (mflag == 1) {
		messager = "新增成功！";
	} else {
		messager = "修改成功！";
	}
	var url2 = "";
	url2 = url;
	$('#mwfm').form('submit', {
		url : url2,
		onSubmit : function() {
			return $(this).form('enableValidation').form('validate');
		},
		success : function(result) {
			if(result){
				var result = eval('(' + result + ')');
				if (!result.success) {
					$.messager.show({
						title : 'Error',
						msg : result.errorMsg
					});
					oldchanel = 0;
				} else {
					$.messager.alert("提示", messager);
					$('#mwdlg').dialog('close');
					$('#ddv-'+index).datagrid('reload');
					oldchanel = 0;
				}
			}
			
		},  
	    error : function(errorMsg) {  
	        alert("数据请求失败，请联系系统管理员!");  
	    } 
	});
}

//工艺选择选择下拉框
function wpslibCombobox(){
	$.ajax({  
type : "post",  
async : false,
url : "weldtask/getPwpslibAll",  
data : {},  
dataType : "json", //返回数据形式为json  
success : function(result) {
    if (result) {
        var optionStr = '';  
        for (var i = 0; i < result.ary.length; i++) { 
            optionStr += "<option value=\"" + result.ary[i].id + "\" >"  
                    + result.ary[i].name + "</option>";  
        } 
        $("#fpqr_id").append(optionStr);
    }  
},  
error : function(errorMsg) {  
    alert("数据请求失败，请联系系统管理员!");  
}  
}); 
	$("#fpqr_id").combobox();
}

function rule() {
	$("#farc").combobox({
		onSelect : function(record) {
			if (record.value == 111) {
				$('#farc_ele').numberbox("disable", true);
				$('#farc_vol').numberbox("disable", true);
				$('#farc_tuny_ele').numberbox("disable", true);
				$('#farc_tuny_vol').numberbox("disable", true);
				$('#farc_tuny_vol1').numberbox("disable", true);
				$('#farc_vol1').numberbox("disable", true);
				$('#ftime').numberbox("disable", true);
				$('#fini_ele').numberbox("disable", true);
				$('#fini_vol').numberbox("disable", true);
				$('#fini_vol1').numberbox("disable", true);
			} else if (record.value == 112) {
				$('#farc_ele').numberbox("enable", true);
				$('#farc_vol').numberbox("enable", true);
				$('#farc_tuny_ele').numberbox("enable", true);
				$('#farc_tuny_vol').numberbox("enable", true);
				$('#farc_tuny_vol1').numberbox("enable", true);
				$('#farc_vol1').numberbox("enable", true);
				$('#ftime').numberbox("disable", true);
				if ($("#finitial").is(":checked")) {
					$('#fini_ele').numberbox("enable", true);
					$('#fini_vol').numberbox("enable", true);
					$('#fini_vol1').numberbox("enable", true);
				} else {
					$('#fini_ele').numberbox("disable", true);
					$('#fini_vol').numberbox("disable", true);
					$('#fini_vol1').numberbox("disable", true);
				}
			} else if (record.value == 113) {
				$('#farc_ele').numberbox("enable", true);
				$('#farc_vol').numberbox("enable", true);
				$('#farc_tuny_ele').numberbox("enable", true);
				$('#farc_tuny_vol').numberbox("enable", true);
				$('#farc_tuny_vol1').numberbox("enable", true);
				$('#farc_vol1').numberbox("enable", true);
				$('#ftime').numberbox("disable", true);
				if ($("#finitial").is(":checked")) {
					$('#fini_ele').numberbox("enable", true);
					$('#fini_vol').numberbox("enable", true);
					$('#fini_vol1').numberbox("enable", true);
				} else {
					$('#fini_ele').numberbox("disable", true);
					$('#fini_vol').numberbox("disable", true);
					$('#fini_vol1').numberbox("disable", true);
				}
			} else {
				$('#farc_ele').numberbox("disable", true);
				$('#farc_vol').numberbox("disable", true);
				$('#farc_tuny_ele').numberbox("disable", true);
				$('#farc_tuny_vol').numberbox("disable", true);
				$('#farc_tuny_vol1').numberbox("disable", true);
				$('#farc_vol1').numberbox("disable", true);
				$('#fini_ele').numberbox("disable", true);
				$('#fini_vol').numberbox("disable", true);
				$('#fini_vol1').numberbox("disable", true);
				$('#ftime').numberbox("enable", true);
				$('#ftime').numberbox("enable", true);
			}
		}
	});

	$("#finitial").click(function() {
		if ($("#finitial").is(":checked")) {
			if ($('#farc').combobox('getValue') == 112 || $('#farc').combobox('getValue') == 113) {
				$('#fini_ele').numberbox("enable", true);
				$('#fini_vol').numberbox("enable", true);
				$('#fini_vol1').numberbox("enable", true);
			} else {
				$('#fini_ele').numberbox("disable", true);
				$('#fini_vol').numberbox("disable", true);
				$('#fini_vol1').numberbox("disable", true);
			}
		} else {
			$('#fini_ele').numberbox("disable", true);
			$('#fini_vol').numberbox("disable", true);
			$('#fini_vol1').numberbox("disable", true);
		}
	});

	$("#fmaterial").combobox({
		onSelect : function(record) {
			if (record.value == 91) {
				$('#fgas').combobox('clear');
				$('#fgas').combobox('loadData', [ {
					"text" : "CO2",
					"value" : "121"
				}, {
					"text" : "MAG",
					"value" : "122"
				} ]);
				$('#fdiameter').combobox('clear');
				$('#fdiameter').combobox('loadData', [ {
					"text" : "Φ1.0",
					"value" : "131"
				}, {
					"text" : "Φ1.2",
					"value" : "132"
				}, {
					"text" : "Φ1.4",
					"value" : "133"
				}, {
					"text" : "Φ1.6",
					"value" : "134"
				} ]);
			} else if (record.value == 92) {
				$('#fgas').combobox('clear');
				$('#fgas').combobox('loadData', [ {
					"text" : "MIG",
					"value" : "123"
				} ]);
				$('#fdiameter').combobox('clear');
				$('#fdiameter').combobox('loadData', [ {
					"text" : "Φ1.2",
					"value" : "132"
				}, {
					"text" : "Φ1.6",
					"value" : "134"
				} ]);
			} else if (record.value == 93) {
				$('#fgas').combobox('clear');
				$('#fgas').combobox('loadData', [ {
					"text" : "CO2",
					"value" : "121"
				} ]);
				$('#fdiameter').combobox('clear');
				$('#fdiameter').combobox('loadData', [ {
					"text" : "Φ1.2",
					"value" : "132"
				}, {
					"text" : "Φ1.4",
					"value" : "133"
				}, {
					"text" : "Φ1.6",
					"value" : "134"
				} ]);
			} else {
				$('#fgas').combobox('clear');
				$('#fgas').combobox('loadData', [ {
					"text" : "CO2",
					"value" : "121"
				} ]);
				$('#fdiameter').combobox('clear');
				$('#fdiameter').combobox('loadData', [ {
					"text" : "Φ1.2",
					"value" : "132"
				}, {
					"text" : "Φ1.6",
					"value" : "134"
				} ]);
			}
			var fgas = $('#fgas').combobox('getData');
			var fdiameter = $('#fdiameter').combobox('getData');
			$('#fgas').combobox('select', fgas[0].value);
			$('#fdiameter').combobox('select', fdiameter[0].value);
		}
	});
}

function machineModel() {
	$.ajax({
		type : "post",
		async : false,
		url : "Dictionary/getValueByTypeid?type=" + 17,
		data : {},
		dataType : "json", //返回数据形式为json  
		success : function(result) {
			if (result) {
				if (result.ary.length != 0) {
					var boptionStr = '';
					for (var i = 0; i < result.ary.length; i++) {
						boptionStr += "<option value=\"" + result.ary[i].value + "\" >"
							+ result.ary[i].name + "</option>";
					}
					$("#model").html(boptionStr);
					$("#model").combobox();
//					$("#model").combobox('select', result.ary[0].value);
					$("#smodel").html(boptionStr);
					$("#smodel").combobox();
				}
			}
		},
		error : function(errorMsg) {
			alert("数据请求失败，请联系系统管理员!");
		}
	});
}

function getWeldmethod() {
	$.ajax({
		type : "post",
		async : false,
		url : "Dictionary/getValueByTypeid?type=" + 25,
		data : {},
		dataType : "json", //返回数据形式为json  
		success : function(result) {
			if (result) {
				if (result.ary.length != 0) {
					var boptionStr = '';
					for (var i = 0; i < result.ary.length; i++) {
						boptionStr += "<option value=\"" + result.ary[i].value + "\" >"
							+ result.ary[i].name + "</option>";
					}
					$("#fweld_method").html(boptionStr);
					$("#fweld_method").combobox();
//					$("#fweld_method").combobox('select', result.ary[0].value);
					$("#sfweld_method").html(boptionStr);
					$("#sfweld_method").combobox();
				}
			}
		},
		error : function(errorMsg) {
			alert("数据请求失败，请联系系统管理员!");
		}
	});
}

function getWeldway() {
	$.ajax({
		type : "post",
		async : false,
		url : "Dictionary/getValueByTypeid?type=" + 26,
		data : {},
		dataType : "json", //返回数据形式为json  
		success : function(result) {
			if (result) {
				if (result.ary.length != 0) {
					var boptionStr = '';
					for (var i = 0; i < result.ary.length; i++) {
						boptionStr += "<option value=\"" + result.ary[i].value + "\" >"
							+ result.ary[i].name + "</option>";
					}
					$("#fweld_way").html(boptionStr);
					$("#fweld_way").combobox();
//					$("#fweld_way").combobox('select', result.ary[0].value);
					$("#sfweld_way").html(boptionStr);
					$("#sfweld_way").combobox();
				}
			}
		},
		error : function(errorMsg) {
			alert("数据请求失败，请联系系统管理员!");
		}
	});
}
//焊工选择下拉框
function welderCombobox(){
		$.ajax({  
		type : "post",  
		async : false,
		url : "weldtask/getWelderAll",  
		data : {},  
		dataType : "json", //返回数据形式为json  
		success : function(result) {
		    if (result) {
		        var optionStr = '';  
		        for (var i = 0; i < result.ary.length; i++) { 
		            optionStr += "<option value=\"" + result.ary[i].id + "\" >"  
		                    + result.ary[i].name + "</option>";  
		        } 
		        $("#fwelder_id").append(optionStr);
		        $("#fwelder_id").combobox();
		        $("#sfwelder_id").append(optionStr);
		        $("#sfwelder_id").combobox();
		    }  
		},  
		error : function(errorMsg) {  
		    alert("数据请求失败，请联系系统管理员!");  
		}  
		}); 
}

function getWeldprocess() {
	$.ajax({
		type : "post",
		async : false,
		url : "Dictionary/getValueByTypeid?type=" + 27,
		data : {},
		dataType : "json", //返回数据形式为json  
		success : function(result) {
			if (result) {
				if (result.ary.length != 0) {
					var boptionStr = '';
					for (var i = 0; i < result.ary.length; i++) {
						boptionStr += "<option value=\"" + result.ary[i].value + "\" >"
							+ result.ary[i].name + "</option>";
					}
					$("#fweld_process").html(boptionStr);
					$("#fweld_process").combobox();
//					$("#fweld_process").combobox('select', result.ary[0].value);
					$("#sfweld_process").html(boptionStr);
					$("#sfweld_process").combobox();
				}
			}
		},
		error : function(errorMsg) {
			alert("数据请求失败，请联系系统管理员!");
		}
	});
}

function getGas() {
	$.ajax({
		type : "post",
		async : false,
		url : "Dictionary/getValueByTypeid?type=" + 12,
		data : {},
		dataType : "json", //返回数据形式为json  
		success : function(result) {
			if (result) {
				if (result.ary.length != 0) {
					var boptionStr = '';
					for (var i = 0; i < result.ary.length; i++) {
						boptionStr += "<option value=\"" + result.ary[i].value + "\" >"
							+ result.ary[i].name + "</option>";
					}
					$("#fgas").html(boptionStr);
					$("#fgas").combobox();
//					$("#fgas").combobox('select', result.ary[0].value);
					$("#sfgas").html(boptionStr);
					$("#sfgas").combobox();
				}
			}
		},
		error : function(errorMsg) {
			alert("数据请求失败，请联系系统管理员!");
		}
	});
}

function getClassificationSociety(){
	$.ajax({  
      type : "post",  
      async : false,
      url : "wps/getClassificationSociety",  
      data : {},  
      dataType : "json", //返回数据形式为json  
      success : function(result) {
          if (result) {
              var optionStr = '';  
              for (var i = 0; i < result.ary.length; i++) { 
                  optionStr += "<option value=\"" + result.ary[i].id + "\" >"  
                          + result.ary[i].name + "</option>";  
              } 
              $("#fclassification_society_id").append(optionStr);
              $("#sfclassification_society_id").append(optionStr);
          }  
      },  
      error : function(errorMsg) {  
          alert("数据请求失败，请联系系统管理员!");  
      }  
 }); 
	$("#fclassification_society_id").combobox();
	$("#sfclassification_society_id").combobox();
}

function getWeldMaterial() {
	$.ajax({
		type : "post",
		async : false,
		url : "Dictionary/getValueByTypeid?type=" + 34,
		data : {},
		dataType : "json", //返回数据形式为json  
		success : function(result) {
			if (result) {
				if (result.ary.length != 0) {
					var boptionStr = '';
					for (var i = 0; i < result.ary.length; i++) {
						boptionStr += "<option value=\"" + result.ary[i].value + "\" >"
							+ result.ary[i].name + "</option>";
					}
					$("#fweld_material_id").html(boptionStr);
					$("#fweld_material_id").combobox();
				}
			}
		},
		error : function(errorMsg) {
			alert("数据请求失败，请联系系统管理员!");
		}
	});
}

function getWeldposition() {
	$.ajax({
		type : "post",
		async : false,
		url : "Dictionary/getValueByTypeid?type=" + 28,
		data : {},
		dataType : "json", //返回数据形式为json  
		success : function(result) {
			if (result) {
				if (result.ary.length != 0) {
					var boptionStr = '';
					for (var i = 0; i < result.ary.length; i++) {
						boptionStr += "<option value=\"" + result.ary[i].value + "\" >"
							+ result.ary[i].name + "</option>";
					}
					$("#fweld_position").html(boptionStr);
					$("#fweld_position").combobox();
//					$("#fweld_position").combobox('select', result.ary[0].value);
					$("#sfweld_position").html(boptionStr);
					$("#sfweld_position").combobox();
				}
			}
		},
		error : function(errorMsg) {
			alert("数据请求失败，请联系系统管理员!");
		}
	});
}
function getWeldmanufacture() {
	$.ajax({
		type : "post",
		async : false,
		url : "Dictionary/getValueByTypeid?type=" +14,
		data : {},
		dataType : "json", //返回数据形式为json  
		success : function(result) {
			if (result) {
				if (result.ary.length != 0) {
					var boptionStr = '';
					for (var i = 0; i < result.ary.length; i++) {
						boptionStr += "<option value=\"" + result.ary[i].value + "\" >"
							+ result.ary[i].name + "</option>";
					}
					$("#fmanufacturer_id").html(boptionStr);
					$("#fmanufacturer_id").combobox();
//					$("#fweld_position").combobox('select', result.ary[0].value);
					$("#sfmanufacturer_id").html(boptionStr);
					$("#sfmanufacturer_id").combobox();
				}
			}
		},
		error : function(errorMsg) {
			alert("数据请求失败，请联系系统管理员!");
		}
	});
}
function saveSxWps(){
	if(checkSxWps()==false){
		return;
	};
	var wpsLibRow = $('#wpslibTable').datagrid('getSelected');
	var index = $('#wpslibTable').datagrid('getRowIndex',wpsLibRow);
	var messager = "";
	var url2 = "";
	if(mflag==1){
		messager = "新增成功！";
		url2 = url;
	}else{
		messager = "修改成功！";
		url2 = url;
	}
	$('#sxfm').form('submit', {
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
					$('#ddv-'+index).datagrid('reload');
					$.messager.alert("提示", messager);
					$('#editSxDlg').dialog('close');
//					$('#wpslibTable').datagrid('reload');
				}
			}
			
		},  
	    error : function(errorMsg) {  
	        alert("数据请求失败，请联系系统管理员!");  
	    } 
	});
}

function getDictionary(typeid,id) {
	$.ajax({
		type : "post",
		async : false,
		url : "wps/getDictionary?typeid=" + typeid,
		data : {},
		dataType : "json", //返回数据形式为json  
		success : function(result) {
			if (result) {
				var optionStr = '';
				for (var i = 0; i < result.ary.length; i++) {
					optionStr += "<option value=\"" + result.ary[i].id + "\" >"
						+ result.ary[i].name + "</option>";
				}
				$("#"+id).html(optionStr);
			}
		},
		error : function(errorMsg) {
			alert("数据请求失败，请联系系统管理员!");
		}
	});
	$("#" + id).combobox();
}
function fmucai(){
	$('#fbase_material_id').combogrid({
	    panelWidth:640,
	      idField:'fid',
	      textField:'fname',
	      url:'wps/getBaseMaterialList',
	      pagination: true,
	    pageSize : 10,
	    pageList : [ 10, 20, 30, 40, 50 ],
	    rownumbers : true,
	    showPageList : false,
	    fitColumns : true,
	      columns:[[{
	      field : 'fid',
	      title : '母材id',
	      width : 270,
	      halign : "center",
	      align : "left",
	      hidden : true
	    }, {
	      field : 'fname',
	      title : '母材名称',
	      width : 100,
	      halign : "center",
	      align : "left"
	    }, {
	      field : 'ftype_name',
	      title : '母材类型',
	      width : 100,
	      halign : "center",
	      align : "left"
	    }, {
	      field : 'ftype',
	      title : '母材类型id',
	      width : 270,
	      halign : "center",
	      align : "left",
	      hidden : true
	    }, {
	      field : 'fcategory_name',
	      title : '母材类别',
	      width : 100,
	      halign : "center",
	      align : "left"
	    }, {
	      field : 'fcategory',
	      title : '母材类别id',
	      width : 270,
	      halign : "center",
	      align : "left",
	      hidden : true
	    }, {
	      field : 'fbase_material_name',
	      title : '母材级别',
	      width : 100,
	      halign : "center",
	      align : "left"
	    }, {
	      field : 'fbase_material_id',
	      title : '母材级别①id',
	      width : 270,
	      halign : "center",
	      align : "left",
	      hidden : true
	    }, {
	      field : 'fbase_material_name_two',
	      title : '母材级别②',
	      width : 100,
	      halign : "center",
	      align : "left",
	      hidden : true
	    }, {
	      field : 'fbase_material_id_two',
	      title : '母材级别②id',
	      width : 270,
	      halign : "center",
	      align : "left",
	      hidden : true
	    }, {
	      field : 'fouter_diameter',
	      title : '管子外径',
	      width : 100,
	      halign : "center",
	      align : "left"
	    }/*, {
	      field : 'fgroove_map',
	      title : '坡口图',
	      width : 100,
	      halign : "center",
	      align : "left",
	      formatter: function(value,row,index){
	        var str = "";
	        str += '<img src="'+value+'" οnmοuseοver="bigImg(this)" οnmοuseοut="closeImgWin()" style="height: 50px;width: 70px"></img> ';
	        return str;
	      }
	    }*/
	      ]],
	    onLoadSuccess: function(data){
	      $("img").mouseover(function (e) {
	        bigImg(this);
	      })
	      $("img").mouseout(function (e) {
	        closeImgWin(this);
	      })
	    }
	  });

}
function groove(){
	$('#fgroove_id').combogrid({
		panelWidth:500,
	    idField:'fid',
	    textField:'fgroove_code',
	    url:'wps/getGrooveList',
	    pagination: true,
		pageSize : 10,
		pageList : [ 10, 20, 30, 40, 50 ],
		rownumbers : true,
		showPageList : false,
		fitColumns : true,
	    columns:[[{
			field : 'fid',
			title : '坡口id',
			width : 270,
			halign : "center",
			align : "left",
			hidden : true
		}, {
			field : 'fgroove_code',
			title : '坡口代码',
			width : 100,
			halign : "center",
			align : "left"
		}, {
			field : 'fweld_method_name',
			title : '焊接方法',
			width : 100,
			halign : "center",
			align : "left"
		}, {
			field : 'fweld_method',
			title : '焊接方法id',
			width : 270,
			halign : "center",
			align : "left",
			hidden : true
		}, {
			field : 'fweld_position_name',
			title : '焊接位置',
			width : 100,
			halign : "center",
			align : "left"
		}, {
			field : 'fweld_position',
			title : '焊接位置id',
			width : 270,
			halign : "center",
			align : "left",
			hidden : true
		}, {
			field : 'fthickness',
			title : '板厚',
			width : 100,
			halign : "center",
			align : "left"
		}, {
			field : 'fgroove_map',
			title : '坡口图',
			width : 100,
			halign : "center",
			align : "left",
			formatter: function(value,row,index){
				var str = "";
				str += '<img src="'+value+'" οnmοuseοver="bigImg(this)" οnmοuseοut="closeImgWin()" style="height: 50px;width: 80px"></img> ';
				return str;
			}
		}
	    ]],
		onLoadSuccess: function(data){
			$("img").mouseover(function (e) {
				bigImg(this);
			})
			$("img").mouseout(function (e) {
				closeImgWin(this);
			})
		}
	});
	
	$('#sfgroove_id').combogrid({
		panelWidth:500,
	    idField:'fid',
	    textField:'fgroove_code',
	    url:'wps/getGrooveList',
	    pagination: true,
		pageSize : 10,
		pageList : [ 10, 20, 30, 40, 50 ],
		rownumbers : true,
		showPageList : false,
		fitColumns : true,
	    columns:[[{
			field : 'fid',
			title : '坡口id',
			width : 270,
			halign : "center",
			align : "left",
			hidden : true
		}, {
			field : 'fgroove_code',
			title : '坡口代码',
			width : 100,
			halign : "center",
			align : "left"
		}, {
			field : 'fweld_method_name',
			title : '焊接方法',
			width : 100,
			halign : "center",
			align : "left"
		}, {
			field : 'fweld_method',
			title : '焊接方法id',
			width : 270,
			halign : "center",
			align : "left",
			hidden : true
		}, {
			field : 'fweld_position_name',
			title : '焊接位置',
			width : 100,
			halign : "center",
			align : "left"
		}, {
			field : 'fweld_position',
			title : '焊接位置id',
			width : 270,
			halign : "center",
			align : "left",
			hidden : true
		}, {
			field : 'fthickness',
			title : '板厚',
			width : 100,
			halign : "center",
			align : "left"
		}, {
			field : 'fgroove_map',
			title : '坡口图',
			width : 100,
			halign : "center",
			align : "left",
			formatter: function(value,row,index){
				var str = "";
				str += '<img src="'+value+'" οnmοuseοver="bigImg(this)" οnmοuseοut="closeImgWin()" style="height: 50px;width: 80px"></img> ';
				return str;
			}
		}
	    ]],
		onLoadSuccess: function(data){
			$("img").mouseover(function (e) {
				bigImg(this);
			})
			$("img").mouseout(function (e) {
				closeImgWin(this);
			})
		}
	});
}

function baseMaterial(){
	$('#fbase_material_id_one').combogrid({
		panelWidth:640,
	    idField:'fid',
	    textField:'fname',
	    url:'wps/getBaseMaterialList',
	    pagination: true,
		pageSize : 10,
		pageList : [ 10, 20, 30, 40, 50 ],
		rownumbers : true,
		showPageList : false,
		fitColumns : true,
	    columns:[[{
			field : 'fid',
			title : '母材id',
			width : 270,
			halign : "center",
			align : "left",
			hidden : true
		}, {
			field : 'fname',
			title : '母材名称',
			width : 100,
			halign : "center",
			align : "left"
		}, {
			field : 'ftype_name',
			title : '母材类型',
			width : 100,
			halign : "center",
			align : "left"
		}, {
			field : 'ftype',
			title : '母材类型id',
			width : 270,
			halign : "center",
			align : "left",
			hidden : true
		}, {
			field : 'fcategory_name',
			title : '母材类别',
			width : 100,
			halign : "center",
			align : "left"
		}, {
			field : 'fcategory',
			title : '母材类别id',
			width : 270,
			halign : "center",
			align : "left",
			hidden : true
		}, {
			field : 'fbase_material_name_one',
			title : '母材级别①',
			width : 100,
			halign : "center",
			align : "left"
		}, {
			field : 'fbase_material_id_one',
			title : '母材级别①id',
			width : 270,
			halign : "center",
			align : "left",
			hidden : true
		}, {
			field : 'fbase_material_name_two',
			title : '母材级别②',
			width : 100,
			halign : "center",
			align : "left"
		}, {
			field : 'fbase_material_id_two',
			title : '母材级别②id',
			width : 270,
			halign : "center",
			align : "left",
			hidden : true
		}, {
			field : 'fouter_diameter',
			title : '管子外径',
			width : 100,
			halign : "center",
			align : "left"
		}/*, {
			field : 'fgroove_map',
			title : '坡口图',
			width : 100,
			halign : "center",
			align : "left",
			formatter: function(value,row,index){
				var str = "";
				str += '<img src="'+value+'" οnmοuseοver="bigImg(this)" οnmοuseοut="closeImgWin()" style="height: 50px;width: 70px"></img> ';
				return str;
			}
		}*/
	    ]],
		onLoadSuccess: function(data){
			$("img").mouseover(function (e) {
				bigImg(this);
			})
			$("img").mouseout(function (e) {
				closeImgWin(this);
			})
		}
	});
	
	$('#fbase_material_id_two').combogrid({
		panelWidth:640,
	    idField:'fid',
	    textField:'fname',
	    url:'wps/getBaseMaterialList',
	    pagination: true,
		pageSize : 10,
		pageList : [ 10, 20, 30, 40, 50 ],
		rownumbers : true,
		showPageList : false,
		fitColumns : true,
	    columns:[[{
			field : 'fid',
			title : '母材id',
			width : 270,
			halign : "center",
			align : "left",
			hidden : true
		}, {
			field : 'fname',
			title : '母材名称',
			width : 100,
			halign : "center",
			align : "left"
		}, {
			field : 'ftype_name',
			title : '母材类型',
			width : 100,
			halign : "center",
			align : "left"
		}, {
			field : 'ftype',
			title : '母材类型id',
			width : 270,
			halign : "center",
			align : "left",
			hidden : true
		}, {
			field : 'fcategory_name',
			title : '母材类别',
			width : 100,
			halign : "center",
			align : "left"
		}, {
			field : 'fcategory',
			title : '母材类别id',
			width : 270,
			halign : "center",
			align : "left",
			hidden : true
		}, {
			field : 'fbase_material_name_one',
			title : '母材级别①',
			width : 100,
			halign : "center",
			align : "left"
		}, {
			field : 'fbase_material_id_one',
			title : '母材级别①id',
			width : 270,
			halign : "center",
			align : "left",
			hidden : true
		}, {
			field : 'fbase_material_name_two',
			title : '母材级别②',
			width : 100,
			halign : "center",
			align : "left"
		}, {
			field : 'fbase_material_id_two',
			title : '母材级别②id',
			width : 270,
			halign : "center",
			align : "left",
			hidden : true
		}, {
			field : 'fouter_diameter',
			title : '管子外径',
			width : 100,
			halign : "center",
			align : "left"
		}/*, {
			field : 'fgroove_map',
			title : '坡口图',
			width : 100,
			halign : "center",
			align : "left",
			formatter: function(value,row,index){
				var str = "";
				str += '<img src="'+value+'" οnmοuseοver="bigImg(this)" οnmοuseοut="closeImgWin()" style="height: 50px;width: 70px"></img> ';
				return str;
			}
		}*/
	    ]],
		onLoadSuccess: function(data){
			$("img").mouseover(function (e) {
				bigImg(this);
			})
			$("img").mouseout(function (e) {
				closeImgWin(this);
			})
		}
	});
	
	$('#sfbase_material_id_one').combogrid({
		panelWidth:640,
	    idField:'fid',
	    textField:'fname',
	    url:'wps/getBaseMaterialList',
	    pagination: true,
		pageSize : 10,
		pageList : [ 10, 20, 30, 40, 50 ],
		rownumbers : true,
		showPageList : false,
		fitColumns : true,
	    columns:[[{
			field : 'fid',
			title : '母材id',
			width : 270,
			halign : "center",
			align : "left",
			hidden : true
		}, {
			field : 'fname',
			title : '母材名称',
			width : 100,
			halign : "center",
			align : "left"
		}, {
			field : 'ftype_name',
			title : '母材类型',
			width : 100,
			halign : "center",
			align : "left"
		}, {
			field : 'ftype',
			title : '母材类型id',
			width : 270,
			halign : "center",
			align : "left",
			hidden : true
		}, {
			field : 'fcategory_name',
			title : '母材类别',
			width : 100,
			halign : "center",
			align : "left"
		}, {
			field : 'fcategory',
			title : '母材类别id',
			width : 270,
			halign : "center",
			align : "left",
			hidden : true
		}, {
			field : 'fbase_material_name_one',
			title : '母材级别①',
			width : 100,
			halign : "center",
			align : "left"
		}, {
			field : 'fbase_material_id_one',
			title : '母材级别①id',
			width : 270,
			halign : "center",
			align : "left",
			hidden : true
		}, {
			field : 'fbase_material_name_two',
			title : '母材级别②',
			width : 100,
			halign : "center",
			align : "left"
		}, {
			field : 'fbase_material_id_two',
			title : '母材级别②id',
			width : 270,
			halign : "center",
			align : "left",
			hidden : true
		}, {
			field : 'fouter_diameter',
			title : '管子外径',
			width : 100,
			halign : "center",
			align : "left"
		}/*, {
			field : 'fgroove_map',
			title : '坡口图',
			width : 100,
			halign : "center",
			align : "left",
			formatter: function(value,row,index){
				var str = "";
				str += '<img src="'+value+'" οnmοuseοver="bigImg(this)" οnmοuseοut="closeImgWin()" style="height: 50px;width: 70px"></img> ';
				return str;
			}
		}*/
	    ]],
		onLoadSuccess: function(data){
			$("img").mouseover(function (e) {
				bigImg(this);
			})
			$("img").mouseout(function (e) {
				closeImgWin(this);
			})
		}
	});
	
	$('#sfbase_material_id_two').combogrid({
		panelWidth:640,
	    idField:'fid',
	    textField:'fname',
	    url:'wps/getBaseMaterialList',
	    pagination: true,
		pageSize : 10,
		pageList : [ 10, 20, 30, 40, 50 ],
		rownumbers : true,
		showPageList : false,
		fitColumns : true,
	    columns:[[{
			field : 'fid',
			title : '母材id',
			width : 270,
			halign : "center",
			align : "left",
			hidden : true
		}, {
			field : 'fname',
			title : '母材名称',
			width : 100,
			halign : "center",
			align : "left"
		}, {
			field : 'ftype_name',
			title : '母材类型',
			width : 100,
			halign : "center",
			align : "left"
		}, {
			field : 'ftype',
			title : '母材类型id',
			width : 270,
			halign : "center",
			align : "left",
			hidden : true
		}, {
			field : 'fcategory_name',
			title : '母材类别',
			width : 100,
			halign : "center",
			align : "left"
		}, {
			field : 'fcategory',
			title : '母材类别id',
			width : 270,
			halign : "center",
			align : "left",
			hidden : true
		}, {
			field : 'fbase_material_name_one',
			title : '母材级别①',
			width : 100,
			halign : "center",
			align : "left"
		}, {
			field : 'fbase_material_id_one',
			title : '母材级别①id',
			width : 270,
			halign : "center",
			align : "left",
			hidden : true
		}, {
			field : 'fbase_material_name_two',
			title : '母材级别②',
			width : 100,
			halign : "center",
			align : "left"
		}, {
			field : 'fbase_material_id_two',
			title : '母材级别②id',
			width : 270,
			halign : "center",
			align : "left",
			hidden : true
		}, {
			field : 'fouter_diameter',
			title : '管子外径',
			width : 100,
			halign : "center",
			align : "left"
		}/*, {
			field : 'fgroove_map',
			title : '坡口图',
			width : 100,
			halign : "center",
			align : "left",
			formatter: function(value,row,index){
				var str = "";
				str += '<img src="'+value+'" οnmοuseοver="bigImg(this)" οnmοuseοut="closeImgWin()" style="height: 50px;width: 70px"></img> ';
				return str;
			}
		}*/
	    ]],
		onLoadSuccess: function(data){
			$("img").mouseover(function (e) {
				bigImg(this);
			})
			$("img").mouseout(function (e) {
				closeImgWin(this);
			})
		}
	});
}

function bigImg(imgObj){
	/**
	 * dialog预览图片
	* @param imgObj img的jquery对象
	 **/
		// 若imgObj为空或imgObj的[src]为【Þ】时，图片无法打开
	    if ((imgObj == undefined || imgObj == null || imgObj.length == 0)
	    		|| ($(imgObj).attr("src") == "" || /Þ$/i.test($(imgObj).attr("src")))) {
	    	$.messager.alert('提示', "该图片无法打开！");
	    	return;
	    }
	    var img = new Image();   
		img.src = $(imgObj).attr("src");
		
		var imgWidth = "";
		var imgHeight = "";
		var imgProportion="";
			// 当<img>的class中配置了"img-width-**px"或"img-height-**px"或"img-proportion-**%"时（仅支持整数），使用对应的图片大小
		var imgClassNames = $(imgObj).prop("class");
		if (imgClassNames != undefined && imgClassNames != "") {
			var imgClassNameArray = imgClassNames.split(" ");
			var imgClassName;
			for (var index in imgClassNameArray) {
				imgClassName = imgClassNameArray[index];
				// 图片宽度
				if (/^(img-width-\d+px)/i.test(imgClassName)) {
					imgWidth = imgClassName.substring(10,imgClassName.length-2);
					
				// 图片高度
				} else if (/^(img-height-\d+px)/i.test(imgClassName)) {
					imgHeight = imgClassName.substring(11,imgClassName.length-2);
					
				// 图片显示比例
				} else if (/^(img-proportion-\d+%)/i.test(imgClassName)) {
					imgProportion = imgClassName.substring(15,imgClassName.length);
				}
			}
		}
		// 显示宽度
		if (imgWidth != null && imgWidth != "") {
			img.width = imgWidth;
		}
		// 显示高度
		if (imgHeight != null && imgHeight != "") {
			img.height = imgHeight;
		}
		// 显示比例设置
		if (imgProportion != null && imgProportion != "") {
			img.width  = img.width * parseFloat(imgProportion)/100;
			img.height  = img.height * parseFloat(imgProportion)/100;
		}
		// 保持图片纵横比的情况下，取得能够在$(window)中放得下的大小
		var heightWidthPropor = img.height/img.width;
		var width = $(window).width()*0.8 >= img.width ? img.width:$(window).width()*0.8;
		var height;
		if ($(window).height()*0.8 < width*heightWidthPropor) {
			height = $(window).height()*0.8;
			width = height/heightWidthPropor;
		} else {
			height = width*heightWidthPropor;
		}
		
		// 防止因用户拖动边框而导致dialog宽高固定不变
		$("#dialog").parent().css("width","auto");
		$("#dialog").parent().css("height","auto");
		
		$("#img_id").css("height",height + "px");
		$("#img_id").css("max-height",height + "px");
		if (imgWidth != null && imgWidth != "") {
			$("#img_id").css("width",width + "px");
			$("#img_id").css("max-width",width + "px");
		}
		
		$("#dialog").css("width",width + "px");
		$("#dialog").css("height",height + 5 + "px");
		
		$("#img_id").css("overflow","hidden");
		$("#img_id").attr('src',img.src); 
		$("#dialog").window('center');
		// 解决关闭按钮位置问题
		$("div.panel-header.panel-header-noborder.window-header").css("width","auto");
		var top = $(window).height()*0.36;
		var left = $(window).width()*0.34;
		$('#dialog').window('open').window('resize',{top: top,left:left});
//	 	$("#dialog").dialog("open");
	

}

function closeImgWin(){
	$("#dialog").dialog("close");
}

function generatePwps(value){
	if(value==1){
		var c = confirm("生成pwps时，电流范围、电压范围、焊接速度范围、线能量范围等需要进行手工录入");
		if(c == true){
			
		}
	}else{
		var wpslibName = $('#swpslibName').val();
		var fstatus = $("input[name='sstatusId']:checked").val();
		var fweld_method = $('#sfweld_method').combobox('getValue');
		var fweld_way = $('#sfweld_way').combobox('getValue');
		var fweld_process = $('#sfweld_process').combobox('getValue');
		var fweld_position = $('#sfweld_position').combobox('getValue');
		var fclassification_society_id = $('#sfclassification_society_id').combobox('getValue');
		var fgroove_id = $('#sfgroove_id').combobox('getValue');
		var fbase_material_id_one = $('#sfbase_material_id_one').combobox('getValue');
		var fbase_material_id_two = $('#sfbase_material_id_two').combobox('getValue');
		var fweld_material_id = $('#sfweld_material_id').combobox('getValue');
		var fgas = $('#sfgas').combobox('getValue');
		var fpad = $('#sfpad').textbox('getValue');
		var fthickness = $('#sfthickness').numberbox('getValue');
		var messager = "";
		var url2 = "";
		if (flag == 1) {
			var machineModel = $('#model').combobox('getValue');
			messager = "新增成功！";
			url2 = url + "?fstatus=" + fstatus + "&wpslibName=" + encodeURI(wpslibName) + "&machineModel=" + encodeURI(machineModel) + "&fweld_method=" + fweld_method
			+ "&fweld_way=" + fweld_way + "&fweld_process" + fweld_process + "&fweld_position=" + fweld_position + "&fclassification_society_id=" + fclassification_society_id
			+ "&fgroove_id=" + fgroove_id + "&fbase_material_id_one=" + fbase_material_id_one + "&fbase_material_id_two=" + fbase_material_id_two + "&fweld_material_id"
			+ fweld_material_id + "&fgas=" + fgas + "&fthickness=" + fthickness + "&fpad=" + encodeURI(fpad);
		} else {
			messager = "修改成功！";
			url2 = url + "&fstatus=" + fstatus + "&wpslibName=" + encodeURI(wpslibName) + "&fweld_method=" + fweld_method
			+ "&fweld_way=" + fweld_way + "&fweld_process" + fweld_process + "&fweld_position=" + fweld_position + "&fclassification_society_id=" + fclassification_society_id
			+ "&fgroove_id=" + fgroove_id + "&fbase_material_id_one=" + fbase_material_id_one + "&fbase_material_id_two=" + fbase_material_id_two + "&fweld_material_id"
			+ fweld_material_id + "&fgas=" + fgas + "&fthickness=" + fthickness + "&fpad=" + encodeURI(fpad);
		}
		$('#wltfm').form('submit', {
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
}