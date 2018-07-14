package com.spring.controller;

import java.awt.Robot;
import java.io.BufferedReader;
import java.io.DataInputStream;
import java.io.DataOutputStream;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.math.BigInteger;
import java.net.InetSocketAddress;
import java.net.Socket;
import java.net.SocketAddress;
import java.nio.channels.SocketChannel;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.github.pagehelper.PageInfo;
import com.spring.model.MyUser;
import com.spring.model.Td;
import com.spring.model.User;
import com.spring.model.Wps;
import com.spring.page.Page;
import com.spring.service.TdService;
import com.spring.service.WpsService;
import com.spring.util.IsnullUtil;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

@Controller
@RequestMapping(value = "/wps",produces = { "text/json;charset=UTF-8" })
public class WpsController {
	
	private Page page;
	private int pageIndex = 1;
	private int pageSize = 10;
	private int total = 0;
	private String wpsfid;
	private String wpspre;
	@Autowired
	private WpsService wpsService;
	@Autowired
	private TdService tdService;
	
    public static final String IP_ADDR = "121.196.222.216";//服务器地址   
    public static final int PORT = 5555;//服务器端口号  
	
	IsnullUtil iutil = new IsnullUtil();
	private SocketChannel socketChannel;
	private String strdata;
	
	/**
	 * 获取所有用户列表
	 * @param request
	 * @return
	 */
	
	@RequestMapping("/AllWps")
	public String AllUser(HttpServletRequest request){
		return "weldwps/allWps";
	}
	
	@RequestMapping("/AllSpe")
	public String AllSpe(HttpServletRequest request){
		return "specification/allSpe";
	}

	@RequestMapping("/getAllWps")
	@ResponseBody
	public String getAllWps(HttpServletRequest request){
		pageIndex = Integer.parseInt(request.getParameter("page"));
		pageSize = Integer.parseInt(request.getParameter("rows"));
		String search = request.getParameter("searchStr");
		String parentId = request.getParameter("parent");
		BigInteger parent = null;
		if(iutil.isNull(parentId)){
			parent = new BigInteger(parentId);
		}
		page = new Page(pageIndex,pageSize,total);
		List<Wps> findAll = wpsService.findAll(page,parent,search);
		long total = 0;
		
		if(findAll != null){
			PageInfo<Wps> pageinfo = new PageInfo<Wps>(findAll);
			total = pageinfo.getTotal();
		}

		request.setAttribute("wpsList", findAll);
		JSONObject json = new JSONObject();
		JSONArray ary = new JSONArray();
		JSONObject obj = new JSONObject();
		try{
			for(Wps wps:findAll){
				String creat = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss").format(wps.getFcreatedate());
				String update = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss").format(wps.getFupdatedate());
				json.put("FID", wps.getFid());
				json.put("FWPSNum", wps.getFwpsnum());
				json.put("Fweld_I", wps.getFweld_i());
				json.put("Fweld_V", wps.getFweld_v());
				json.put("Fweld_I_MAX",wps.getFweld_i_max());
				json.put("Fweld_I_MIN", wps.getFweld_i_min());
				json.put("Fweld_V_MAX", wps.getFweld_v_max());
				json.put("Fweld_V_MIN", wps.getFweld_v_min());
				json.put("Fweld_Alter_I", wps.getFweld_alter_i());
				json.put("Fweld_Alter_V", wps.getFweld_alter_v());
				json.put("Fweld_PreChannel", wps.getFweld_prechannel());
				json.put("FCReateDate",creat);
				json.put("FUpdateDate", update);
				json.put("Fowner",wps.getInsname());
				json.put("insid",wps.getInsid());
				json.put("Fback", wps.getFback());
				json.put("Fname", wps.getFname());
				json.put("Fdiameter", wps.getFdiameter());
				ary.add(json);
			}
		}catch(Exception e){
			e.getMessage();
		}
		obj.put("total", total);
		obj.put("rows", ary);
		return obj.toString();
	}
	
	@RequestMapping("/getAllSpe")
	@ResponseBody
	public String getAllSpe(HttpServletRequest request){
		BigInteger machine = new BigInteger(request.getParameter("machine"));
		BigInteger chanel = new BigInteger(request.getParameter("chanel"));
		List<Wps> findAll = wpsService.findAllSpe(machine,chanel);

		request.setAttribute("wpsList", findAll);
		JSONObject json = new JSONObject();
		JSONArray ary = new JSONArray();
		JSONObject obj = new JSONObject();
		try{
			/*if(findAll.size()==0){
				json.put("FWPSNum", 1);//通道号
				json.put("Fweld_I", 62);//初期条件
				json.put("Fweld_V", 62);//溶孔深度
				json.put("Fweld_I_MAX",102);//一元个别
				json.put("Fweld_I_MIN", 111);//收弧模式
				json.put("Fweld_V_MAX", 0);//电弧特性
				json.put("Fweld_V_MIN", 0);//模式
				json.put("Fweld_Alter_I", 91);//材料
				json.put("Fweld_Alter_V", 121);//气体
				json.put("Fweld_PreChannel", 132);//半径
				json.put("ftime", 30.0);
				json.put("fadvance", 1.0);
				json.put("fhysteresis", 1.0);
				json.put("fini_ele", 100.0);//初期电流
				json.put("fweld_ele", 100.0);//焊接电流
				json.put("farc_ele", 100.0);//收弧电流
				json.put("fweld_tuny_ele", 0.0);//焊接微调电流
				json.put("fweld_tuny_vol", 0.0);//焊接微调电压
				json.put("farc_tuny_ele", 0.0);//收弧微调电流
				if(Integer.valueOf(cla.toString())==102){
					json.put("fini_vol", 19.0);//初期电压
					json.put("fweld_vol", 19.0);//焊接电压
					json.put("farc_vol", 19.0);//收弧电压
					json.put("fweld_tuny_vol", 0.0);//焊接微调电压
					json.put("Fdiameter", 0.0);//收弧微调电压
				}else{
					json.put("fini_vol", 0.0);//初期电压
					json.put("fweld_vol", 0.0);//焊接电压
					json.put("farc_vol", 0.0);//收弧电压
					json.put("fweld_tuny_vol", 0.0);//焊接微调电压
					json.put("Fdiameter", 0.0);//收弧微调电压
				}
				ary.add(json);
			}else{*/
			for(Wps wps:findAll){
				json.put("FID", wps.getFid());
				json.put("FWPSNum", wps.getWelderid());
				json.put("Fweld_I", wps.getFinitial());
				json.put("Fweld_V", wps.getFcontroller());
				json.put("Fweld_I_MAX",wps.getInsname());
				json.put("Fweld_I_MIN", wps.getWeldername());
				json.put("Fweld_V_MAX", wps.getFweld_v_max());
				json.put("Fweld_V_MIN", wps.getFmode());
				json.put("Fweld_Alter_I", wps.getUpdatename());
				json.put("Fweld_Alter_V", wps.getFback());
				json.put("Fweld_PreChannel", wps.getFname());
				json.put("ftime", wps.getFtime());
				json.put("fadvance", wps.getFadvance());
				json.put("fhysteresis", wps.getFhysteresis());
				json.put("fini_ele", wps.getFini_ele());
				json.put("fini_vol", wps.getFini_vol());
				json.put("fini_vol1", wps.getFini_vol1());
				json.put("fweld_ele", wps.getFweld_ele());
				json.put("fweld_vol", wps.getFweld_vol());
				json.put("fweld_vol1", wps.getFweld_vol1());
				json.put("farc_ele", wps.getFarc_ele());
				json.put("farc_vol", wps.getFarc_vol());
				json.put("farc_vol1", wps.getFarc_vol1());
				json.put("fweld_tuny_ele", wps.getFweld_tuny_ele());
				json.put("fweld_tuny_vol", wps.getFweld_tuny_vol());
				json.put("farc_tuny_ele", wps.getFarc_tuny_ele());
				json.put("Fdiameter", wps.getFdiameter());
				ary.add(json);
			}
		}catch(Exception e){
			e.getMessage();
		}
		obj.put("rows", ary);
		return obj.toString();
	}
	
	@RequestMapping("/Spe")
	@ResponseBody
	public String Spe(HttpServletRequest request){
		BigInteger machine = new BigInteger(request.getParameter("machine"));
		String ch = request.getParameter("chanel");
		List<Wps> findAll = wpsService.AllSpe(machine,ch);
		JSONObject json = new JSONObject();
		JSONArray ary = new JSONArray();
		JSONObject obj = new JSONObject();
		try{
			for(Wps wps:findAll){
				json.put("FID", wps.getFid());
				json.put("FWPSNum", wps.getWelderid());
				json.put("Fweld_I", wps.getFinitial());
				json.put("Fweld_V", wps.getFcontroller());
				json.put("Fweld_I_MAX",wps.getInsname());
				json.put("Fweld_I_MIN", wps.getWeldername());
				json.put("Fweld_V_MAX", wps.getFweld_v_max());
				json.put("Fweld_V_MIN", wps.getFmode());
				json.put("Fweld_Alter_I", wps.getUpdatename());
				json.put("Fweld_Alter_V", wps.getFback());
				json.put("Fweld_PreChannel", wps.getFname());
				json.put("ftime", wps.getFtime());
				json.put("fadvance", wps.getFadvance());
				json.put("fhysteresis", wps.getFhysteresis());
				json.put("fini_ele", wps.getFini_ele());
				json.put("fini_vol", wps.getFini_vol());
				json.put("fini_vol1", wps.getFini_vol1());
				json.put("fweld_ele", wps.getFweld_ele());
				json.put("fweld_vol", wps.getFweld_vol());
				json.put("fweld_vol1", wps.getFweld_vol1());
				json.put("farc_ele", wps.getFarc_ele());
				json.put("farc_vol", wps.getFarc_vol());
				json.put("farc_vol1", wps.getFarc_vol1());
				json.put("fweld_tuny_ele", wps.getFweld_tuny_ele());
				json.put("fweld_tuny_vol", wps.getFweld_tuny_vol());
				json.put("farc_tuny_ele", wps.getFarc_tuny_ele());
				json.put("Fdiameter", wps.getFdiameter());
				ary.add(json);
			}
		}catch(Exception e){
			e.getMessage();
		}
		obj.put("rows", ary);
		return obj.toString();
	}
	
	@RequestMapping("/toAddWps")
	public String toAddUser(HttpServletRequest request){
		return "weldwps/addWps";
	}
	
	@RequestMapping("/toAddSpe")
	public String toAddSpe(HttpServletRequest request){
		return "specification/addSpe";
	}
	
	
	@RequestMapping("/toUpdateWps")
	public String toUpdateWps(@RequestParam BigInteger fid,HttpServletRequest request){
		Wps wps = wpsService.findById(fid);
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		request.setAttribute("wps", wps);
		request.setAttribute("update", sdf.format(wps.getFupdatedate()));
		request.setAttribute("create", sdf.format(wps.getFcreatedate()));
		return "weldwps/editWps";
	}
	
	@RequestMapping("/toUpdateSpe")
	public String toUpdateSpe(@RequestParam BigInteger fid,HttpServletRequest request){
		Wps wps = wpsService.findSpeById(fid);
		request.setAttribute("wps", wps);
		return "specification/editSpe";
	}
	
	@RequestMapping("/toDestroyWps")
	public String toDestroyWps(@RequestParam BigInteger fid,HttpServletRequest request){
		Wps wps = wpsService.findById(fid);
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		request.setAttribute("wps", wps);
		request.setAttribute("update", sdf.format(wps.getFupdatedate()));
		request.setAttribute("create", sdf.format(wps.getFcreatedate()));
		return "weldwps/destroyWps";
	}
	
	@RequestMapping("/toDestroySpe")
	public String toDestroySpe(@RequestParam BigInteger fid,HttpServletRequest request){
		Wps wps = wpsService.findSpeById(fid);
		request.setAttribute("wps", wps);
		return "specification/destroySpe";
	}
	
	@RequestMapping("/apSpe")
	@ResponseBody
	public String apSpe(HttpServletRequest request){
		Wps wps = new Wps();
		MyUser myuser = (MyUser) SecurityContextHolder.getContext()  
			    .getAuthentication()  
			    .getPrincipal();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		JSONObject obj = new JSONObject();
		Integer finitial = Integer.valueOf(request.getParameter("finitial"));
		Integer fcontroller = Integer.valueOf(request.getParameter("fcontroller"));
		Integer fmode = Integer.valueOf(request.getParameter("fmode"));
		Integer fselect = Integer.valueOf(request.getParameter("fselect"));
		Integer farc = Integer.valueOf(request.getParameter("farc"));
		Integer fmaterial = Integer.valueOf(request.getParameter("fmaterial"));
		Integer fgas = Integer.valueOf(request.getParameter("fgas"));
		BigInteger fdiameter = new BigInteger(request.getParameter("fdiameter"));
		Integer chanel = Integer.valueOf(request.getParameter("chanel"));
		double ftime = Double.valueOf(request.getParameter("ftime"));
		double fadvance = Double.valueOf(request.getParameter("fadvance"));
		double fini_ele = Double.valueOf(request.getParameter("fini_ele"));
		double fweld_ele = Double.valueOf(request.getParameter("fweld_ele"));
		double farc_ele = Double.valueOf(request.getParameter("farc_ele"));
		double fhysteresis = Double.valueOf(request.getParameter("fhysteresis"));
		int fcharacter = Integer.valueOf(request.getParameter("fcharacter"));
		double fweld_tuny_ele = Double.valueOf(request.getParameter("fweld_tuny_ele"));
		double farc_tuny_ele = Double.valueOf(request.getParameter("farc_tuny_ele"));
		double fini_vol = Double.valueOf(request.getParameter("fini_vol"));
		double fweld_vol = Double.valueOf(request.getParameter("fweld_vol"));
		double farc_vol = Double.valueOf(request.getParameter("farc_vol"));
		double fini_vol1 = Double.valueOf(request.getParameter("fini_vol1"));
		double fweld_vol1 = Double.valueOf(request.getParameter("fweld_vol1"));
		double farc_vol1 = Double.valueOf(request.getParameter("farc_vol1"));
		double fweld_tuny_vol = Double.valueOf(request.getParameter("fweld_tuny_vol"));
		double farc_tuny_vol = Double.valueOf(request.getParameter("farc_tuny_vol"));
		BigInteger machine=new BigInteger(request.getParameter("machine"));
		try{
			wps.setFweld_i_max(chanel);
			wps.setFweld_i_min(finitial);
			wps.setFweld_alter_i(fcontroller);
			wps.setFweld_v_min(fmode);
			wps.setFweld_i(fselect);
			wps.setFweld_v(farc);
			wps.setFweld_v_max(fcharacter);
			wps.setFweld_prechannel(fmaterial);
			wps.setFweld_alter_v(fgas);
			wps.setInsid(fdiameter);
			wps.setFtime(ftime);
			wps.setFadvance(fadvance);
			wps.setFhysteresis(fhysteresis);
			wps.setFini_ele(fini_ele);
			wps.setFini_vol(fini_vol);
			wps.setFini_vol(fini_vol1);
			wps.setFweld_ele(fweld_ele);
			wps.setFweld_vol(fweld_vol);
			wps.setFweld_vol(fweld_vol1);
			wps.setFarc_ele(farc_ele);
			wps.setFarc_vol(farc_vol);
			wps.setFarc_vol(farc_vol1);
			wps.setFweld_tuny_ele(fweld_tuny_ele);
			wps.setFweld_tuny_vol(fweld_tuny_vol);
			wps.setFarc_tuny_ele(farc_tuny_ele);
			wps.setFdiameter(farc_tuny_vol);
			wps.setMacid(machine);
			wps.setFcreater(myuser.getId());
			wps.setFupdater(myuser.getId());
			if(wpsService.findCount(machine,chanel.toString())<=0){
				wpsService.saveSpe(wps);
			}else{
				wpsService.updateSpe(wps);
			}
			obj.put("success", true);
		}catch(Exception e){
			obj.put("success", false);
			obj.put("errorMsg", e.getMessage());
		}
		return obj.toString();
/*		return "redirect:/user/AllUser";*/
	}
	
	@RequestMapping("/saveCopy")
	@ResponseBody
	public String saveCopy(HttpServletRequest request){
		Wps wps = new Wps();
		MyUser myuser = (MyUser) SecurityContextHolder.getContext()  
			    .getAuthentication()  
			    .getPrincipal();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		JSONObject obj = new JSONObject();
		String ch = request.getParameter("chanel");
		String str = request.getParameter("str");
		BigInteger mac = new BigInteger(request.getParameter("mac"));
		List<Wps> findAll = wpsService.findSpe(mac,ch);
		try{
	        if(null!=str&&""!=str){
	        String[] ss = str.split(",");
	        for (int i = 0; i < ss.length; i++) {
			for(Wps spe:findAll){
			if(wpsService.findCount(new BigInteger(ss[i]),String.valueOf(spe.getFweld_i_max()))<=0){
				spe.setMacid(new BigInteger(ss[i]));
				spe.setFcreater(myuser.getId());
				spe.setFupdater(myuser.getId());
				wpsService.saveSpe(spe);
			}else{
				spe.setMacid(new BigInteger(ss[i]));
				spe.setFupdater(myuser.getId());
				wpsService.updateSpe(spe);
			}
			}
	        }
	        }
			obj.put("success", true);
		}catch(Exception e){
			obj.put("success", false);
			obj.put("errorMsg", e.getMessage());
		}
		return obj.toString();
/*		return "redirect:/user/AllUser";*/
	}
	
	@RequestMapping("/findCount")
	@ResponseBody
	public String findCount(HttpServletRequest request){
		Wps wps = new Wps();
		JSONObject json = new JSONObject();
		JSONArray ary = new JSONArray();
		JSONObject obj = new JSONObject();
		String ch = request.getParameter("chanel");
		String str = request.getParameter("str");
		BigInteger mac = new BigInteger(request.getParameter("mac"));
		try{
			int co;
			if(null!=ch&&""!=ch){
				co=1;
			}else{
				co = wpsService.findCount(mac,ch);
			}
			BigInteger parent = null;
			List<Td> getAP = tdService.getAllPosition(parent);
			for(Td td:getAP){
	        if(null!=str&&""!=str){
	        String[] ss = str.split(",");
	        for (int i = 0; i < ss.length; i++) {
	        	if(td.getId()==Long.valueOf(ss[i])){
				json.put("machineid", td.getFequipment_no());
				json.put("insname", td.getFcn());
				json.put("num", "1-"+co);
				json.put("readynum", 0);
				ary.add(json);
	        	}
	        }
	        }
		}
			obj.put("success", true);
		}catch(Exception e){
			obj.put("success", false);
			obj.put("errorMsg", e.getMessage());
		}
		obj.put("rows", ary);
		return obj.toString();
/*		return "redirect:/user/AllUser";*/
	}
	
	@RequestMapping("/addWps")
	@ResponseBody
	public String addUser(HttpServletRequest request){
		Wps wps = new Wps();
		MyUser myuser = (MyUser) SecurityContextHolder.getContext()  
			    .getAuthentication()  
			    .getPrincipal();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		JSONObject obj = new JSONObject();
		try{
	        wps.setFinitial(request.getParameter("finitial"));
	        wps.setFcontroller(request.getParameter("fcontroller"));

			wps.setFcreater(myuser.getId());
			wps.setFupdater(myuser.getId());
			wps.setFowner(Long.parseLong(request.getParameter("ins")));
			wps.setFcreatedate(sdf.parse(sdf.format((new Date()).getTime())));
			wps.setFupdatedate(sdf.parse(sdf.format((new Date()).getTime())));
			wpsService.save(wps);
			obj.put("success", true);
		}catch(Exception e){
			obj.put("success", false);
			obj.put("errorMsg", e.getMessage());
		}
		return obj.toString();
/*		return "redirect:/user/AllUser";*/
	}
	
	@RequestMapping("/updateWps")
	@ResponseBody
	public String updateWps(Wps wps,HttpServletRequest request){
		MyUser myuser = (MyUser) SecurityContextHolder.getContext()  
			    .getAuthentication()  
			    .getPrincipal();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		JSONObject obj = new JSONObject();
		try{
			wps.setFid(Long.parseLong(request.getParameter("FID")));
			wps.setFupdater(myuser.getId());
	        wps.setFowner(Long.parseLong(request.getParameter("ins")));
//	        wps.setFcreatedate(sdf.parse(request.getParameter("FCReateDate")));
	        wps.setFwpsnum(request.getParameter("FWPSNum"));
	        wps.setFweld_i( Integer.parseInt(request.getParameter("Fweld_I")));
	        wps.setFweld_v( Integer.parseInt(request.getParameter("Fweld_V")));
	        wps.setFweld_i_max(Integer.parseInt(request.getParameter("Fweld_I_MAX")));
	        wps.setFweld_i_min(Integer.parseInt(request.getParameter("Fweld_I_MIN")));
	        wps.setFweld_v_max(Integer.parseInt(request.getParameter("Fweld_V_MAX")));
	        wps.setFweld_v_min(Integer.parseInt(request.getParameter("Fweld_V_MIN")));
	        wps.setFweld_alter_i(Integer.parseInt(request.getParameter("Fweld_Alter_I")));
	        wps.setFweld_alter_v(Integer.parseInt(request.getParameter("Fweld_Alter_V")));
	        wps.setFweld_prechannel(Integer.parseInt(request.getParameter("Fweld_PreChannel")));
	        wps.setFupdatedate(sdf.parse(sdf.format((new Date()).getTime())));
	        wps.setFback(request.getParameter("Fback"));
	        wps.setFname(request.getParameter("Fname"));
	        wps.setFdiameter(Double.valueOf(request.getParameter("Fdiameter")));
		    wpsService.update(wps);
			obj.put("success", true);
			}catch(Exception e){
				obj.put("success", false);
				obj.put("errorMsg", e.getMessage());
			}
			return obj.toString();

	}
	
	@RequestMapping("/destroyWps")
	@ResponseBody
	public String destroyWps(@RequestParam BigInteger fid){

			JSONObject obj = new JSONObject();
			try{
				wpsService.delete(fid);
				wpsService.deleteHistory(fid);
				 obj.put("success", true);
			}catch(Exception e){
				obj.put("success", false);
				obj.put("errorMsg", e.getMessage());
			}
			return obj.toString();
	}
	
	@RequestMapping("/wpsvalidate")
	@ResponseBody
	private String wpsvalidate(@RequestParam String fwpsnum){
		boolean data = true;
		int count = wpsService.getUsernameCount(fwpsnum);
		if(count>0){
			data = false;
		}
		return data + "";
	}
	
	@RequestMapping("/selectwps")
	public String selectwps(HttpServletRequest request){
		return "weldwps/selectWps";
	}
	
	@RequestMapping("/selectmachine")
	public String selectmachine(HttpServletRequest request){
		 wpsfid = request.getParameter("fid");
		 wpspre = request.getParameter("pre");
		return "weldwps/selectMachine";
	}
	
	@RequestMapping("/giveWM")
	@ResponseBody
	public String giveWM(HttpServletRequest request){
		Wps wps = new Wps();
		Socket socket = null;
		MyUser myuser = (MyUser) SecurityContextHolder.getContext()  
			    .getAuthentication()  
			    .getPrincipal();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String[] wfid = wpsfid.split(",");
		String[] wpre = wpspre.split(",");
		String mid = request.getParameter("mid");
		String[] mmid = mid.split(",");
		JSONObject obj = new JSONObject();
		JSONObject json = new JSONObject();
		JSONArray ary = new JSONArray();
		JSONObject json1 = new JSONObject();
		JSONArray ary1 = new JSONArray();
		try{
/*            if(socketChannel==null){
            socketChannel = SocketChannel.open(); 
              SocketAddress socketAddress = new InetSocketAddress(IP_ADDR, 5555);    
               socketChannel.connect(socketAddress);
          }*/
			for(int i=0;i<wfid.length;i++){
				wps.setFid(Long.parseLong(wfid[i]));
		        wps.setFweld_prechannel(Integer.parseInt(wpre[i]));
				wps.setFcreater(myuser.getId());
				wps.setFupdater(myuser.getId());
				wps.setInsid(wpsService.findByUid(myuser.getId()));
				wps.setFcreatedate(sdf.parse(sdf.format((new Date()).getTime())));
				wps.setFupdatedate(sdf.parse(sdf.format((new Date()).getTime())));
				for(int j=0;j<mmid.length;j++){
					wps.setMacid(new BigInteger(mmid[j]));
					/*wpsService.give(wps);*/
				}
			}
			try {
         			for(int ii=0;ii<wfid.length;ii++){
        				for(int jj=0;jj<mmid.length;jj++){
            				Wps w = wpsService.findById(new BigInteger(wfid[ii]));
            				int weld_i=w.getFweld_i();
            				int weld_v=w.getFweld_v()*10;
            				int weld_i_tx = (w.getFweld_i_max()-w.getFweld_i_min())/2;
            				int weld_v_tx = (w.getFweld_v_max()-w.getFweld_v_min())/2*10;
            				int pre = w.getFweld_prechannel();
            				String str1;
            				if(pre<16){
            					str1 = "7E7C205201010"+Integer.toHexString(pre);
            				}else{
            					str1 = "7E7C20520101"+Integer.toHexString(pre);
            				}
            				String gather_no = wpsService.findIpById(new BigInteger(mmid[jj]));
							//String str1 = "7E7C20521301";
							//01通道
							String str2;
							String str22;
							String str3;
							String str4;
							if(w.getFweld_i()<16){
							str2 = "7C201E7C20017C20647C20BEFFE27C207C20"+"0"+Integer.toHexString(weld_i);
							}else if(w.getFweld_i()>=16&&w.getFweld_i()<256){
							str2 = "7C201E7C20017C20647C20BEFFE27C207C20" + Integer.toHexString(weld_i);
							}else if(w.getFweld_i()==256){
							str2 = "7C201E7C20017C20647C20BEFFE27C2001" + "7C20";
							}else{
							str2 = "7C201E7C20017C20647C20BEFFE27C200" + Integer.toHexString(weld_i);
							}
							if(weld_v<16){
								str22="7C200"+Integer.toHexString(weld_v);
							}else if(weld_v>=16&&weld_v<256){
								str22="7C20"+Integer.toHexString(weld_v);
							}else if(weld_v==256){
								str22="01"+"7C20";
							}else{
								str22="0"+Integer.toHexString(weld_v);
							}
							if(weld_i_tx==0){
								str3 = "7C207C20647C20BE7C207C207C20017C207C207C200C7C207C207C207C20"+"7C20"+"7C20";
							}else if(weld_i_tx>0&&weld_i_tx<16){
								str3 = "7C207C20647C20BE7C207C207C20017C207C207C200C7C207C207C207C20"+"0"+Integer.toHexString(weld_i_tx)+"0"+Integer.toHexString(weld_i_tx);
							}else{
								str3 = "7C207C20647C20BE7C207C207C20017C207C207C200C7C207C207C207C20"+Integer.toHexString(weld_i_tx)+Integer.toHexString(weld_i_tx);
							}
							if(weld_v_tx==0){
								str4="7C20"+"7C20"+"017D";
							}else if(weld_v_tx>0&&weld_v_tx<16){
								str4="0"+Integer.toHexString(weld_v_tx)+"0"+Integer.toHexString(weld_v_tx)+"017D";
							}else{
								str4=Integer.toHexString(weld_v_tx)+Integer.toHexString(weld_v_tx)+"017D";
							}
							//C8 //电流
							//012C//电压
//							String str3 = "7C207C207C20647C20BE7C207C207C200A7C207C207C200A7C207C207C20";
							//1E//微调电流
							//32//微调电压
//							String str4 = "2C7D";
							String test;
/*							if(weld_v<16){
								if(weld_v_tx<16){
									if(weld_i_tx<16){
										test =str1+Integer.toHexString(pre)+str2+Integer.toHexString(weld_i)+"7C200"+Integer.toHexString(weld_v)+str3+"0"+Integer.toHexString(weld_i_tx)+"0"+Integer.toHexString(weld_i_tx)+"0"+Integer.toHexString(weld_v_tx)+"0"+Integer.toHexString(weld_v_tx)+str4;
									}else if(weld_i_tx==0){
										test =str1+Integer.toHexString(pre)+str2+Integer.toHexString(weld_i)+"7C200"+Integer.toHexString(weld_v)+str3+"7C20"+"7C20"+"0"+Integer.toHexString(weld_v_tx)+"0"+Integer.toHexString(weld_v_tx)+str4;
									}
									else{
										test =str1+Integer.toHexString(pre)+str2+Integer.toHexString(weld_i)+"7C200"+Integer.toHexString(weld_v)+str3+Integer.toHexString(weld_i_tx)+Integer.toHexString(weld_i_tx)+Integer.toHexString(weld_v_tx)+Integer.toHexString(weld_v_tx)+str4;
									}
								}else if(weld_v_tx==0){
									if(weld_i_tx<16){
										test =str1+Integer.toHexString(pre)+str2+Integer.toHexString(weld_i)+"7C200"+Integer.toHexString(weld_v)+str3+"0"+Integer.toHexString(weld_i_tx)+"0"+Integer.toHexString(weld_i_tx)+"7C20"+"7C20"+str4;
									}else if(weld_i_tx==0){
										test =str1+Integer.toHexString(pre)+str2+Integer.toHexString(weld_i)+"7C200"+Integer.toHexString(weld_v)+str3+"7C20"+"7C20"+"7C20"+"7C20"+str4;
									}
									else{
										test =str1+Integer.toHexString(pre)+str2+Integer.toHexString(weld_i)+"7C200"+Integer.toHexString(weld_v)+str3+Integer.toHexString(weld_i_tx)+Integer.toHexString(weld_i_tx)+Integer.toHexString(weld_v_tx)+Integer.toHexString(weld_v_tx)+str4;
									}
								}else{
									if(weld_i_tx<16){
										test =str1+Integer.toHexString(pre)+str2+Integer.toHexString(weld_i)+"7C200"+Integer.toHexString(weld_v)+str3+"0"+Integer.toHexString(weld_i_tx)+"0"+Integer.toHexString(weld_i_tx)+Integer.toHexString(weld_v_tx)+Integer.toHexString(weld_v_tx)+str4;
									}else if(weld_i_tx==0){
										test =str1+Integer.toHexString(pre)+str2+Integer.toHexString(weld_i)+"7C200"+Integer.toHexString(weld_v)+str3+"7C20"+"7C20"+Integer.toHexString(weld_i_tx)+Integer.toHexString(weld_v_tx)+Integer.toHexString(weld_v_tx)+str4;
									}else{
										test =str1+Integer.toHexString(pre)+str2+Integer.toHexString(weld_i)+"7C200"+Integer.toHexString(weld_v)+str3+Integer.toHexString(weld_i_tx)+Integer.toHexString(weld_i_tx)+Integer.toHexString(weld_v_tx)+Integer.toHexString(weld_v_tx)+str4;
									}
									}
							}else{
								if(weld_v_tx<256){
								test =str1+Integer.toHexString(pre)+str2+Integer.toHexString(weld_i)+"0"+Integer.toHexString(weld_v)+str3+Integer.toHexString(weld_i_tx)+Integer.toHexString(weld_i_tx)+Integer.toHexString(weld_v_tx)+Integer.toHexString(weld_v_tx)+str4;
								}else if(weld_v_tx>=256){
									test =str1+Integer.toHexString(pre)+str2+Integer.toHexString(weld_i)+"0"+Integer.toHexString(weld_v)+str3+Integer.toHexString(weld_i_tx)+Integer.toHexString(weld_i_tx)+Integer.toHexString(weld_v_tx)+Integer.toHexString(weld_v_tx)+str4;
								}else{
									test =str1+Integer.toHexString(pre)+str2+Integer.toHexString(weld_i)+"0"+Integer.toHexString(weld_v)+str3+Integer.toHexString(weld_i_tx)+Integer.toHexString(weld_i_tx)+Integer.toHexString(weld_v_tx)+Integer.toHexString(weld_v_tx)+str4;
								}
								}*/
							test=str1+str2+str22+str3+str4;
							String ch=test.substring(2,test.length()-4);
							String strdata2=ch.replaceAll("7C20", "00");
		                    String strdata3=strdata2.replaceAll("7C5E", "7E");
		                    String strdata4=strdata3.replaceAll("7C5C", "7C");
		                    strdata =strdata4.replaceAll("7C5D", "7D");
		                    int check = 0;
		                    byte[] data1=new byte[strdata.length()/2];
							for (int i = 0; i < data1.length; i++)
							{
								String tstr1=strdata.substring(i*2, i*2+2);
								Integer k=Integer.valueOf(tstr1, 16);
								check += k;
							}
	       
							String checksend = Integer.toHexString(check);
							checksend = checksend.substring(1,3);
							checksend = checksend.toUpperCase();
							test=ch+checksend;

		                    strdata="7E"+test+"7D";
		                    strdata=strdata.toUpperCase();
//		                    strdata="7E7C20521301027C201E7C200A7C20647C20BE7C207C207C20FA7C20FA7C207C207C20647C20BE7C207C207C200A7C207C207C200A7C207C207C201E327C207C202C7D";
//		                    strdata="7E7C20521301027C201E7C200A7C20647C20BE7C207C207C20FA7C20FA7C207C207C20647C20BE7C207C207C200A7C207C207C200A7C207C207C201E327C207C202C7D";
		                    
/*		                    try {  
		                    	byte[] strbyte=new byte[strdata.length()/2];
		                    	  
		                        for (int i = 0; i < strbyte.length; i++)
		                        {
		                          String tstr1=strdata.substring(i*2, i*2+2);
		                          Integer k=Integer.valueOf(tstr1, 16);
		                          strbyte[i]=(byte)k.byteValue();
		                        }
		                        
		                        socketChannel.write(ByteBuffer.wrap(strbyte));  
		                        
		                    } catch (IOException e) {  
		                        // TODO Auto-generated catch block   
		                  	  	socketChannel = null;
		                        e.printStackTrace();  
		                    }  */
					         Robot  r1   =   new   Robot();
					         r1.delay(400);
        				}
        			}

                  /*String msg = SendAndReceiveUtil.receiveData(socketChannel);    
                  if(msg != null) 
                    System.out.println(msg);*/
              } catch (Exception ex) { 
                  ex.printStackTrace();  
              } /*finally {    
                  try {            
                      socketChannel.close();    
                  } catch(Exception ex) {  
                      ex.printStackTrace();  
                  }    
              }*/

			/*socket = new Socket(IP_ADDR, PORT);
			String gy = ary.toString();
			String hj = ary1.toString();
			byte[] mainwps = gy.getBytes();
			byte[] machine = hj.getBytes();

			InputStream input = socket.getInputStream();    
            //向服务器端发送数据    
            OutputStream out = socket.getOutputStream();   
            String test = "7E0156136A7D";
            byte[] datas1  = new byte[2048];
            byte[] te = new byte[test.length()/2];
            for (int i = 0; i < test.length()/2; i++)
            {
              String tstr1=test.substring(i*2, i*2+2);
              Integer k=Integer.valueOf(tstr1,16);
              te[i]=(byte)k.byteValue();
            }
            out.write(te);*/
            
            /*7E015213017C207C201E7C200A7C20647C20BE7C
			207C207C20647C20BE7C207C207C20647C20BE7C
			207C207C200A7C207C207C200A7C207C207C201E
			327C207C20597D*/            
            
            
/*            out.write(mainwps);
            out.write(machine);*/
            
/*            socket.getInputStream().read(datas1);
            String str = "";
            int linecount=0;
            int zerocount=0;
            for(int i1=0;i1<datas1.length;i1++){
              //判断为数字还是字母，若为字母+256取正数
              if(datas1[i1]<0){
                String r = Integer.toHexString(datas1[i1]+256);
                String rr=r.toUpperCase();
                  //数字补为两位数
                  if(rr.length()==1){
                  rr='0'+rr;
                  }
                  //strdata为总接收数据
                str += rr;
              }
              else{
                String r = Integer.toHexString(datas1[i1]);

                  if(r.length()==1)
                  r='0'+r;
                  r=r.toUpperCase();
                str+=r;  
              }
              linecount+=2;
              //去掉后面的0
              if(datas1[i1]==0){
                zerocount++;
                if(zerocount>25){
                  str=str.substring(0, linecount-52);
                  break;
                }  
              }else{
                zerocount=0;
              }
            }*/
			obj.put("success", true);
			obj.put("fsdata",strdata);
		}catch(Exception e){
			e.printStackTrace();
			obj.put("success", false);
			obj.put("errorMsg", e.getMessage());
		}
		return obj.toString();
/*		return "redirect:/user/AllUser";*/
	}
	
	@RequestMapping("/findHistory")
	@ResponseBody
	public String findHistory(HttpServletRequest request){
		pageIndex = Integer.parseInt(request.getParameter("page"));
		pageSize = Integer.parseInt(request.getParameter("rows"));
		String parentId = request.getParameter("parent");
		BigInteger parent = null;
		if(iutil.isNull(parentId)){
			parent = new BigInteger(parentId);
		}
		page = new Page(pageIndex,pageSize,total);
		JSONObject json = new JSONObject();
		JSONArray ary = new JSONArray();
		JSONObject obj = new JSONObject();
		page = new Page(pageIndex,pageSize,total);
		List<Wps> findHistory = wpsService.findHistory(page,parent);
		long total = 0;	
		if(findHistory != null){
			PageInfo<Wps> pageinfo = new PageInfo<Wps>(findHistory);
			total = pageinfo.getTotal();
		}
		try{
			for(Wps wps:findHistory){
				json.put("FWPSNum", wps.getFwpsnum());
				json.put("Fweld_PreChannel", wps.getFweld_prechannel());
				json.put("FCReateDate",new SimpleDateFormat("yyyy-MM-dd hh:mm:ss").format(wps.getFcreatedate()));
				json.put("Fname", wps.getFname());
				ary.add(json);
			}
		}catch(Exception e){
			e.getMessage();
		}
		obj.put("total", total);
		obj.put("rows", ary);
		return obj.toString();
/*		return "redirect:/user/AllUser";*/
	}
}