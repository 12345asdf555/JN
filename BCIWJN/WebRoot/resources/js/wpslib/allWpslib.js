/**
 * 
 */
$(function(){
	wpslibDatagrid();
	getPowerpolarity();
	sxDefault();
	allCombobox();
	$("#fselect").combobox({
		onSelect : function(record) {
			if (record.value == 102) {
//				document.getElementById("tryiyuan").style.display = "none";
				$("#tryiyuan").next().hide();
			} else {
//				document.getElementById("trgebie").style.display = "none";
				$("#trgebie").css('display' ,'none')
			}
		}
	});
	$('#mwdlg').dialog( {
		onClose : function() {
			$('#fwpsnum').combobox('clear');
			$('#fprocessid').combobox('clear');
			$('#fmaterial').combobox('clear');
			$('#fdiameter').combobox('clear');
			$("#mwfm").form("disableValidation");
		}
	});
})

function wpslibDatagrid(){
	$("#wpslibTable").datagrid( {
//		fitColumns : true,
		view: detailview,
		height : $("#body").height(),
		width : $("#body").width(),
		idField : 'id',
		pageSize : 10,
		pageList : [ 10, 20, 30, 40, 50 ],
		url : "wps/getWpslibList",
		singleSelect : true,
		rownumbers : true,
		showPageList : false,
		autoRowHeight:true,
		columns : [ [ {
			field : 'fid',
			title : '序号',
			width : 30,
			halign : "center",
			align : "left",
			hidden:true
		},{
			field : 'manu',
			title : '厂商类型id',
			width : 30,
			halign : "center",
			align : "left",
			hidden:true
		}, {
			field : 'wpslibName',
			title : '工艺库名称',
			width : 150,
			halign : "center",
			align : "left"
		}, {
			field : 'model',
			title : '焊机型号id',
			width : 270,
			halign : "center",
			align : "left",
			hidden : true
		}, {
			field : 'modelname',
			title : '焊机型号',
			width : 150,
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
			field : 'fweld_way_name',
			title : '焊接方式',
			width : 100,
			halign : "center",
			align : "left"
		}, {
			field : 'fweld_way',
			title : '焊接方式id',
			width : 270,
			halign : "center",
			align : "left",
			hidden : true
		}, {
			field : 'fweld_process_name',
			title : '焊接工艺',
			width : 100,
			halign : "center",
			align : "left"
		}, {
			field : 'fweld_process',
			title : '焊接工艺id',
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
			field : 'fgroove_code',
			title : '坡口代码',
			width : 100,
			halign : "center",
			align : "left"
		}, {
			field : 'fgroove_id',
			title : '坡口id',
			width : 270,
			halign : "center",
			align : "left",
			hidden : true
		}, {
			field : 'fbase_material_name_one',
			title : '母材①名称',
			width : 100,
			halign : "center",
			align : "left"
		}, {
			field : 'fbase_material_id_one',
			title : '母材①id',
			width : 100,
			halign : "center",
			align : "left",
			hidden : true
		}, {
			field : 'fbase_material_name_two',
			title : '母材②名称',
			width : 100,
			halign : "center",
			align : "left"
		}, {
			field : 'fbase_material_id_two',
			title : '母材②id',
			width : 100,
			halign : "center",
			align : "left",
			hidden : true
		}, {
			field : 'fweld_material_name',
			title : '焊材名称',
			width : 100,
			halign : "center",
			align : "left"
		}, {
			field : 'fweld_material_id',
			title : '焊材id',
			width : 100,
			halign : "center",
			align : "left",
			hidden : true
		}, {
			field : 'gasname',
			title : '气体',
			width : 100,
			halign : "center",
			align : "left"
		}, {
			field : 'fgas',
			title : '气体id',
			width : 100,
			halign : "center",
			align : "left",
			hidden : true
		}, {
			field : 'fpad',
			title : '衬垫',
			width : 100,
			halign : "center",
			align : "left"
		}, {
			field : 'fclassification_society_name',
			title : '船级社',
			width : 100,
			halign : "center",
			align : "left"
		}, {
			field : 'fclassification_society_id',
			title : '船级社id',
			width : 100,
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
			field : 'createdate',
			title : '创建日期',
			width : 120,
			halign : "center",
			align : "left"
		}, {
			field : 'status',
			title : '状态',
			width : 100,
			halign : "center",
			align : "left"
		}, {
			field : 'statusId',
			title : '状态id',
			width : 100,
			halign : "center",
			align : "left",
			hidden : true
		}, {
			field : 'edit',
			title : '编辑',
			width : 450,
			halign : "center",
			align : "left",
			formatter: function(value,row,index){
				var str = "";
//				str += '<a id="wpslibgive" class="easyui-linkbutton" href="javascript:selectMainWps('+row.fid+','+row.manu+')"/>';
				str += '<a id="wpslibadd" class="easyui-linkbutton" href="javascript:addMainWps()"/>';
				str += '<a id="wpslibedit" class="easyui-linkbutton" href="javascript:editWpslib()"/>';
				str += '<a id="wpslibremove" class="easyui-linkbutton" href="javascript:openRemoveWpslib()"/>';
				str += '<a id="wpsliboutput" class="easyui-linkbutton" href="wps/outputWpslib?id='+row.fid+'"/>';
				str += '<a id="generatePwps" class="easyui-linkbutton" href="javascript:generatePwps(1)"/>';
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
//			$("a[id='wpslibgive']").linkbutton({text:'工艺库下发',plain:true,iconCls:'icon-setwps'});
			$("a[id='wpslibadd']").linkbutton({text:'新增子工艺',plain:true,iconCls:'icon-newadd'});
	        $("a[id='wpslibedit']").linkbutton({text:'修改',plain:true,iconCls:'icon-update'});
	        $("a[id='wpslibremove']").linkbutton({text:'删除',plain:true,iconCls:'icon-delete'});
	        $("a[id='wpsliboutput']").linkbutton({text:'导出WPS',plain:true,iconCls:'icon-update'});
	        $("a[id='generatePwps']").linkbutton({text:'生成PWPS',plain:true,iconCls:'icon-newadd'});
		},
		detailFormatter:function(index,row2){
			return '<div id="div'+index+'"><table id="ddv-' + index + '" style="min-height:80px;"></table></div>';
		},
		onExpandRow: function(index,row){
			var ddv = $(this).datagrid('getRowDetail',index).find('#ddv-'+index);
			if(row.manu==149){
				ddv.datagrid({
					width: $("#div"+index).width,
					height: $("#div"+index).height,
					idField : 'id',
					pageSize : 10,
					pageList : [ 10, 20, 30, 40, 50 ],
					url : "wps/getMainwpsList?fwpslib_id="+row.fid,
					rownumbers : true,
					pagination : true,
					showPageList : false,
					singleSelect : true,
					columns : [ [ {
						field : 'fid',
						title : 'FID',
						halign : "center",
						align : "left",
						hidden : true
					}, {
						field : 'fwpsnum',
						title : '通道号',
						halign : "center",
						align : "left"
					}, {
						field : 'fsolder_layer',
						title : '焊层号',
						halign : "center",
						align : "left"
					}, {
						field : 'fweld_bead',
						title : '焊道号',
						halign : "center",
						align : "left"
					}, {
						field : 'fweld_method',
						title : '焊接方法',
						halign : "center",
						align : "left"
					}, {
						field : 'fmaterial',
						title : '材质',
						halign : "center",
						align : "left",
						hidden : true
					}, {
						field : 'materialname',
						title : '材质',
						halign : "center",
						align : "left"
					}, {
						field : 'fdiameter',
						title : '丝径',
						halign : "center",
						align : "left",
						hidden : true
					}, {
						field : 'dianame',
						title : '丝径',
						halign : "center",
						align : "left"
					}, {
						field : 'fpreset_ele_bottom',
						title : '电流下限',
						halign : "center",
						align : "left"
					}, {
						field : 'fpreset_ele_top',
						title : '电流上限',
						halign : "center",
						align : "left"
					}, {
						field : 'fpreset_vol_bottom',
						title : '电压下限',
						halign : "center",
						align : "left"
					}, {
						field : 'fpreset_vol_top',
						title : '电压上限',
						halign : "center",
						align : "left"
					}, {
						field : 'fpower_polarity',
						title : '电源极性',
						halign : "center",
						align : "left",
						hidden : true
					}, {
						field : 'fpower_polarity_name',
						title : '电源极性',
						halign : "center",
						align : "left"
					}, {
						field : 'fgas_flow',
						title : '气体流量',
						halign : "center",
						align : "left"
					}, {
						field : 'fweld_speed',
						title : '焊接速度',
						halign : "center",
						align : "left"
					}, {
						field : 'fprocessid',
						title : '脉冲',
						halign : "center",
						align : "left",
						hidden : true
					}, {
						field : 'fprocessname',
						title : '脉冲',
						halign : "center",
						align : "left"
					}, {
						field : 'insid',
						title : '工艺库名称',
						halign : "center",
						align : "left",
						hidden : true
					}, {
						field : 'insname',
						title : '工艺库名称',
						halign : "center",
						align : "left"
					}, {
						field : 'edit',
						title : '编辑',
						width : 200,
						halign : "center",
						align : "left",
						formatter : function(value, indexrow, index) {
							var str = "";
							str += '<a id="wpslibedit" class="easyui-linkbutton" href="javascript:editMainWps('+encodeURI(JSON.stringify(indexrow))+','+encodeURI(JSON.stringify(row))+')"/>';
							str += '<a id="wpslibremove" class="easyui-linkbutton" href="javascript:rmSxWps('+encodeURI(JSON.stringify(indexrow))+')"/>';
							return str;
						}
					} ] ],
					onResize:function(){
						$('#wpslibTable').datagrid('fixDetailRowHeight',index);
					},
					onLoadSuccess : function(data) {
						$("a[id='wpslibedit']").linkbutton({
							text : '修改',
							plain : true,
							iconCls : 'icon-update'
						});
						$("a[id='wpslibremove']").linkbutton({
							text : '删除',
							plain : true,
							iconCls : 'icon-delete'
						});
						$("#div"+index).height($("#div"+index).height()+20);
						$("#ddv-"+index).datagrid('resize', {
							height : $("#div"+index).height(),
							width : $("#div"+index).width()
						});
					},
					rowStyler : function(index, row) {
						if ((index % 2) != 0) {
							//处理行代背景色后无法选中
							var color = new Object();
							return color;
						}
					}
				});
			}else{
				ddv.datagrid({
					fitColumns : true,
					width: $("#div"+index).width,
					height: $("#div"+index).height,
					idField : 'id',
					pageSize : 30,
					pageList : [ 10, 20, 30, 40, 50 ],
					url : "wps/getMainwpsList?parent="+row.fid,
					singleSelect : true,
					rownumbers : true,
					showPageList : false,
					columns : [ [ { 
						field : 'fid',
						title : 'id',
						halign : "center",
//						width : 30,
						align : "left",
						hidden:true
					}, {
						field : 'fwpsnum',
						title : '通道号',
						halign : "center",
						align : "left"
					}, {
						field : 'fsolder_layer',
						title : '焊层号',
						halign : "center",
						align : "left"
					}, {
						field : 'fweld_bead',
						title : '焊道号',
						halign : "center",
						align : "left"
					}, {
						field : 'dfweld_method',
						title : '焊接方法id',
						halign : "center",
						align : "left",
						hidden:true
					}, {
						field : 'dfweld_method_name',
						title : '焊接方法',
						halign : "center",
						align : "left"
					}, {
						field : 'fmaterial',
						title : '材质',
						halign : "center",
						align : "left",
						hidden : true
					}, {
						field : 'materialname',
						title : '材质',
						halign : "center",
						align : "left"
					}, {
						field : 'fdiameter',
						title : '丝径',
						halign : "center",
						align : "left",
						hidden : true
					}, {
						field : 'dianame',
						title : '丝径',
						halign : "center",
						align : "left"
					}, {
						field : 'fpreset_ele_bottom',
						title : '电流下限',
						halign : "center",
						align : "left"
					}, {
						field : 'fpreset_ele_top',
						title : '电流上限',
						halign : "center",
						align : "left"
					}, {
						field : 'fpreset_vol_bottom',
						title : '电压下限',
						halign : "center",
						align : "left"
					}, {
						field : 'fpreset_vol_top',
						title : '电压上限',
						halign : "center",
						align : "left"
					}, {
						field : 'fpower_polarity',
						title : '电源极性',
						halign : "center",
						align : "left",
						hidden : true
					}, {
						field : 'fpower_polarity_name',
						title : '电源极性',
						halign : "center",
						align : "left"
					}, {
						field : 'fgas_flow',
						title : '气体流量',
						halign : "center",
						align : "left"
					}, {
						field : 'fweld_speed',
						title : '焊接速度',
						halign : "center",
						align : "left"
					}, {
						field : 'fprocessid',
						title : '脉冲',
						halign : "center",
						align : "left",
						hidden : true
					}, {
						field : 'fprocessname',
						title : '脉冲',
						halign : "center",
						align : "left"
					}, {
						field : 'felectric_range',
						title : '电流范围',
						halign : "center",
						align : "left"
					}, {
						field : 'fvoltage_range',
						title : '电压范围',
						halign : "center",
						align : "left"
					}, {
						field : 'fweld_speed_range',
						title : '焊接速度范围',
						halign : "center",
						align : "left"
					}, {
						field : 'fline_energy_range',
						title : '线能量范围',
						halign : "center",
						align : "left"
					}, {
						field : 'insid',
						title : '工艺库名称',
						halign : "center",
						align : "left",
						hidden : true
					}, {
						field : 'insname',
						title : '工艺库名称',
						halign : "center",
						align : "left"
					},{
						field : 'edit',
						title : '编辑',
						width : 150,
						halign : "center",
						align : "left",
						formatter: function(value,indexrow,index){
							var str = "";
							str += '<a id="mainwpsedit" class="easyui-linkbutton" href="javascript:editMainWps('+encodeURI(JSON.stringify(indexrow))+','+encodeURI(JSON.stringify(row))+')"/>';
							str += '<a id="mainwpsremove" class="easyui-linkbutton" href="javascript:openRemoveMainWps('+encodeURI(JSON.stringify(indexrow))+')"/>';
							return str;
						}
					}
					] ],
					pagination : true,
					onResize:function(){
						$('#wpslibTable').datagrid('fixDetailRowHeight',index);
					},
					onLoadSuccess:function(){
						var wpslibrow = $('#wpslibTable').datagrid("getSelected");
						/*if(wpslibrow.model==171||wpslibrow.model==172||wpslibrow.model==173){
							$("#ddv-"+index).datagrid('hideColumn', 'ftorch')
						}else{
							$("#ddv-"+index).datagrid('hideColumn', 'fmode')
						}*/
						$('#wpslibTable').datagrid("selectRow", index)
						setTimeout(function(){
							$('#wpslibTable').datagrid('fixDetailRowHeight',index);
							$('#wpslibTable').datagrid('fixRowHeight',index);
						},0);
				        $("a[id='mainwpsedit']").linkbutton({text:'修改',plain:true,iconCls:'icon-update'});
				        $("a[id='mainwpsremove']").linkbutton({text:'删除',plain:true,iconCls:'icon-delete'});
						$("#div"+index).height($("#div"+index).height());
						$("#ddv-"+index).datagrid('resize', {
							height : $("#div"+index).height(),
							width : $("#div"+index).width()
						});
					}
				});
			}
			$('#wpslibTable').datagrid('fixDetailRowHeight',index);
		}
	});
	
	if($("#pwpsLibName").val()){
		var pwpsLibName = " AND fwps_lib_name='"+$("#pwpsLibName").val()+"'";
		$("#wpslibTable").datagrid('load',{
			"searchStr" : pwpsLibName
		})
	}
}

function closedlg(){
	if(!$("#smdlg").parent().is(":hidden")){
		$('#smdlg').window('close');
	}
	if(!$("#smwdlg").parent().is(":hidden")){
		$('#smwdlg').window('close');
	}
	if(!$("#mwdlg").parent().is(":hidden")){
		$('#mwdlg').window('close');
	}
	if(!$("#rmmwdlg").parent().is(":hidden")){
		$('#rmmwdlg').window('close');
	}
	if(!$("#wltdlg").parent().is(":hidden")){
		$('#wltdlg').window('close');
	}
	if(!$("#rmwltdlg").parent().is(":hidden")){
		$('#rmwltdlg').window('close');
	}
	if(!$("#editSxDlg").parent().is(":hidden")){
		$('#editSxDlg').window('close');
	}
	if(!$("#sxMachinedlg").parent().is(":hidden")){
		$('#sxMachinedlg').window('close');
	}
	if(!$("#sxSelectdlg").parent().is(":hidden")){
		$('#sxSelectdlg').window('close');
	}
	if(!$("#resultdlg").parent().is(":hidden")){
		$('#resultdlg').window('close');
	}
}

function sxDefault(){
	$("#sxfweld_vol").numberbox('setValue', 1234);
	$("#sxfweld_ele").numberbox('setValue', 1234);
	$("#sxfini_ele").numberbox('setValue', 1234);
	$("#sxfini_vol").numberbox('setValue', 1234);
	$("#sxfarc_ele").numberbox('setValue', 1234);
	$("#sxfarc_vol").numberbox('setValue', 1234);
	$("#sxfadvance").numberbox('setValue', 10);
	$("#sxfhysteresis").numberbox('setValue', 10);
	$("#sxfinitial").combobox('setValue', 0);
	$("#sxfflow_top").numberbox('setValue', 12.3);
	$("#sxfflow_bottom").numberbox('setValue', 12.3);
	$("#sxfdelay_time").numberbox('setValue', 12.3);
	$("#sxfover_time").numberbox('setValue', 12.3);
	$("#sxffixed_cycle").numberbox('setValue', 12.3);
	$("#sxfwarn_stop_time").numberbox('setValue', 12.3);
/*	$("#sxfpreset_ele_warn_top").numberbox('setValue', 1234);
	$("#sxfpreset_vol_warn_top").numberbox('setValue', 543.2);
	$("#sxfpreset_ele_warn_bottom").numberbox('setValue', 1234);
	$("#sxfpreset_vol_warn_bottom").numberbox('setValue', 543.2);*/
	
	$("#sxfini_ele_warn_top").numberbox('setValue', 1234);
	$("#sxfini_vol_warn_top").numberbox('setValue', 543.2);
	$("#sxfini_ele_warn_bottom").numberbox('setValue', 1234);
	$("#sxfini_vol_warn_bottom").numberbox('setValue', 543.2);
	$("#sxfarc_ele_warn_top").numberbox('setValue', 1234);
	$("#sxfarc_vol_warn_top").numberbox('setValue', 543.2);
	$("#sxfarc_ele_warn_bottom").numberbox('setValue', 1234);
	$("#sxfarc_vol_warn_bottom").numberbox('setValue', 543.2);
}

//打开历史查询窗口
function openHistorydlg(){
	$("#wmhistorydlg").dialog({
	    onClose: function () {
	    	$('#machineNum').numberbox('clear');
	    	$('#theWpslibName').textbox('clear');
	    	getOldTime();
	    	getNewTime();
	    	$('#historyTable').datagrid('loadData',{total:0,rows:[]});
	    	chartStr = "";
	    }
	});
	$('#wmhistorydlg').window( {
		title : "历史下发查询",
		modal : true
	});
	$('#wmhistorydlg').window("open");
	historyTable();
}

var chartStr = "";
function setParam(){
	var dtoTime1 = $("#dtoTime1").datetimebox('getValue');
	var dtoTime2 = $("#dtoTime2").datetimebox('getValue');
	var machineNum = $("#machineNum").numberbox('getValue');
	var wpslibName = $("#theWpslibName").textbox('getValue');
	chartStr += "?machineNum="+machineNum+"&wpslibName="+encodeURI(wpslibName)+"&dtoTime1="+dtoTime1+"&dtoTime2="+dtoTime2;
}

function historyTable(){
	setParam();
	$("#historyTable").datagrid( {
		fitColumns : true,
		height : $("#wmhistorydlg").height()*0.9,
		width : $("#wmhistorydlg").width(),
		idField : 'id',
		pageSize : 10,
		pageList : [ 10, 20, 30, 40, 50 ],  
		url : "wps/getWpslibMachineHistory"+chartStr,
		singleSelect : true,
		rownumbers : true,
		pagination : true,
		showPageList : false,
		columns : [ [ {
			field : 'fid',
			title : 'fid',
			width : 100,
			halign : "center",
			align : "left",
			hidden : true
		} ,{
			field : 'machineNum',
			title : '焊机编号',
			width : 100,
			halign : "center",
			align : "left"
		} ,{
			field : 'machineModel',
			title : '焊机型号',
			width : 100,
			halign : "center",
			align : "left",
			hidden : true
		} ,{
			field : 'wpslibName',
			title : '工艺库名称',
			width : 100,
			halign : "center",
			align : "left"
		}, {
			field : 'chanel',
			title : '通道号',
			width : 100,
			halign : "center",
			align : "left"
		}, {
			field : 'updateTime',
			title : '下发时间',
			width : 100,
			halign : "center",
			align : "left"
		}, {
			field : 'weld_ele',
			title : '焊接电流',
			width : 100,
			halign : "center",
			align : "left"
		}, {
			field : 'weld_vol',
			title : '焊接电压',
			width : 100,
			halign : "center",
			align : "left"
		}, {
			field : 'warn_ele_up',
			title : '报警电流上限',
			width : 100,
			halign : "center",
			align : "left"
		}, {
			field : 'warn_ele_down',
			title : '报警电流下限',
			width : 100,
			halign : "center",
			align : "left"
		}, {
			field : 'warn_vol_up',
			title : '报警电压上限',
			width : 100,
			halign : "center",
			align : "left"
		}, {
			field : 'warn_vol_down',
			title : '报警电压下限',
			width : 100,
			halign : "center",
			align : "left"
		}, {
			field : 'back',
			title : '备注',
			width : 100,
			halign : "center",
			align : "left",
			formatter:function(value,row,index){
			var str = "";
			str += '<a id="fdetail" class="easyui-linkbutton" href="javascript:getDetail('+encodeURI(JSON.stringify(row))+')"/>';
			return str; 
			}
		}]],
		nowrap : false,
		rowStyler: function(index,row){
            if ((index % 2)!=0){
            	//处理行代背景色后无法选中
            	var color=new Object();
                return color;
            }
		},
		onLoadSuccess:function(data){
	        $("a[id='fdetail']").linkbutton({text:'参数详情',plain:true});
	    }
	});
}

function getDetail(row){
	$.ajax({
		type : "post",
		async : false,
		url : "wps/getSpeDetail?machineId="+row.fid+"&machineModel="+row.machineModel+"&chanel="+row.chanel+"&time="+row.updateTime,
		data : {},
		dataType : "json", //返回数据形式为json  
		success : function(result) {
			if (result) {
				if(row.machineModel==171){
					$("#mwdlg").dialog({
					    onClose: function () {
							$("#otcsaveWpsBut").show();
							$("#otcgetWpsBut").show();
					    }
					});
					CPVEWINIT();
					comboboxCheck(row.model);
					$('#mwfm').form('clear');
					$('#mwdlg').window({
						title : "参数详情",
						modal : true
					});
					$("#otcsaveWpsBut").hide();
					$("#otcgetWpsBut").hide();
					$('#mwdlg').window('open');
					$('#mwfm').form('load', result.rows[0]);
					if (encodeURI(result.rows[0].initial) == "1") {
						$("#finitial").prop("checked", true);
					}
					if (encodeURI(result.rows[0].mode) == "1") {
						$("#fmode").prop("checked", true);
					}
					if (encodeURI(result.rows[0].controller) == "1") {
						$("#fcontroller").prop("checked", true);
					}
					if (encodeURI(result.rows[0].torch) == "1") {
						$("#ftorch").prop("checked", true);
					}
				}else{
					$('#editSxDlg').window( {
						title : "参数详情",
						modal : true
					});
					$("#sxRemoveWpsBut").hide();
					$("#sxgetWpsBut").show();
					$("#sxSaveWpsBut").show();
					$("#sxgetWpsBut").hide();
					$("#sxSaveWpsBut").hide();
					$('#editSxDlg').window('open');
					$('#sxfm').form('load', result.rows[0]);
					$("input[name='sxfcharacter']").eq(result.rows[0].sxfcharacter).prop("checked", true);
				}
			}
		},
		error : function(errorMsg) {
			alert("数据请求失败，请联系系统管理员!");
		}
	});
}

//搜索
function searchHistory(){
	chartStr = "";
	setTimeout(function(){
		historyTable();
	},500);
}

//打开文件导入dialog
function importclick(){
	$("#importdiv").dialog("open").dialog("setTitle","从excel导入数据");
}

//确认导入
function importWpsExcel(){
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
			url : "import/importWps",
			success : function(result) {
				if(result){
					var result = eval('(' + result + ')');
		    		document.getElementById("load").style.display ='none';
		    		document.getElementById("show").style.display ='none';
					if (!result.success) {
						$.messager.show( {
							title : 'Error',
							msg : result.msg
						});
					} else {
						$('#importdiv').dialog('close');
						alert("导入成功");
					}
				}
				
			},  
		    error : function(errorMsg) {  
		        alert("数据请求失败，请联系系统管理员!");  
		    } 
		});
		
	}
}

//所有下拉框
function allCombobox(){
	$.ajax({  
		type : "post",  
		async : false,
		url : "wps/getDictionaryValue",  
		data : {},  
		dataType : "json", //返回数据形式为json  
		success : function(result) {
		    if (result) {
		        var optionStr = '';  
		        for (var i = 0; i < result.mary.length; i++) { 
		            optionStr += "<option value=\"" + result.mary[i].id + "\" >"  
		                    + result.mary[i].name + "</option>";  
		        } 
		        $("#fmaterial").append(optionStr);
		    }  
		    if (result) {
		        var optionStr = '';  
		        for (var i = 0; i < result.dary.length; i++) { 
		            optionStr += "<option value=\"" + result.dary[i].id + "\" >"  
		                    + result.dary[i].name + "</option>";  
		        } 
		        $("#fdiameter").append(optionStr);
		    }  
		    if (result) {
		        var optionStr = '';  
		        for (var i = 0; i < result.pary.length; i++) { 
		            optionStr += "<option value=\"" + result.pary[i].id + "\" >"  
		                    + result.pary[i].name + "</option>";  
		        } 
		        $("#fprocessid").append(optionStr);
		    }  
		    if(result){
		    	var ary = new Array();
				for (var i = 1; i < 31; i++) {
					ary.push({
						"text" : "通道号"+i,
						"value" : i+""
					});
				}
				$('#fwpsnum').combobox('loadData', ary);//清空option选项   
		    }
		},  
		error : function(errorMsg) {  
		    alert("数据请求失败，请联系系统管理员!");  
		}  
		}); 
	$("#fmaterial").combobox();
	$("#fdiameter").combobox();
	$("#fprocessid").combobox();
}

function openSearchDialog() {
	$('#swldlg').window({
		title : "查找工艺库",
		modal : true
	});
	$('#swldlg').window('open');
}

function searchWpslib(){
	var searchStr = "";
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
	if(wpslibName){
		searchStr += " AND fwps_lib_name LIKE "+'"%'+wpslibName+'%"';
	}
	if(fstatus){
		searchStr += " AND fstatus="+fstatus;
	}
	if(fweld_method){
		searchStr += " AND wl.fweld_method="+fweld_method;
	}
	if(fweld_way){
		searchStr += " AND wl.fweld_way="+fweld_way;
	}
	if(fweld_process){
		searchStr += " AND wl.fweld_process="+fweld_process;
	}
	if(fweld_position){
		searchStr += " AND wl.fweld_position="+fweld_position;
	}
	if(fclassification_society_id){
		searchStr += " AND wl.fclassification_society_id="+fclassification_society_id;
	}
	if(fgroove_id){
		searchStr += " AND wl.fgroove_id="+fgroove_id;
	}
	if(fbase_material_id_one){
		searchStr += " AND wl.fbase_material_id_one="+fbase_material_id_one;
	}
	if(fbase_material_id_two){
		searchStr += " AND wl.fbase_material_id_two="+fbase_material_id_two;
	}
	if(fweld_material_id){
		searchStr += " AND wl.fweld_material_id="+fweld_material_id;
	}
	if(fgas){
		searchStr += " AND wl.fgas="+fgas;
	}
	if(fpad){
		searchStr += " AND wl.fpad LIKE "+'"%'+fpad+'%"';
	}
	if(fthickness){
		searchStr += " AND wl.fthickness="+fthickness;
	}
	console.log(searchStr);
	
	$.ajax({
		type : "post",
		async : false,
		url : "wps/getCountFromWps?searchStr=" + encodeURI(searchStr),
		data : {},
		dataType : "json", //返回数据形式为json  
		success : function(result) {
			if (result) {
				if (result.success==false) {
					$("#wpslibTable").datagrid('reload');
					alert("未匹配到相关的记录！！！");
				}else{
					$('#swldlg').window('close');
					$("#wpslibTable").datagrid('load',{
						"searchStr" : searchStr
					})
				}
			}
		},
		error : function(errorMsg) {
			alert("数据请求失败，请联系系统管理员!");
		}
	});
}

function getPowerpolarity() {
	$.ajax({
		type : "post",
		async : false,
		url : "Dictionary/getValueByTypeid?type=" + 36,
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
					$("#fpower_polarity").append(boptionStr);
					$("#fpower_polarity").combobox();
				}
			}
		},
		error : function(errorMsg) {
			alert("数据请求失败，请联系系统管理员!");
		}
	});
}

function turnPage(){
	if($("#turnFlag").val()==0){
		window.location.href = 'wps/goTurnPqrlib';
	}else{
		window.location.href = 'wps/goPqrlib';
	}
}

//监听窗口大小变化
window.onresize = function() {
	setTimeout(domresize(), 500);
}

//改变表格高宽
function domresize() {
	$("#wpslibTable").datagrid('resize', {
		height : $("#body").height(),
		width : $("#body").width()
	});
}