/**
 * 
 */
$(function(){
	wpslibDatagrid();
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
		}, {
			field : 'wpslibName',
			title : '工艺库名称',
			width : 270,
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
			width : 270,
			halign : "center",
			align : "left"
		}, {
			field : 'createdate',
			title : '创建日期',
			width : 270,
			halign : "center",
			align : "left"
		}, {
			field : 'status',
			title : '状态',
			width : 270,
			halign : "center",
			align : "left"
		}, {
			field : 'statusId',
			title : '状态id',
			width : 270,
			halign : "center",
			align : "left",
			hidden : true
		}, {
			field : 'edit',
			title : '编辑',
			width : 400,
			halign : "center",
			align : "left",
			formatter: function(value,row,index){
				var str = "";
				str += '<a id="wpslibgive" class="easyui-linkbutton" href="javascript:selectMainWps('+row.fid+')"/>';
				str += '<a id="wpslibadd" class="easyui-linkbutton" href="javascript:addMainWps()"/>';
				str += '<a id="wpslibedit" class="easyui-linkbutton" href="javascript:editWpslib()"/>';
				str += '<a id="wpslibremove" class="easyui-linkbutton" href="javascript:openRemoveWpslib()"/>';
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
			$("a[id='wpslibgive']").linkbutton({text:'工艺库下发',plain:true,iconCls:'icon-setwps'});
			$("a[id='wpslibadd']").linkbutton({text:'新增工艺',plain:true,iconCls:'icon-newadd'});
	        $("a[id='wpslibedit']").linkbutton({text:'修改',plain:true,iconCls:'icon-update'});
	        $("a[id='wpslibremove']").linkbutton({text:'删除',plain:true,iconCls:'icon-delete'});
		},
		detailFormatter:function(index,row2){
			return '<div id="div'+index+'"><table id="ddv-' + index + '" style="min-height:80px;"></table></div>';
		},
		onExpandRow: function(index,row){
			var ddv = $(this).datagrid('getRowDetail',index).find('#ddv-'+index);
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
//					width : 30,
					align : "left",
					hidden:true
				},{ 
					field : 'fchanel',
					title : '通道号',
					halign : "center",
					align : "left"
				},{ 
					field : 'finitial',
					title : '初期条件',
					halign : "center",
					align : "left"
				},{ 
					field : 'fcontroller',
					title : '熔深控制',
					halign : "center",
					align : "left"
				}, {
					field : 'fselectname',
					title : '一元/个别',
					halign : "center",
					align : "left"
				}, {
					field : 'fselect',
					title : '一元/个别id',
					halign : "center",
					align : "left",
					hidden : true
				}, {
					field : 'farc',
					title : '收弧id',
					halign : "center",
					align : "left",
					hidden: true
				},{
					field : 'farcname',
					title : '收弧',
					halign : "center",
					align : "left"
				}, {
					field : 'fcharacter',
					title : '电弧特性',
					halign : "center",
					align : "left"
				}, {
					field : 'fmode',
					title : '柔软电弧模式',
					halign : "center",
					align : "left"
				}, {
					field : 'fmaterialname',
					title : '焊丝材质',
					halign : "center",
					align : "left"
				},{
					field : 'fmaterial',
					title : '焊丝材质id',
					halign : "center",
					align : "left",
					hidden : true
				},{
					field : 'fgasname',
					title : '气体',
					halign : "center",
					align : "left"
				},{
					field : 'fgas',
					title : '气体id',
					halign : "center",
					align : "left",
					hidden : true
				},{
					field : 'fdiametername',
					title : '焊丝直径',
					halign : "center",
					align : "left"
				},{
					field : 'fdiameter',
					title : '焊丝直径id',
					halign : "center",
					align : "left",
					hidden : true
				},{
					field : 'ftime',
					title : '点焊时间',
					halign : "center",
					align : "left"
				},{
					field : 'fadvance',
					title : '提前送气',
					halign : "center",
					align : "left"
				},{
					field : 'fhysteresis',
					title : '滞后送气',
					halign : "center",
					align : "left"
				},{
					field : 'fini_ele',
					title : '初期电流',
					halign : "center",
					align : "left"
				},{
					field : 'fini_vol',
					title : '初期电压',
					halign : "center",
					align : "left"
				},{
					field : 'fini_vol1',
					title : '初期电压一元',
					halign : "center",
					align : "left"
				},{
					field : 'fweld_ele',
					title : '焊接电流',
					halign : "center",
					align : "left"
				},{
					field : 'fweld_vol',
					title : '焊接电压',
					halign : "center",
					align : "left"
				},{
					field : 'fweld_vol1',
					title : '焊接电压一元',
					halign : "center",
					align : "left"
				},{
					field : 'farc_ele',
					title : '收弧电流',
					halign : "center",
					align : "left"
				},{
					field : 'farc_vol',
					title : '收弧电压',
					halign : "center",
					align : "left"
				},{
					field : 'farc_vol1',
					title : '收弧电压一元',
					halign : "center",
					align : "left"
				},{
					field : 'fweld_tuny_ele',
					title : '焊接电流微调',
					halign : "center",
					align : "left"
				},{
					field : 'fweld_tuny_vol',
					title : '焊接电压微调',
					halign : "center",
					align : "left"
				},{
					field : 'farc_tuny_ele',
					title : '收弧电流微调',
					halign : "center",
					align : "left"
				},{
					field : 'farc_tuny_vol',
					title : '收弧电压微调',
					halign : "center",
					align : "left"
				},{
					field : 'edit',
					title : '编辑',
					width : 150,
					halign : "center",
					align : "left",
					formatter: function(value,row,index){
						var str = "";
						str += '<a id="mainwpsedit" class="easyui-linkbutton" href="javascript:editMainWps('+encodeURI(JSON.stringify(row))+')"/>';
						str += '<a id="mainwpsremove" class="easyui-linkbutton" href="javascript:openRemoveMainWps('+encodeURI(JSON.stringify(row))+')"/>';
						return str;
					}
				}
				] ],
				pagination : true,
				onResize:function(){
					$('#wpslibTable').datagrid('fixDetailRowHeight',index);
				},
				onLoadSuccess:function(){
					$('#wpslibTable').datagrid("selectRow", index)
					setTimeout(function(){
						$('#wpslibTable').datagrid('fixDetailRowHeight',index);
						$('#wpslibTable').datagrid('fixRowHeight',index);
					},0);
			        $("a[id='mainwpsedit']").linkbutton({text:'修改',plain:true,iconCls:'icon-update'});
			        $("a[id='mainwpsremove']").linkbutton({text:'删除',plain:true,iconCls:'icon-delete'});
					$("#div"+index).height($("#div"+index).height()+20);
					$("#ddv-"+index).datagrid('resize', {
						height : $("#div"+index).height(),
						width : $("#div"+index).width()
					});
				}
			});
			$('#wpslibTable').datagrid('fixDetailRowHeight',index);
		}
	});
}

function closedlg(){
	$('#smdlg').window('close');
	$('#smwdlg').window('close');
	$('#mwdlg').window('close');
	$('#rmmwdlg').window('close');
	$('#wltdlg').window('close');
	$('#rmwltdlg').window('close');
	$('#resultdlg').window('close');
}

/*//监听窗口大小变化
window.onresize = function() {
	setTimeout(domresize(), 500);
}

//改变表格高宽
function domresize() {
	$("#wpslibTable").datagrid('resize', {
		height : $("#body").height(),
		width : $("#body").width()
	});
}*/