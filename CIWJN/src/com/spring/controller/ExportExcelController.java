package com.spring.controller;

import java.io.File;
import java.math.BigInteger;
import java.text.DecimalFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.io.FileUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.github.pagehelper.PageInfo;
import com.spring.dto.WeldDto;
import com.spring.model.DataStatistics;
import com.spring.model.Gather;
import com.spring.model.WeldingMachine;
import com.spring.model.WeldingMaintenance;
import com.spring.page.Page;
import com.spring.service.DataStatisticsService;
import com.spring.service.MaintainService;
import com.spring.service.WeldingMachineService;
import com.spring.util.CommonExcelUtil;
import com.spring.util.IsnullUtil;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

@Controller
@RequestMapping(value = "/export", produces = { "text/json;charset=UTF-8" })
public class ExportExcelController {
	
	private static final long serialVersionUID = -4171187629012625142L;
	
	@Autowired
	private WeldingMachineService wmm;
	@Autowired
	private DataStatisticsService dss;
	@Autowired
	private MaintainService mm;
	private String filename;
	private SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmSS");
	IsnullUtil iutil = new IsnullUtil();
	
	public String getFilename() {
		return filename;
	}

	public void setFilename(String filename) {
		this.filename = filename;
	}
	
	@RequestMapping("/exporWeldingMachine")
	@ResponseBody
	public ResponseEntity<byte[]> exporWeldingMachine(HttpServletRequest request,HttpServletResponse response){
		File file = null;
		try {
			String str=(String) request.getSession().getAttribute("searchStr");
			List<WeldingMachine> list = wmm.getWeldingMachine(str);
			String dtime = null;
			String[] titles = new String[]{"设备编码","设备类型","入厂时间","所属项目","状态","厂家","是否在网","采集序号","位置","ip地址","设备型号"};
			Object[][] data = new Object[list.size()][11];
			for(int i =0; i<list.size();i++){
				data[i][0] = list.get(i).getEquipmentNo();
				data[i][1] = list.get(i).getTypename();
				data[i][2] = list.get(i).getJoinTime();
				data[i][3] = list.get(i).getInsframeworkId().getName();
				data[i][4] = list.get(i).getStatusname();
				data[i][5] = list.get(i).getMvaluename();
				if(list.get(i).getIsnetworking()==0){
					data[i][6] = "是";
				}else{
					data[i][6] = "否";
				}
				Gather gather = list.get(i).getGatherId();
				if(gather!=null){
					data[i][7] = gather.getGatherNo();
				}else{
					data[i][7] = null;
				}
				data[i][8] = list.get(i).getPosition();
				data[i][9] = list.get(i).getIp();
				data[i][10] = list.get(i).getModel();
			}
			filename = "焊机设备" + sdf.format(new Date()) + ".xls";

			ServletContext scontext=request.getSession().getServletContext();
			//获取绝对路径
			String abpath=scontext.getRealPath("");
			//String contextpath=scontext. getContextPath() ; 获取虚拟路径
			
			String path = abpath+"excelfiles/" + filename;
			new CommonExcelUtil(dtime, titles, data, path, "焊机设备数据");
			
			file = new File(path);
			HttpHeaders headers = new HttpHeaders();
			String fileName = "";
			
			fileName = new String(filename.getBytes("gb2312"),"iso-8859-1");
			
			headers.setContentDispositionFormData("attachment", fileName);
			headers.setContentType(MediaType.APPLICATION_OCTET_STREAM);
			
			//处理ie无法下载的问题
			response.setContentType("application/octet-stream;charset=utf-8");
			response.setHeader( "Content-Disposition", 
					"attachment;filename=\""+ fileName); 
			ServletOutputStream o = response.getOutputStream();
			o.flush();
			
			return new ResponseEntity<byte[]>(FileUtils.readFileToByteArray(file), headers, HttpStatus.CREATED);
		}catch (Exception e) {
	    	return null;
		}  finally {
			file.delete();
		}
	}
	
	@RequestMapping("/exporMaintain")
	@ResponseBody
	public ResponseEntity<byte[]> exporMaintain(HttpServletRequest request,HttpServletResponse response){
		File file = null;
		try{
			String str=(String) request.getSession().getAttribute("searchStr");
			List<WeldingMaintenance> list = mm.getWeldingMaintenanceAll(str);
			String dtime = null;
			String[] titles = new String[]{"设备编码","维修人员","维修起始时间","维修结束时间","维修类型","维修说明"};
			Object[][] data = new Object[list.size()][6];
			for(int i =0; i<list.size();i++){
				data[i][0] = list.get(i).getWelding().getEquipmentNo();
				data[i][1] = list.get(i).getMaintenance().getViceman();
				data[i][2] = list.get(i).getMaintenance().getStartTime();
				data[i][3] = list.get(i).getMaintenance().getEndTime();
				data[i][4] = list.get(i).getMaintenance().getTypename();
				data[i][5] = list.get(i).getMaintenance().getDesc();
			}
			filename = "焊机维修" + sdf.format(new Date())+".xls";

			ServletContext scontext=request.getSession().getServletContext();
			//获取绝对路径
			String abpath=scontext.getRealPath("");
			//String contextpath=scontext. getContextPath() ; 获取虚拟路径
			
			String path = abpath+"excelfiles/" + filename;
			
			new CommonExcelUtil(dtime, titles, data, path, "焊机维修数据");
			file = new File(path);
			HttpHeaders headers = new HttpHeaders();
			String fileName = "";
			fileName = new String(filename.getBytes("gb2312"),"iso-8859-1");
		
			headers.setContentDispositionFormData("attachment", fileName);
			headers.setContentType(MediaType.APPLICATION_OCTET_STREAM);
			
			//处理ie无法下载的问题
			response.setContentType("application/octet-stream;charset=utf-8");
			response.setHeader( "Content-Disposition", 
					"attachment;filename=\""+ fileName); 
			ServletOutputStream o = response.getOutputStream();
			o.flush();
			
			return new ResponseEntity<byte[]>(FileUtils.readFileToByteArray(file), headers, HttpStatus.CREATED);
		} catch (Exception e) {
			return null;
		} finally {
			file.delete();
		}
	}
	
	/**
	 * 班组生产数据报表导出
	 * @param request
	 * @param response
	 * @return
	 */
	@RequestMapping("/exportItemdata")
	@ResponseBody
	public ResponseEntity<byte[]> exporItemdata(HttpServletRequest request,HttpServletResponse response){
		File file = null;
		String time1 = request.getParameter("dtoTime1");
		String time2 = request.getParameter("dtoTime2");
		WeldDto dto = new WeldDto();
		String dtime = "统计日期："+time1+"--"+time2;
		try{
			if(iutil.isNull(time1)){
				dto.setDtoTime1(time1);
			}
			if(iutil.isNull(time2)){
				dto.setDtoTime2(time2);
			}
			List<DataStatistics> list = dss.getAllItemData();
			String[] titles = new String[]{"所属班组","设备总数","开机设备数","实焊设备数","设备利用率(%)","焊接焊缝数","焊接时间","工作时间","焊接效率(%)","焊丝消耗(KG)","电能消耗(KWH)","气体消耗(L)"};
			Object[][] data = new Object[list.size()][12];
			int ii=0;
			for(DataStatistics i:list){
				if(ii<list.size()){
				data[ii][0]=i.getName();//所属班组
				data[ii][1]=i.getTotal();//设备总数
				int machinenum = 0;
				BigInteger starttime = null;
				DataStatistics weldtime = null;
				DataStatistics junction = dss.getWorkJunctionNum(i.getId(), dto);//获取工作(焊接)的焊口数
				DataStatistics parameter = dss.getParameter();//获取参数
				BigInteger standytime = null;
				if(junction.getJunctionnum()!=0){
					machinenum = dss.getStartingUpMachineNum(i.getId(),dto);//获取开机焊机总数
					starttime = dss.getStaringUpTime(i.getId(), dto);//获取开机总时长
					data[ii][2]=machinenum;//开机设备数
					data[ii][5]=junction.getJunctionnum();//焊接焊缝数
					data[ii][7]=getTimeStrBySecond(starttime);//工作时间
					standytime = dss.getStandytime(i.getId(), dto);//获取待机总时长
					weldtime = dss.getWorkTimeAndEleVol(i.getId(),dto);//获取焊接时长，平均电流电压
					double standytimes = 0,time=0,electric=0;
					if(standytime!=null){
						standytimes = standytime.doubleValue()/60/60;
					}
					if(weldtime!=null){
						electric = (double)Math.round((weldtime.getWorktime().doubleValue()/60/60*(weldtime.getElectricity()*weldtime.getVoltage())/1000+standytimes*parameter.getStandbypower()/1000)*100)/100;//电能消耗量=焊接时间*焊接平均电流*焊接平均电压+待机时间*待机功率
					}else{
						electric = (double)Math.round((time+standytimes*parameter.getStandbypower()/1000)*100)/100;//电能消耗量=焊接时间*焊接平均电流*焊接平均电压+待机时间*待机功率
					}
					data[ii][11]=electric;//电能消耗
				}else{
					data[ii][2]=0;
					data[ii][5]=0;
					data[ii][7]="00:00:00";
					data[ii][10]=0;
				}
				if(i.getTotal()!=0 && weldtime!=null){
					DataStatistics machine = dss.getWorkMachineNum(i.getId(), dto);//获取工作(焊接)的焊机数
					if(machine!=null && junction!=null){
						data[ii][3]=machine.getMachinenum();//实焊设备数
						data[ii][6]=getTimeStrBySecond(weldtime.getWorktime());//焊接时间
						double useratio =(double)Math.round(Double.valueOf(machinenum)/Double.valueOf(i.getTotal())*100*100)/100;
						double weldingproductivity = (double)Math.round(weldtime.getWorktime().doubleValue()/starttime.doubleValue()*100*100)/100;
						data[ii][4]=useratio;//设备利用率
						data[ii][8]=weldingproductivity;//焊接效率
					}
					if(parameter!=null){
						double  time = weldtime.getWorktime().doubleValue()/60;
						String[] strsz = parameter.getWireweight().split(",");
						double wireweight =Double.valueOf(strsz[0]);
						double wire = (double)Math.round(wireweight*parameter.getSpeed()*time*100)/100;//焊丝消耗量=焊丝|焊丝重量*送丝速度*焊接时间
						double air = (double)Math.round(parameter.getAirflow()*time*100)/100;//气体消耗量=气体流量*焊接时间
						data[ii][9]=wire;//焊丝消耗
						data[ii][11]=air;//气体消耗
					}
				}else{
					data[ii][3]=0;//实焊设备数
					data[ii][6]="00:00:00";//焊接时间
					data[ii][4]=0;//设备利用率
					data[ii][8]=0;//焊接效率
					data[ii][2]=0;//开机设备数
					data[ii][9]=0;//焊丝消耗
					data[ii][11]=0;//气体消耗
				}
				}
				ii++;
			}
			filename = "班组生产数据" + sdf.format(new Date())+".xls";

			ServletContext scontext=request.getSession().getServletContext();
			//获取绝对路径
			String abpath=scontext.getRealPath("");
			//String contextpath=scontext. getContextPath() ; 获取虚拟路径
			
			String path = abpath+"excelfiles/" + filename;
			
			new CommonExcelUtil(dtime, titles, data, path, "班组生产数据");
			file = new File(path);
			HttpHeaders headers = new HttpHeaders();
			String fileName = "";
			fileName = new String(filename.getBytes("gb2312"),"iso-8859-1");
		
			headers.setContentDispositionFormData("attachment", fileName);
			headers.setContentType(MediaType.APPLICATION_OCTET_STREAM);
			
			//处理ie无法下载的问题
			response.setContentType("application/octet-stream;charset=utf-8");
			response.setHeader( "Content-Disposition", 
					"attachment;filename=\""+ fileName); 
			ServletOutputStream o = response.getOutputStream();
			o.flush();
			
			return new ResponseEntity<byte[]>(FileUtils.readFileToByteArray(file), headers, HttpStatus.CREATED);
		} catch (Exception e) {
			return null;
		} finally {
			file.delete();
		}
	}	
	
	/**
	 * 班组焊接数据报表导出
	 * @param request
	 * @param response
	 * @return
	 */
	@RequestMapping("/exportItemWelddata")
	@ResponseBody
	public ResponseEntity<byte[]> exportItemWelddata(HttpServletRequest request,HttpServletResponse response){
		File file = null;
		String time1 = request.getParameter("dtoTime1");
		String time2 = request.getParameter("dtoTime2");
		WeldDto dto = new WeldDto();
		String dtime = "统计日期："+time1+"--"+time2;
		try{
			if(iutil.isNull(time1)){
				dto.setDtoTime1(time1);
			}
			if(iutil.isNull(time2)){
				dto.setDtoTime2(time2);
			}
			List<DataStatistics> ilist = dss.getWeldItemInCountData(dto);
			List<DataStatistics> olist = dss.getWeldItemOutCountData(dto);
			String[] titles = new String[]{"所属班组","累计焊接时间","正常段时长","超规范时长","规范符合率(%)"};
			Object[][] data = new Object[ilist.size()][5];
			int ii=0;
					for(DataStatistics i:ilist){
						for(DataStatistics o:olist){
							if(i.getName().equals(o.getName())){
								if(ii<ilist.size()){
								data[ii][0]=i.getName();//所属班组
								data[ii][1]=getTimeStrBySecond(i.getInsid());//累计焊接时间
								data[ii][2]=getTimeStrBySecond(i.getInsid().subtract(o.getInsid()));//正常焊接时长
								data[ii][3]=getTimeStrBySecond(o.getInsid());//超规范焊接时长
								if(Integer.valueOf(i.getInsid().toString())+Integer.valueOf(o.getInsid().toString())!=0){
									data[ii][4]=new DecimalFormat("0.00").format((float)Integer.valueOf(i.getInsid().subtract(o.getInsid()).toString())/(Integer.valueOf(i.getInsid().toString())));//规范符合率
								}else{
									data[ii][4]=0;
								}
								}
							}
						}
				ii++;
			}
			filename = "班组焊接数据" + sdf.format(new Date())+".xls";

			ServletContext scontext=request.getSession().getServletContext();
			//获取绝对路径
			String abpath=scontext.getRealPath("");
			//String contextpath=scontext. getContextPath() ; 获取虚拟路径
			
			String path = abpath+"excelfiles/" + filename;
			
			new CommonExcelUtil(dtime, titles, data, path, "班组焊接数据");
			file = new File(path);
			HttpHeaders headers = new HttpHeaders();
			String fileName = "";
			fileName = new String(filename.getBytes("gb2312"),"iso-8859-1");
		
			headers.setContentDispositionFormData("attachment", fileName);
			headers.setContentType(MediaType.APPLICATION_OCTET_STREAM);
			
			//处理ie无法下载的问题
			response.setContentType("application/octet-stream;charset=utf-8");
			response.setHeader( "Content-Disposition", 
					"attachment;filename=\""+ fileName); 
			ServletOutputStream o = response.getOutputStream();
			o.flush();
			
			return new ResponseEntity<byte[]>(FileUtils.readFileToByteArray(file), headers, HttpStatus.CREATED);
		} catch (Exception e) {
			return null;
		} finally {
			file.delete();
		}
	}	
	
	/**
	 * 设备生产数据报表导出
	 * @param request
	 * @return
	 */
	@RequestMapping("/exportMachineData")
	@ResponseBody
	public ResponseEntity<byte[]> exportMachineData(HttpServletRequest request,HttpServletResponse response){
		File file = null;
		String time1 = request.getParameter("dtoTime1");
		String time2 = request.getParameter("dtoTime2");
		String item = request.getParameter("item");
		WeldDto dto = new WeldDto();
		BigInteger itemid = null;
		String dtime = "统计日期："+time1+"--"+time2;
		try{
			if(iutil.isNull(time1)){
				dto.setDtoTime1(time1);
			}
			if(iutil.isNull(time2)){
				dto.setDtoTime2(time2);
			}
			if(iutil.isNull(item)){
				itemid = new BigInteger(item);
			}
			List<DataStatistics> list = dss.getAllMachineData(itemid);
			String[] titles = new String []{"所属班组","设备编号","焊接焊缝数","焊接时间","工作时间","焊接效率(%)","焊丝消耗(KG)","电能消耗(KWH)","气体消耗(L)"};
			Object[][] data = new Object[list.size()][9];
			int ii=0;
			for(DataStatistics i:list){
				if(ii<list.size()){
				dto.setMachineid(i.getId());
				data[ii][0]=i.getInsname();
				data[ii][1]=i.getName();
				DataStatistics junctionnum = dss.getWorkJunctionNum(i.getInsid(), dto);
				DataStatistics parameter = dss.getParameter();
				BigInteger worktime = null,standytime=null;
				DataStatistics weld = null;
				if(junctionnum.getJunctionnum()!=0){
					data[ii][2]=junctionnum.getJunctionnum();//焊接焊缝数
					worktime = dss.getStaringUpTime(i.getInsid(), dto);
					data[ii][4]=getTimeStrBySecond(worktime);//工作时间
					standytime = dss.getStandytime(i.getInsid(), dto);//获取待机总时长
					weld = dss.getWorkTimeAndEleVol(i.getInsid(), dto);
					double standytimes = 0,time=0,electric=0;
					if(standytime!=null){
						standytimes = standytime.doubleValue()/60/60;
					}
					if(weld!=null){
						electric = (double)Math.round((weld.getWorktime().doubleValue()/60/60*(weld.getElectricity()*weld.getVoltage())/1000+standytimes*parameter.getStandbypower()/1000)*100)/100;//电能消耗量=焊接时间*焊接平均电流*焊接平均电压+待机时间*待机功率
					}else{
						electric = (double)Math.round((time+standytimes*parameter.getStandbypower()/1000)*100)/100;//电能消耗量=焊接时间*焊接平均电流*焊接平均电压+待机时间*待机功率
					}
					data[ii][7]=electric;//电能消耗
				}else{
					data[ii][2]=0;
					data[ii][4]="00:00:00";
					data[ii][7]=0;
				}
				if(weld!=null){
					data[ii][3]=getTimeStrBySecond(weld.getWorktime());//焊接时间
					data[ii][4]=getTimeStrBySecond(worktime);//工作时间
					double weldingproductivity = (double)Math.round(weld.getWorktime().doubleValue()/worktime.doubleValue()*100*100)/100;
					data[ii][5]=weldingproductivity;//焊接效率
					if(parameter!=null){
						double  time = weld.getWorktime().doubleValue()/60;
						String[] str = parameter.getWireweight().split(",");
						double wireweight =Double.valueOf(str[0]);
						double wire = (double)Math.round(wireweight*parameter.getSpeed()*time*100)/100;//焊丝消耗量=焊丝|焊丝重量*送丝速度*焊接时间
						double air = (double)Math.round(parameter.getAirflow()*time*100)/100;//气体消耗量=气体流量*焊接时间
						data[ii][6]=wire;//焊丝消耗
						data[ii][8]=air;//气体消耗
					}
				}else{
					data[ii][3]="00:00:00";
					data[ii][5]=0;
					data[ii][6]=0;
					data[ii][8]=0;
				}
				}
				ii++;
			}
			filename = "设备生产数据" + sdf.format(new Date())+".xls";

			ServletContext scontext=request.getSession().getServletContext();
			//获取绝对路径
			String abpath=scontext.getRealPath("");
			//String contextpath=scontext. getContextPath() ; 获取虚拟路径
			
			String path = abpath+"excelfiles/" + filename;
			
			new CommonExcelUtil(dtime, titles, data, path, "设备生产数据");
			file = new File(path);
			HttpHeaders headers = new HttpHeaders();
			String fileName = "";
			fileName = new String(filename.getBytes("gb2312"),"iso-8859-1");
		
			headers.setContentDispositionFormData("attachment", fileName);
			headers.setContentType(MediaType.APPLICATION_OCTET_STREAM);
			
			//处理ie无法下载的问题
			response.setContentType("application/octet-stream;charset=utf-8");
			response.setHeader( "Content-Disposition", 
					"attachment;filename=\""+ fileName); 
			ServletOutputStream o = response.getOutputStream();
			o.flush();
			
			return new ResponseEntity<byte[]>(FileUtils.readFileToByteArray(file), headers, HttpStatus.CREATED);
		} catch (Exception e) {
			return null;
		} finally {
			file.delete();
		}
	}	
	
	/**
	 * 设备焊接数据报表导出
	 * @param request
	 * @param response
	 * @return
	 */
	@RequestMapping("/exportMachineWelddata")
	@ResponseBody
	public ResponseEntity<byte[]> exportMachineWelddata(HttpServletRequest request,HttpServletResponse response){
		File file = null;
		String time1 = request.getParameter("dtoTime1");
		String time2 = request.getParameter("dtoTime2");
		String item = request.getParameter("item");
		WeldDto dto = new WeldDto();
		BigInteger itemid = null;
		String dtime = "统计日期："+time1+"--"+time2;
		try{
			if(iutil.isNull(time1)){
				dto.setDtoTime1(time1);
			}
			if(iutil.isNull(time2)){
				dto.setDtoTime2(time2);
			}
			if(iutil.isNull(item)){
				itemid = new BigInteger(item);
			}
			List<DataStatistics> ilist = dss.getWeldMachineInCountData(dto,itemid);
			List<DataStatistics> olist = dss.getWeldMachineOutCountData(dto,itemid);
			String[] titles = new String[]{"所属班组","设备编码","累计焊接时间","正常段时长","超规范时长","规范符合率(%)"};
			Object[][] data = new Object[ilist.size()][6];
			int ii=0;
					for(DataStatistics i:ilist){
						for(DataStatistics o:olist){
							if(i.getName().equals(o.getName())){
								if(ii<ilist.size()){
									data[ii][0]=i.getInsname();//所属班组
									data[ii][1]=i.getName();//焊机编号
									data[ii][2]=getTimeStrBySecond(i.getInsid());//累计焊接时间
									data[ii][3]=getTimeStrBySecond(i.getInsid().subtract(o.getInsid()));//正常焊接时长
									data[ii][4]=getTimeStrBySecond(o.getInsid());//超规范焊接时长
									if(Integer.valueOf(i.getInsid().toString())+Integer.valueOf(o.getInsid().toString())!=0){
										data[ii][5]=new DecimalFormat("0.00").format((float)Integer.valueOf(i.getInsid().subtract(o.getInsid()).toString())/(Integer.valueOf(i.getInsid().toString())));//规范符合率
									}else{
										data[ii][5]=0;
									}
								}
							}
						}
				ii++;
			}
			filename = "设备焊接数据" + sdf.format(new Date())+".xls";

			ServletContext scontext=request.getSession().getServletContext();
			//获取绝对路径
			String abpath=scontext.getRealPath("");
			//String contextpath=scontext. getContextPath() ; 获取虚拟路径
			
			String path = abpath+"excelfiles/" + filename;
			
			new CommonExcelUtil(dtime, titles, data, path, "设备焊接数据");
			file = new File(path);
			HttpHeaders headers = new HttpHeaders();
			String fileName = "";
			fileName = new String(filename.getBytes("gb2312"),"iso-8859-1");
		
			headers.setContentDispositionFormData("attachment", fileName);
			headers.setContentType(MediaType.APPLICATION_OCTET_STREAM);
			
			//处理ie无法下载的问题
			response.setContentType("application/octet-stream;charset=utf-8");
			response.setHeader( "Content-Disposition", 
					"attachment;filename=\""+ fileName); 
			ServletOutputStream o = response.getOutputStream();
			o.flush();
			
			return new ResponseEntity<byte[]>(FileUtils.readFileToByteArray(file), headers, HttpStatus.CREATED);
		} catch (Exception e) {
			return null;
		} finally {
			file.delete();
		}
	}	
	
	/**
	 * 人员生产数据报表导出
	 * @param request
	 * @return
	 */
	@RequestMapping("/exportPersonData")
	@ResponseBody
	public ResponseEntity<byte[]> exportPersonData(HttpServletRequest request,HttpServletResponse response){
		File file = null;
		String time1 = request.getParameter("dtoTime1");
		String time2 = request.getParameter("dtoTime2");
		WeldDto dto = new WeldDto();
		String dtime = "统计日期："+time1+"--"+time2;
		try{
			if(iutil.isNull(time1)){
				dto.setDtoTime1(time1);
			}
			if(iutil.isNull(time2)){
				dto.setDtoTime2(time2);
			}
			List<DataStatistics> list = dss.getAllPersonData();
			String[] titles = new String []{"焊工编号","焊工名称","焊接焊缝数","焊接时间","工作时间","焊接效率(%)","焊丝消耗(KG)","电能消耗(KWH)","气体消耗(L)"};
			Object[][] data = new Object[list.size()][9];
			int ii=0;
			for(DataStatistics i:list){
				if(ii<list.size()){
					dto.setWelderno(i.getSerialnumber());
					data[ii][0]=i.getSerialnumber();
					data[ii][1]=i.getName();
					DataStatistics weld = null;
					BigInteger worktime = null,standytime=null;
					DataStatistics junctionnum = dss.getWorkJunctionNum(null, dto);
					DataStatistics parameter = dss.getParameter();
					if(junctionnum.getJunctionnum()!=0){
						data[ii][2]=junctionnum.getJunctionnum();//焊接焊缝数
						worktime = dss.getStaringUpTime(null, dto);
						data[ii][4]=getTimeStrBySecond(worktime);//工作时间
						standytime = dss.getStandytime(null, dto);
						weld = dss.getWorkTimeAndEleVol(null, dto);
						double standytimes = 0,time=0,electric=0;
						if(standytime!=null){
							standytimes = standytime.doubleValue()/60/60;
						}
						if(weld!=null){
							time = weld.getWorktime().doubleValue()/60/60;
							electric = (double)Math.round((time*(weld.getElectricity()*weld.getVoltage())/1000+standytimes*parameter.getStandbypower()/1000)*100)/100;//电能消耗量=焊接时间*焊接平均电流*焊接平均电压+待机时间*待机功率
						}else{
							electric = (double)Math.round((time+standytimes*parameter.getStandbypower()/1000)*100)/100;
						}
						data[ii][7]=electric;//电能消耗
					}else{
						data[ii][2]=0;
						data[ii][4]="00:00:00";//工作时间
						data[ii][7]=0;
					}
					if(weld!=null){
						data[ii][3]=getTimeStrBySecond(weld.getWorktime());//焊接时间
						double weldingproductivity = (double)Math.round(weld.getWorktime().doubleValue()/worktime.doubleValue()*100*100)/100;
						data[ii][5]=weldingproductivity;//焊接效率
						if(parameter!=null){
							double  time = weld.getWorktime().doubleValue()/60;
							String[] str = parameter.getWireweight().split(",");
							double wireweight =Double.valueOf(str[0]);
							double wire = (double)Math.round(wireweight*parameter.getSpeed()*time*100)/100;//焊丝消耗量=焊丝|焊丝重量*送丝速度*焊接时间
							double air = (double)Math.round(parameter.getAirflow()*time*100)/100;//气体消耗量=气体流量*焊接时间
							data[ii][6]=wire;//焊丝消耗
							data[ii][8]=air;//气体消耗
						}
					}else{
						data[ii][3]="00:00:00";
						data[ii][5]=0;
						data[ii][6]=0;
						data[ii][8]=0;
					}
				}
				ii++;
			}
			filename = "人员生产数据" + sdf.format(new Date())+".xls";

			ServletContext scontext=request.getSession().getServletContext();
			//获取绝对路径
			String abpath=scontext.getRealPath("");
			//String contextpath=scontext. getContextPath() ; 获取虚拟路径
			
			String path = abpath+"excelfiles/" + filename;
			
			new CommonExcelUtil(dtime, titles, data, path, "人员生产数据");
			file = new File(path);
			HttpHeaders headers = new HttpHeaders();
			String fileName = "";
			fileName = new String(filename.getBytes("gb2312"),"iso-8859-1");
		
			headers.setContentDispositionFormData("attachment", fileName);
			headers.setContentType(MediaType.APPLICATION_OCTET_STREAM);
			
			//处理ie无法下载的问题
			response.setContentType("application/octet-stream;charset=utf-8");
			response.setHeader( "Content-Disposition", 
					"attachment;filename=\""+ fileName); 
			ServletOutputStream o = response.getOutputStream();
			o.flush();
			
			return new ResponseEntity<byte[]>(FileUtils.readFileToByteArray(file), headers, HttpStatus.CREATED);
		} catch (Exception e) {
			return null;
		} finally {
			file.delete();
		}
	}	
	
	/**
	 * 人员焊接数据报表导出
	 * @param request
	 * @param response
	 * @return
	 */
	@RequestMapping("/exportPersonWelddata")
	@ResponseBody
	public ResponseEntity<byte[]> exportPersonWelddata(HttpServletRequest request,HttpServletResponse response){
		File file = null;
		String time1 = request.getParameter("dtoTime1");
		String time2 = request.getParameter("dtoTime2");
		WeldDto dto = new WeldDto();
		String dtime = "统计日期："+time1+"--"+time2;
		try{
			if(iutil.isNull(time1)){
				dto.setDtoTime1(time1);
			}
			if(iutil.isNull(time2)){
				dto.setDtoTime2(time2);
			}
			List<DataStatistics> ilist = dss.getWeldPersonInCountData(dto);
			List<DataStatistics> olist = dss.getWeldPersonOutCountData(dto);
			String[] titles = new String[]{"焊工编号","焊工姓名","累计焊接时间","正常段时长","超规范时长","规范符合率(%)"};
			Object[][] data = new Object[ilist.size()][6];
			int ii=0;
					for(DataStatistics i:ilist){
						for(DataStatistics o:olist){
							if(i.getInsname().equals(o.getInsname())){
								if(ii<ilist.size()){
								data[ii][0]=i.getInsname();//焊工编号
								data[ii][1]=i.getName();//焊工 姓名
								data[ii][2]=getTimeStrBySecond(i.getInsid());//累计焊接时间
								data[ii][3]=getTimeStrBySecond(i.getInsid().subtract(o.getInsid()));//正常焊接时长
								data[ii][4]=getTimeStrBySecond(o.getInsid());//超规范焊接时长
								if(Integer.valueOf(i.getInsid().toString())+Integer.valueOf(o.getInsid().toString())!=0){
									data[ii][5]=new DecimalFormat("0.00").format((float)Integer.valueOf(i.getInsid().subtract(o.getInsid()).toString())/(Integer.valueOf(i.getInsid().toString())));//规范符合率
								}else{
									data[ii][5]=0;
								}
								}
							}
						}
						ii++;
			}
			filename = "人员焊接数据" + sdf.format(new Date())+".xls";

			ServletContext scontext=request.getSession().getServletContext();
			//获取绝对路径
			String abpath=scontext.getRealPath("");
			//String contextpath=scontext. getContextPath() ; 获取虚拟路径
			
			String path = abpath+"excelfiles/" + filename;
			
			new CommonExcelUtil(dtime, titles, data, path, "人员焊接数据");
			file = new File(path);
			HttpHeaders headers = new HttpHeaders();
			String fileName = "";
			fileName = new String(filename.getBytes("gb2312"),"iso-8859-1");
		
			headers.setContentDispositionFormData("attachment", fileName);
			headers.setContentType(MediaType.APPLICATION_OCTET_STREAM);
			
			//处理ie无法下载的问题
			response.setContentType("application/octet-stream;charset=utf-8");
			response.setHeader( "Content-Disposition", 
					"attachment;filename=\""+ fileName); 
			ServletOutputStream o = response.getOutputStream();
			o.flush();
			
			return new ResponseEntity<byte[]>(FileUtils.readFileToByteArray(file), headers, HttpStatus.CREATED);
		} catch (Exception e) {
			return null;
		} finally {
			file.delete();
		}
	}	
	
	/**
	 * 工件生产数据报表导出
	 * @param request
	 * @return
	 */
	@RequestMapping("/exportWorkpieceData")
	@ResponseBody
	public ResponseEntity<byte[]> exportWorkpieceData(HttpServletRequest request,HttpServletResponse response){
		File file = null;
		String time1 = request.getParameter("dtoTime1");
		String time2 = request.getParameter("dtoTime2");
		String junctionno = request.getParameter("junctionno");
		WeldDto dto = new WeldDto();
		String dtime = "统计日期："+time1+"--"+time2;
		try{
			if(iutil.isNull(time1)){
				dto.setDtoTime1(time1);
			}
			if(iutil.isNull(time2)){
				dto.setDtoTime2(time2);
			}
			List<DataStatistics> list = dss.getAllJunctionData(junctionno);
			String[] titles = new String []{"焊缝编号","焊接时间","工作时间","焊接效率(%)","焊丝消耗(KG)","电能消耗(KWH)","气体消耗(L)"};
			Object[][] data = new Object[list.size()][7];
			int ii=0;
			for(DataStatistics i:list){
				if(ii<list.size()){
					dto.setJunctionno(i.getSerialnumber());
					data[ii][0]=i.getSerialnumber();
					BigInteger worktime = dss.getStaringUpTime(null, dto);
					DataStatistics parameter = dss.getParameter();
					BigInteger standytime = null;
					DataStatistics weld = null;
					if(worktime!=null){
						data[ii][2]=getTimeStrBySecond(worktime);//工作时间
						weld = dss.getWorkTimeAndEleVol(null, dto);
						standytime = dss.getStandytime(null, dto);

						double standytimes = 0,time=0,electric=0;
						if(standytime!=null){
							standytimes = standytime.doubleValue()/60/60;
						}
						if(weld!=null){
							time = weld.getWorktime().doubleValue()/60/60;
							electric = (double)Math.round((time*(weld.getElectricity()*weld.getVoltage())/1000+standytimes*parameter.getStandbypower()/1000)*100)/100;//电能消耗量=焊接时间*焊接平均电流*焊接平均电压+待机时间*待机功率
						}else{
							electric = (double)Math.round((time+standytimes*parameter.getStandbypower()/1000)*100)/100;
						}
						data[ii][5]=electric;//电能消耗
					}else{
						data[ii][2]="00:00:00";
						data[ii][5]=0;
					}
					if(worktime!=null && weld!=null){
						data[ii][1]=getTimeStrBySecond(weld.getWorktime());//焊接时间
						double weldingproductivity = (double)Math.round(weld.getWorktime().doubleValue()/worktime.doubleValue()*100*100)/100;
						data[ii][3]=weldingproductivity;//焊接效率
						if(parameter!=null){
							double  time = weld.getWorktime().doubleValue()/60;
							String[] str = parameter.getWireweight().split(",");
							double wireweight =Double.valueOf(str[0]);
							double wire = (double)Math.round(wireweight*parameter.getSpeed()*time*100)/100;//焊丝消耗量=焊丝|焊丝重量*送丝速度*焊接时间
							double air = (double)Math.round(parameter.getAirflow()*time*100)/100;//气体消耗量=气体流量*焊接时间
							data[ii][4]=wire;//焊丝消耗
							data[ii][6]=air;//气体消耗
						}
					}else{
						data[ii][1]="00:00:00";
						data[ii][3]=0;
						data[ii][4]=0;
						data[ii][6]=0;
					}
				}
				ii++;
			}
			filename = "工件生产数据" + sdf.format(new Date())+".xls";

			ServletContext scontext=request.getSession().getServletContext();
			//获取绝对路径
			String abpath=scontext.getRealPath("");
			//String contextpath=scontext. getContextPath() ; 获取虚拟路径
			
			String path = abpath+"excelfiles/" + filename;
			
			new CommonExcelUtil(dtime, titles, data, path, "工件生产数据");
			file = new File(path);
			HttpHeaders headers = new HttpHeaders();
			String fileName = "";
			fileName = new String(filename.getBytes("gb2312"),"iso-8859-1");
		
			headers.setContentDispositionFormData("attachment", fileName);
			headers.setContentType(MediaType.APPLICATION_OCTET_STREAM);
			
			//处理ie无法下载的问题
			response.setContentType("application/octet-stream;charset=utf-8");
			response.setHeader( "Content-Disposition", 
					"attachment;filename=\""+ fileName); 
			ServletOutputStream o = response.getOutputStream();
			o.flush();
			
			return new ResponseEntity<byte[]>(FileUtils.readFileToByteArray(file), headers, HttpStatus.CREATED);
		} catch (Exception e) {
			return null;
		} finally {
			file.delete();
		}
	}	
	
	/**
	 * 工件焊接数据报表导出
	 * @param request
	 * @param response
	 * @return
	 */
	@RequestMapping("/exportWorkpieceWelddata")
	@ResponseBody
	public ResponseEntity<byte[]> exportWorkpieceWelddata(HttpServletRequest request,HttpServletResponse response){
		File file = null;
		String time1 = request.getParameter("dtoTime1");
		String time2 = request.getParameter("dtoTime2");
		String junctionno = request.getParameter("junctionno");
		WeldDto dto = new WeldDto();
		String dtime = "统计日期："+time1+"--"+time2;
		try{
			if(iutil.isNull(time1)){
				dto.setDtoTime1(time1);
			}
			if(iutil.isNull(time2)){
				dto.setDtoTime2(time2);
			}
			List<DataStatistics> ilist = dss.getWeldWorkpieceInCountData(dto,junctionno);
			List<DataStatistics> olist = dss.getWeldWorkpieceOutCountData(dto,junctionno);
			String[] titles = new String[]{"焊缝编号","累计焊接时间","正常段时长","超规范时长","规范符合率(%)"};
			Object[][] data = new Object[ilist.size()][5];
			int ii=0;
					for(DataStatistics i:ilist){
						for(DataStatistics o:olist){
							if(i.getInsname().equals(o.getInsname())){
								if(ii<ilist.size()){
								data[ii][0]=i.getInsname().substring(2, 8);//工件编号
								data[ii][1]=getTimeStrBySecond(i.getInsid());//累计焊接时间
								data[ii][2]=getTimeStrBySecond(i.getInsid().subtract(o.getInsid()));//正常焊接时长
								data[ii][3]=getTimeStrBySecond(o.getInsid());//超规范焊接时长
								if(Integer.valueOf(i.getInsid().toString())+Integer.valueOf(o.getInsid().toString())!=0){
									data[ii][4]=new DecimalFormat("0.00").format((float)Integer.valueOf(i.getInsid().subtract(o.getInsid()).toString())/(Integer.valueOf(i.getInsid().toString())));//规范符合率
								}else{
									data[ii][4]=0;
								}
								}
							}
						}
				ii++;
			}
			filename = "工件焊接数据" + sdf.format(new Date())+".xls";

			ServletContext scontext=request.getSession().getServletContext();
			//获取绝对路径
			String abpath=scontext.getRealPath("");
			//String contextpath=scontext. getContextPath() ; 获取虚拟路径
			
			String path = abpath+"excelfiles/" + filename;
			
			new CommonExcelUtil(dtime, titles, data, path, "工件焊接数据");
			file = new File(path);
			HttpHeaders headers = new HttpHeaders();
			String fileName = "";
			fileName = new String(filename.getBytes("gb2312"),"iso-8859-1");
		
			headers.setContentDispositionFormData("attachment", fileName);
			headers.setContentType(MediaType.APPLICATION_OCTET_STREAM);
			
			//处理ie无法下载的问题
			response.setContentType("application/octet-stream;charset=utf-8");
			response.setHeader( "Content-Disposition", 
					"attachment;filename=\""+ fileName); 
			ServletOutputStream o = response.getOutputStream();
			o.flush();
			
			return new ResponseEntity<byte[]>(FileUtils.readFileToByteArray(file), headers, HttpStatus.CREATED);
		} catch (Exception e) {
			return null;
		} finally {
			file.delete();
		}
	}	
	
	public String getTimeStrBySecond(BigInteger timeParam ) {
		BigInteger[] str = timeParam.divideAndRemainder(new BigInteger("60"));//divideAndRemainder返回数组。第一个是商第二个时取模
		BigInteger second = str[1];
		BigInteger minuteTemp = timeParam.divide(new BigInteger("60"));//subtract：BigInteger相减，multiply：BigInteger相乘，divide : BigInteger相除
        if (minuteTemp.compareTo(new BigInteger("0"))>0) {//compareTo：比较BigInteger类型的大小，大则返回1，小则返回-1 ，等于则返回0
        	BigInteger[] minstr = minuteTemp.divideAndRemainder(new BigInteger("60"));
    		BigInteger minute = minstr[1];
    		BigInteger hour = minuteTemp.divide(new BigInteger("60"));
            if (hour.compareTo(new BigInteger("0"))>0) {
                return (hour.compareTo(new BigInteger("9"))>0 ? (hour + "") : ("0" + hour)) + ":" + (minute.compareTo(new BigInteger("9"))>0 ? (minute + "") : ("0" + minute))
                        + ":" + (second .compareTo(new BigInteger("9"))>0 ? (second + "") : ("0" + second));
            } else {
                return "00:" + (minute.compareTo(new BigInteger("9"))>0 ? (minute + "") : ("0" + minute)) + ":"
                        + (second .compareTo(new BigInteger("9"))>0 ? (second + "") : ("0" + second));
            }
        } else {
            return "00:00:" + (second .compareTo(new BigInteger("9"))>0 ? (second + "") : ("0" + second));
        }
	}
	
}
