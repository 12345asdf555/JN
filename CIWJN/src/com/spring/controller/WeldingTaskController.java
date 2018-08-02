package com.spring.controller;

import java.math.BigInteger;
import java.text.DecimalFormat;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import org.apache.cxf.endpoint.Client;
import javax.xml.namespace.QName;

import org.apache.cxf.jaxws.endpoint.dynamic.JaxWsDynamicClientFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.github.pagehelper.PageInfo;
import com.spring.dto.WeldDto;
import com.spring.model.MyUser;
import com.spring.model.WeldingMachine;
import com.spring.model.Dictionarys;
import com.spring.model.WeldedJunction;
import com.spring.page.Page;
import com.spring.service.InsframeworkService;
import com.spring.service.LiveDataService;
import com.spring.service.WeldedJunctionService;
import com.spring.util.IsnullUtil;
import com.spring.service.DictionaryService;
import com.spring.service.WeldingMachineService;
import com.spring.service.UserService;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

@Controller
@RequestMapping(value = "/weldtask", produces = { "text/json;charset=UTF-8" })
public class WeldingTaskController {

	private Page page;
	private int pageIndex = 1;
	private int pageSize = 10;
	private int total = 0;

	@Autowired
	private WeldedJunctionService wjm;
	@Autowired
	private InsframeworkService insm;
	@Autowired
	private LiveDataService lm;
	IsnullUtil iutil = new IsnullUtil();
	@Autowired
	private WeldingMachineService wmm;
	@Autowired
	private DictionaryService dm;
	@Autowired
	private UserService fuser;

	@RequestMapping("/goWeldTask")
	public String goWeldTask(){
		return "weldingtask/weldingtask";
	}
	
	@RequestMapping("/goTaskResult")
	public String goTaskResult(HttpServletRequest request){
		MyUser user = (MyUser)SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		request.setAttribute("userinsframework", fuser.getUserInsframework(new BigInteger(String.valueOf(user.getId()))).getInsname());
		return "weldingtask/taskresult";
	}
	@RequestMapping("/goTaskEvaluate")
	public String goTaskEvaluate(HttpServletRequest request){
		MyUser user = (MyUser)SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		request.setAttribute("userinsframework", fuser.getUserInsframework(new BigInteger(String.valueOf(user.getId()))).getInsname());
		return "weldingtask/taskevaluate";
	}
	@RequestMapping("/getWeldTaskList")
	@ResponseBody
	public String getWeldTaskList(HttpServletRequest request){
		pageIndex = Integer.parseInt(request.getParameter("page"));
		pageSize = Integer.parseInt(request.getParameter("rows"));
		String serach = request.getParameter("searchStr");
		
		page = new Page(pageIndex,pageSize,total);
		List<WeldedJunction> list = wjm.getWeldedJunctionAll(page, serach);
		long total = 0;
		
		if(list != null){
			PageInfo<WeldedJunction> pageinfo = new PageInfo<WeldedJunction>(list);
			total = pageinfo.getTotal();
		}
		
		JSONObject json = new JSONObject();
		JSONArray ary = new JSONArray();
		JSONObject obj = new JSONObject();
		try{
			for(WeldedJunction w:list){
				json.put("id", w.getId());
				json.put("weldedJunctionno", w.getWeldedJunctionno());
				json.put("serialNo", w.getSerialNo());
				json.put("pipelineNo", w.getPipelineNo());
				json.put("roomNo", w.getRoomNo());
				if( w.getItemid()!=null && !"".equals( w.getItemid())){
					json.put("itemname", w.getItemid().getName());
					json.put("itemid", w.getItemid().getId());
				}
				json.put("welderid", w.getDyne());
				json.put("quali", w.getExternalDiameter());
				json.put("dtoTime1",w.getStartTime());
				json.put("dtoTime2", w.getEndTime());
				ary.add(json);
			}
		}catch(Exception e){
			e.printStackTrace();
		}
		obj.put("total", total);
		obj.put("rows", ary);
		return obj.toString();
	}
	
	@RequestMapping("/getTaskResultList")
	@ResponseBody
	public String getTaskResultList(HttpServletRequest request){
		pageIndex = Integer.parseInt(request.getParameter("page"));
		pageSize = Integer.parseInt(request.getParameter("rows"));
		String serach = request.getParameter("searchStr");
		
		page = new Page(pageIndex,pageSize,total);
		List<WeldedJunction> list = wjm.getTaskResultAll(page, serach);
		long total = 0;
		
		if(list != null){
			PageInfo<WeldedJunction> pageinfo = new PageInfo<WeldedJunction>(list);
			total = pageinfo.getTotal();
		}
		
		JSONObject json = new JSONObject();
		JSONArray ary = new JSONArray();
		JSONObject obj = new JSONObject();
		try{
			for(WeldedJunction w:list){
				json.put("id", w.getId());
				json.put("taskid", w.getCounts());
				json.put("welderid", w.getInsfid());
				json.put("machineid", w.getMachid());
				json.put("operateid",w.getDyne());
				json.put("result", w.getPipelineNo());
				json.put("resultid", w.getUpdatecount());
				json.put("taskNo",w.getWeldedJunctionno());
				json.put("welderNo", w.getSerialNo());
				json.put("machineNo", w.getMachine_num());
				json.put("resultName", w.getRoomNo());
				ary.add(json);
			}
		}catch(Exception e){
			e.printStackTrace();
		}
		obj.put("total", total);
		obj.put("rows", ary);
		return obj.toString();
	}

	@RequestMapping("/getJunctionByWelder")
	@ResponseBody
	public String getJunctionByWelder(HttpServletRequest request){
		pageIndex = Integer.parseInt(request.getParameter("page"));
		pageSize = Integer.parseInt(request.getParameter("rows"));
		String welder = request.getParameter("welder");
		String time1 = request.getParameter("dtoTime1");
		String time2 = request.getParameter("dtoTime2");
		WeldDto dto = new WeldDto();
		if(iutil.isNull(time1)){
			dto.setDtoTime1(time1);
		}
		if(iutil.isNull(time2)){
			dto.setDtoTime2(time2);
		}
		
		page = new Page(pageIndex,pageSize,total);
		List<WeldedJunction> list = wjm.getJunctionByWelder(page, welder, dto);
		long total = 0;
		
		if(list != null){
			PageInfo<WeldedJunction> pageinfo = new PageInfo<WeldedJunction>(list);
			total = pageinfo.getTotal();
		}
		
		JSONObject json = new JSONObject();
		JSONArray ary = new JSONArray();
		JSONObject obj = new JSONObject();
		try{
			for(WeldedJunction w:list){
				json.put("weldedJunctionno", w.getWeldedJunctionno().substring(2, 8));
				json.put("maxElectricity", w.getMaxElectricity());
				json.put("minElectricity", w.getMinElectricity());
				json.put("maxValtage", w.getMaxValtage());
				json.put("minValtage", w.getMinValtage());
				if( w.getItemid()!=null && !"".equals( w.getItemid())){
					json.put("itemname", w.getItemid().getName());
				}
				ary.add(json);
			}
		}catch(Exception e){
			e.getMessage();
		}
		obj.put("total", total);
		obj.put("rows", ary);
		return obj.toString();
	}

	/**
	 * 显示焊机列表
	 * @return
	 */
	@RequestMapping("/getWedlingMachineList")
	@ResponseBody
	public String getWedlingMachineList(HttpServletRequest request){
		pageIndex = Integer.parseInt(request.getParameter("page"));
		pageSize = Integer.parseInt(request.getParameter("rows"));
		String searchStr = request.getParameter("searchStr");
		if(Integer.valueOf(searchStr)==1){
			MyUser user = (MyUser)SecurityContextHolder.getContext().getAuthentication().getPrincipal();
			searchStr = "i.fid=" + fuser.getUserInsframework(new BigInteger(String.valueOf(user.getId()))).getUserInsframework();
		}
		if(searchStr.equals("0")){
			searchStr = null;
		}
		String parentId = request.getParameter("parent");
		BigInteger parent = null;
		if(iutil.isNull(parentId)){
			parent = new BigInteger(parentId);
		}
		request.getSession().setAttribute("searchStr", searchStr);
		page = new Page(pageIndex,pageSize,total);
		List<WeldingMachine> list = wmm.getWeldingMachineAll(page,parent,searchStr);
		long total = 0;
		
		if(list != null){
			PageInfo<WeldingMachine> pageinfo = new PageInfo<WeldingMachine>(list);
			total = pageinfo.getTotal();
		}
		
		JSONObject json = new JSONObject();
		JSONArray ary = new JSONArray();
		JSONObject obj = new JSONObject();
		try{
			for(WeldingMachine wm:list){
				json.put("id", wm.getId());
				json.put("ip", wm.getIp());
				json.put("equipmentNo", wm.getEquipmentNo());
				json.put("position", wm.getPosition());
				json.put("gatherId", wm.getGatherId());
				if(wm.getIsnetworking()==0){
					json.put("isnetworking", "是");
				}else{
					json.put("isnetworking", "否");
				}
				json.put("isnetworkingId", wm.getIsnetworking());
				json.put("joinTime", wm.getJoinTime());
				json.put("typeName",wm.getTypename());
				json.put("typeId", wm.getTypeId());
				json.put("statusName", wm.getStatusname());
				json.put("statusId", wm.getStatusId());
				json.put("manufacturerName", wm.getMvaluename());
				json.put("manuno", wm.getMvalueid());
				if( wm.getInsframeworkId()!=null && !"".equals(wm.getInsframeworkId())){
					json.put("insframeworkName", wm.getInsframeworkId().getName());
					json.put("iId", wm.getInsframeworkId().getId());
				}
				json.put("model",wm.getModel());
				if(wm.getGatherId()!=null && !("").equals(wm.getGatherId())){
					json.put("gatherId", wm.getGatherId().getGatherNo());
					json.put("gid", wm.getGatherId().getId());
				}else{
					json.put("gatherId", null);
					json.put("gid", null);
				}
				ary.add(json);
			}
		}catch(Exception e){
			e.printStackTrace();
		}
		obj.put("total", total);
		obj.put("rows", ary);
		return obj.toString();
	}

	/**
	 * 获取评价等级
	 * @return
	 */
	@RequestMapping("/getStatusAll")
	@ResponseBody
	public String getStatusAll(){
		JSONObject json = new JSONObject();
		JSONArray ary = new JSONArray();
		JSONObject obj = new JSONObject();
		try{
			List<Dictionarys> dictionary = dm.getDictionaryValue(16);
			for(Dictionarys d:dictionary){
				json.put("id", d.getValue());
				json.put("name", d.getValueName());
				ary.add(json);
			}
		}catch(Exception e){
			e.getMessage();
		}
		obj.put("ary", ary);
		return obj.toString();
	}

	@RequestMapping("/addWeldTask")
	@ResponseBody
	public String addWeldTask(HttpServletRequest request){
		JSONObject obj = new JSONObject();
		try{
			//客户端执行操作
			JaxWsDynamicClientFactory dcf = JaxWsDynamicClientFactory.newInstance();
			Client client = dcf.createClient("http://121.196.222.216:8080/CIWJN_Service/cIWJNWebService?wsdl");
			iutil.Authority(client);
			String obj1 = "{\"CLASSNAME\":\"junctionWebServiceImpl\",\"METHOD\":\"addJunction\"}";
			String obj2 = "{\"JUNCTIONNO\":\""+request.getParameter("weldedJunctionno")+"\",\"SERIALNO\":\""+request.getParameter("serialNo")+"\",\"DYNE\":\""+request.getParameter("fwelderid")+"\"," +
					"\"INSFID\":\""+request.getParameter("fitemid")+"\",\"STARTTIME\":\""+request.getParameter("dtoTime1")+"\",\"ENDTIME\":\""+request.getParameter("dtoTime2")+"\",\"EXTERNALDIAMETER\":\""+request.getParameter("quali")+"\"}";
			Object[] objects = client.invoke(new QName("http://webservice.ssmcxf.sshome.com/", "enterTheWS"), new Object[]{obj1,obj2});  
			if(objects[0].toString().equals("true")){
				obj.put("success", true);
			}else if(!objects[0].toString().equals("false")){
				obj.put("success", true);
				obj.put("msg", objects[0].toString());
			}else{
				obj.put("success", false);
				obj.put("errorMsg", "操作失败！");
			}
		}catch(Exception e){
			obj.put("success", false);
			obj.put("errorMsg", e.getMessage());
		}
		return obj.toString();
}

	@RequestMapping("/editWeldTask")
	@ResponseBody
	public String editWeldTask(HttpServletRequest request){
		JSONObject obj = new JSONObject();
		try{
			//客户端执行操作
			JaxWsDynamicClientFactory dcf = JaxWsDynamicClientFactory.newInstance();
			Client client = dcf.createClient("http://121.196.222.216:8080/CIWJN_Service/cIWJNWebService?wsdl");
			iutil.Authority(client);
			String obj1 = "{\"CLASSNAME\":\"junctionWebServiceImpl\",\"METHOD\":\"updateJunction\"}";
			String obj2 = "{\"ID\":\""+request.getParameter("id")+"\",\"JUNCTIONNO\":\""+request.getParameter("weldedJunctionno")+"\",\"SERIALNO\":\""+request.getParameter("serialNo")+"\",\"DYNE\":\""+request.getParameter("fwelderid")+"\"," +
					"\"INSFID\":\""+request.getParameter("fitemid")+"\",\"STARTTIME\":\""+request.getParameter("dtoTime1")+"\",\"ENDTIME\":\""+request.getParameter("dtoTime2")+"\",\"EXTERNALDIAMETER\":\""+request.getParameter("quali")+"\"}";
			Object[] objects = client.invoke(new QName("http://webservice.ssmcxf.sshome.com/", "enterTheWS"), new Object[]{obj1,obj2});  
			if(objects[0].toString().equals("true")){
				obj.put("success", true);
			}else if(!objects[0].toString().equals("false")){
				obj.put("success", true);
				obj.put("msg", objects[0].toString());
			}else{
				obj.put("success", false);
				obj.put("errorMsg", "操作失败！");
			}
		}catch(Exception e){
			e.printStackTrace();
			obj.put("success", false);
			obj.put("errorMsg", e.getMessage());
		}
		return obj.toString();
}

	@RequestMapping("/removeWeldTask")
	@ResponseBody
	public String removeWeldTask(HttpServletRequest request){
		JSONObject obj = new JSONObject();
		try{
			//客户端执行操作
			JaxWsDynamicClientFactory dcf = JaxWsDynamicClientFactory.newInstance();
			Client client = dcf.createClient("http://121.196.222.216:8080/CIWJN_Service/cIWJNWebService?wsdl");
			iutil.Authority(client);
			String obj1 = "{\"CLASSNAME\":\"junctionWebServiceImpl\",\"METHOD\":\"deleteJunction\"}";
			String obj2 = "{\"ID\":\""+request.getParameter("id")+"\",\"INSFID\":\""+request.getParameter("insfid")+"\"}";
			Object[] objects = client.invoke(new QName("http://webservice.ssmcxf.sshome.com/", "enterTheWS"), new Object[]{obj1,obj2});  
			if(objects[0].toString().equals("true")){
				obj.put("success", true);
			}else if(!objects[0].toString().equals("false")){
				obj.put("success", true);
				obj.put("msg", objects[0].toString());
			}else{
				obj.put("success", false);
				obj.put("errorMsg", "操作失败！");
			}
		}catch(Exception e){
			e.printStackTrace();
			obj.put("success", false);
			obj.put("errorMsg", e.getMessage());
		}
		return obj.toString();
}
	
	@RequestMapping("/wjNoValidate")
	@ResponseBody
	private String wjNoValidate(@RequestParam String wjno){
		boolean data = true;
		int count = wjm.getWeldedjunctionByNo(wjno);
		if(count>0){
			data = false;
		}
		return data + "";
	}
	
	@RequestMapping("/getWeldingJun")
	@ResponseBody
	public String getWeldingJun(HttpServletRequest request){
		String time1 = request.getParameter("dtoTime1");
		String time2 = request.getParameter("dtoTime2");
		String parentId = request.getParameter("parent");
		String wjno = request.getParameter("wjno");
		String welderid = request.getParameter("welderid");
		WeldDto dto = new WeldDto();
		if(!iutil.isNull(parentId)){
			//数据权限处理
			BigInteger uid = lm.getUserId(request);
			String afreshLogin = (String)request.getAttribute("afreshLogin");
			if(iutil.isNull(afreshLogin)){
				return "0";
			}
			int types = insm.getUserInsfType(uid);
			if(types==21){
				parentId = insm.getUserInsfId(uid).toString();
			}
		}
		BigInteger parent = null;
		if(iutil.isNull(time1)){
			dto.setDtoTime1(time1);
		}
		if(iutil.isNull(wjno)){
			dto.setSearch(wjno);//用来保存任务编号
		}
		if(iutil.isNull(time2)){
			dto.setDtoTime2(time2);
		}
		if(iutil.isNull(parentId)){
			parent = new BigInteger(parentId);
		}
		pageIndex = Integer.parseInt(request.getParameter("page"));
		pageSize = Integer.parseInt(request.getParameter("rows"));
		
		page = new Page(pageIndex,pageSize,total);
		List<WeldedJunction> list = wjm.getJMByWelder(page, dto ,welderid);
		long total = 0;
		
		if(list != null){
			PageInfo<WeldedJunction> pageinfo = new PageInfo<WeldedJunction>(list);
			total = pageinfo.getTotal();
		}
		
		JSONObject json = new JSONObject();
		JSONArray ary = new JSONArray();
		JSONObject obj = new JSONObject();
		try{
			for(WeldedJunction w:list){
				json.put("firsttime", wjm.getFirsttime(dto, w.getMachid(),welderid , w.getWeldedJunctionno()));
				json.put("lasttime", wjm.getLasttime(dto, w.getMachid(),welderid , w.getWeldedJunctionno()));
				json.put("fweldingtime", new DecimalFormat("0.0000").format((float)Integer.valueOf(w.getCounts().toString())/3600));
				json.put("id", w.getId());
				json.put("machid",w.getMachid());
				json.put("machine_num", w.getMachine_num());
				json.put("weldedJunctionno", w.getWeldedJunctionno().substring(2, 8));
				json.put("dyne", w.getDyne());
				json.put("maxElectricity", w.getMaxElectricity());
				json.put("minElectricity", w.getMinElectricity());
				json.put("maxValtage", w.getMaxValtage());
				json.put("minValtage", w.getMinValtage());
				ary.add(json);
			}
		}catch(Exception e){
			e.printStackTrace();
			e.getMessage();
		}
		obj.put("total", total);
		obj.put("rows", ary);
		return obj.toString();
	}
	@RequestMapping("/getEvaluate")
	@ResponseBody
	public String getEvaluate(HttpServletRequest request){
		JSONObject obj = new JSONObject();
		try{
			MyUser user = (MyUser)SecurityContextHolder.getContext().getAuthentication().getPrincipal();
			//客户端执行操作
			JaxWsDynamicClientFactory dcf = JaxWsDynamicClientFactory.newInstance();
			Client client = dcf.createClient("http://121.196.222.216:8080/CIWJN_Service/cIWJNWebService?wsdl");
			iutil.Authority(client);
			String obj1 = "{\"CLASSNAME\":\"junctionWebServiceImpl\",\"METHOD\":\"giveToServer\"}";
			String obj2 = "{\"TASKNO\":\""+request.getParameter("taskNo")+"\",\"WELDERNO\":\""+request.getParameter("welderNo")+"\",\"MACHINENO\":\""+request.getParameter("machineNo")+"\",\"STATUS\":\""+request.getParameter("operateid")+"\",\"TASKID\":\""+request.getParameter("taskid")+"\",\"WELDERID\":\""+request.getParameter("welderid")+"\",\"MACHINEID\":\""+request.getParameter("machineid")+"\",\"OPERATOR\":\""+user.getId()+"\",\"ID\":\""+request.getParameter("id")+"\",\"RESULT\":\""+request.getParameter("result")+"\",\"RESULTID\":\""+request.getParameter("resultid")+"\"}";
			Object[] objects = client.invoke(new QName("http://webservice.ssmcxf.sshome.com/", "enterTheWS"), new Object[]{obj1,obj2});  
			if(objects[0].toString().equals("true")){
				obj.put("success", true);
			}else if(!objects[0].toString().equals("false")){
				obj.put("success", true);
				obj.put("msg", objects[0].toString());
			}else{
				obj.put("success", false);
				obj.put("errorMsg", "操作失败！");
			}
		}catch(Exception e){
			e.printStackTrace();
			obj.put("success", false);
			obj.put("errorMsg", e.getMessage());
		}
		return obj.toString();
}
}
