/**
 * 
 */
var oldchanel = 0;
$(function() {
	//	rule();
	groove();
	baseMaterial();
	getWeldmethod();
	getWeldway();
	getWeldprocess();
	getWeldposition();
	getGas();
	getClassificationSociety();
	getWeldMaterial();
	statusRadio();
	addWpslib();
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
function addWpslib() {
	flag = 1;
	$('#wltfm').form('clear');
	$('#wltdlg').window({
		title : "新增工艺库",
		modal : true
	});
	$('#wltdlg').window('open');
	var statusId = document.getElementsByName("statusId");
	statusId[0].checked = 'checked';
	$('#model').combobox('enable');
	url = "wps/addWpslib";
}

function editWpslib() {
	flag = 2;
	$('#wltfm').form('clear');
	var row = $('#wpslibTable').datagrid('getSelected');
	if (row) {
		$('#wltdlg').window({
			title : "修改工艺库",
			modal : true
		});
		$('#wltdlg').window('open');
		$('#wltfm').form('load', row);
		$('#validwl').val(row.wpslibName);
		$('#model').combobox('disable', true);
		url = "wps/updateWpslib?fid=" + row.fid;
	}
}

function saveWpslib() {
	var wpslibName = $('#wpslibName').val();
	var fstatus = $("input[name='statusId']:checked").val();
	var fweld_method = $('#fweld_method').combobox('getValue');
	var fweld_way = $('#fweld_way').combobox('getValue');
	var fweld_process = $('#fweld_process').combobox('getValue');
	var fweld_position = $('#fweld_position').combobox('getValue');
	var fclassification_society_id = $('#fclassification_society_id').combobox('getValue');
	var fgroove_id = $('#fgroove_id').combobox('getValue');
	var fbase_material_id_one = $('#fbase_material_id_one').combobox('getValue');
	var fbase_material_id_two = $('#fbase_material_id_two').combobox('getValue');
	var fweld_material_id = $('#fweld_material_id').combobox('getValue');
	var fgas = $('#fgas').combobox('getValue');
	var fpad = $('#fpad').textbox('getValue');
	var fthickness = $('#fthickness').numberbox('getValue');
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
				$("#sradios").html(sstr);
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
	url = "wps/addMainWps?fid=" + wlrow.fid;
	$('#mwdlg').window('open');
	return;
	if (wlrow.model == 174) {
		EPWINIT();
		$('#mwdlg').window('open');
		return;
	} else if (wlrow.model == 175) {
		EPSINIT();
		$('#mwdlg').window('open');
		return;
	} else if (wlrow.model == 176) {
		WBMLINIT();
		$('#mwdlg').window('open');
		return;
	} else if (wlrow.model == 177) {
		WBPINIT();
		$('#mwdlg').window('open');
		return;
	} else if (wlrow.model == 178) {
		WBLINIT();
		$('#mwdlg').window('open');
		return;
	} else if (wlrow.model == 171) {
		CPVEWINIT();
		comboboxCheck(wlrow.model);
		$('#mwdlg').window('open');
		return;
	} else if (wlrow.model == 172) {
		CPVESINIT();
		$('#mwdlg').window('open');
		return;
	} else if (wlrow.model == 173) {
		CPVETINIT();
		$('#mwdlg').window('open');
		return;
	} else if (wlrow.manu == 149) {
		$('#editSxDlg').window({
			title : "新增工艺",
			modal : true
		});
		$("#sxRemoveWpsBut").hide();
		$("#sxgetWpsBut").show();
		$("#sxSaveWpsBut").show();
		$('#sxfm').form('clear');
		sxDefault();
		$('#editSxDlg').window('open');
		$("input[name='sxfcharacter']").eq(0).prop("checked", true);
		url = "wps/addSxWps?fwpslib_id=" + wlrow.fid+"&fcharacter="+$('input[name="sxfcharacter"]:checked').val();
		return;
	}
	
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
	url = "wps/updateMainWps?fid=" + indexrow.fid;
	return;
	if (row) {
		if (row.model == 174) {
			EPWINIT();
		} else if (row.model == 175) {
			EPSINIT();
		} else if (row.model == 176) {
			WBMLINIT();
		} else if (row.model == 177) {
			WBPINIT();
		} else if (row.model == 178) {
			WBLINIT();
		} else if (row.model == 172) {
			CPVESINIT();
		} else if (row.model == 173) {
			CPVETINIT();
		} else if (row.model == 171) {
			CPVEWINIT();
			comboboxCheck(row.model);
		} else if (row.manu == 149){
			mflag = 2;
			$('#sxfm').form('clear');
			if (row) {
				$('#editSxDlg').window( {
					title : "修改工艺",
					modal : true
				});
				$("#sxRemoveWpsBut").hide();
				$("#sxgetWpsBut").show();
				$("#sxSaveWpsBut").show();
				$('#editSxDlg').window('open');
				$('#sxfm').form('load', indexrow);
				$('#sxchanel').val(indexrow.fwpsnum);
				$("input[name='sxfcharacter']").eq(indexrow.sxfcharacter).prop("checked", true);
				url = "wps/editSxWps?fid="+indexrow.fid+"&fcharacter="+$('input[name="sxfcharacter"]:checked').val();
			}
			return;
		}
		$('#mwdlg').window({
			title : "修改工艺",
			modal : true
		});
		$('#mwdlg').window('open');
		$('#mwfm').form('load', indexrow);
		if (encodeURI(indexrow.initial) == "1") {
			$("#finitial").prop("checked", true);
		}
		if (encodeURI(indexrow.mode) == "1") {
			$("#fmode").prop("checked", true);
		}
		if (encodeURI(indexrow.controller) == "1") {
			$("#fcontroller").prop("checked", true);
		}
		if (encodeURI(indexrow.torch) == "1") {
			$("#ftorch").prop("checked", true);
		}
		url = "wps/updateMainWps?fid=" + indexrow.fid;
		oldchanel = indexrow.fchanel;
	}
}

function saveMainWps() {
	var wpsLibRow = $('#wpslibTable').datagrid('getSelected');
	var index = $('#wpslibTable').datagrid('getRowIndex',wpsLibRow);
	var fpower_polarity = $('#fpower_polarity').combobox('getValue');
	var messager = "";
	if (mflag == 1) {
		messager = "新增成功！";
	} else {
		messager = "修改成功！";
	}
	var url2 = "";
	url2 = url + "&fwpsnum="+$('#fwpsnum').combobox('getValue') + "&fprocessid=" + $('#fprocessid').combobox('getValue') + "&fpower_polarity=" + fpower_polarity
	+ "&fmaterial=" + $('#fmaterial').combobox('getValue') + "&fdiameter=" + $('#fdiameter').combobox('getValue') + "&fwpslib_id=" + wpsLibRow.fid
	 + "&fweld_method=" + $('#dfweld_method').combobox('getValue');
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
					$("#fweld_method").append(boptionStr);
					$("#fweld_method").combobox();
//					$("#fweld_method").combobox('select', result.ary[0].value);
					$("#sfweld_method").append(boptionStr);
					$("#sfweld_method").combobox();
					$("#dfweld_method").append(boptionStr);
					$("#dfweld_method").combobox();
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
		url : "wps/getWeldMaterial",
		data : {},
		dataType : "json", //返回数据形式为json  
		success : function(result) {
			if (result) {
				if (result.ary.length != 0) {
					var boptionStr = '';
					for (var i = 0; i < result.ary.length; i++) {
						boptionStr += "<option value=\"" + result.ary[i].id + "\" >"
							+ result.ary[i].name + "</option>";
					}
					$("#fweld_material_id").html(boptionStr);
					$("#fweld_material_id").combobox();
//					$("#fweld_material_id").combobox('select', result.ary[0].id);
					$("#sfweld_material_id").html(boptionStr);
					$("#sfweld_material_id").combobox();
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
	var row = $('#wpslibTable').datagrid('getSelected');
	var goOnFlag = true;
	$.ajax({
		type : "post",
		async : false,
		url : "wps/getCountFromPwps?name=" + encodeURIComponent(row.wpslibName),
		data : {},
		dataType : "json", //返回数据形式为json  
		success : function(result) {
			if (result) {
				if (result.success==true) {
					goOnFlag = false;
					var con = confirm("该工艺在pwps库中已经存在，继续将前往查看！！！");
					if(con == true){
						if($("#turnFlag").length!=0){
							window.location.href = 'wps/goTurnPwpslib?turnFlag=0&pwpsLibName='+encodeURIComponent(row.wpslibName);
						}else{
							window.location.href = 'wps/goTurnPwpslib?turnFlag=1&pwpsLibName='+encodeURIComponent(row.wpslibName);
						}
						
					}
				}
			}
		},
		error : function(errorMsg) {
			alert("数据请求失败，请联系系统管理员!");
		}
	});
	if(goOnFlag == false){
		return;
	}
	if(value==1){
		var c = confirm("生成pwps时，电流范围、电压范围、焊接速度范围、线能量范围等需要进行手工录入");
		if(c == true){
			$.ajax({
				type : "post",
				async : false,
				url : "wps/wpsGeneratePwps?fid="+row.fid,
				data : {},
				dataType : "json", //返回数据形式为json  
				success : function(result) {
					if (!result.success) {
						alert("生成失败！");
					}else{
						alert("生成完成！");
						if($("#turnFlag").length!=0){
							window.location.href = 'wps/goTurnPwpslib?turnFlag=0&pwpsLibName='+encodeURIComponent(row.wpslibName);
						}else{
							window.location.href = 'wps/goTurnPwpslib?turnFlag=1&pwpsLibName='+encodeURIComponent(row.wpslibName);
						}
					}
				},
				error : function(errorMsg) {
					alert("数据请求失败，请联系系统管理员!");
				}
			});
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
		var machineModel = $('#smodel').combobox('getValue');
		var messager = "";
		var url2 = "";
		messager = "生成成功！";
		url2 = "wps/addPwpslib" + "?fstatus=" + fstatus + "&wpslibName=" + encodeURI(wpslibName) + "&machineModel=" + encodeURI(machineModel) + "&fweld_method=" + fweld_method
		+ "&fweld_way=" + fweld_way + "&fweld_process=" + fweld_process + "&fweld_position=" + fweld_position + "&fclassification_society_id=" + fclassification_society_id
		+ "&fgroove_id=" + fgroove_id + "&fbase_material_id_one=" + fbase_material_id_one + "&fbase_material_id_two=" + fbase_material_id_two + "&fweld_material_id="
		+ fweld_material_id + "&fgas=" + fgas + "&fthickness=" + fthickness + "&fpad=" + encodeURI(fpad);
		$('#swlfm').form('submit', {
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