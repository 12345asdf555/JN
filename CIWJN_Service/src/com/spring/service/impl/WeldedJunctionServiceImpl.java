package com.spring.service.impl;

import java.math.BigInteger;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.alibaba.fastjson.JSON;
import com.spring.dao.WeldedJunctionMapper;
import com.spring.dto.JudgeUtil;
import com.spring.model.Insframework;
import com.spring.model.WeldedJunction;
import com.spring.service.WeldedJunctionService;

import io.netty.channel.socket.SocketChannel;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
@Transactional
@Service
public class WeldedJunctionServiceImpl implements WeldedJunctionService {
	@Autowired
	private WeldedJunctionMapper wjm;
	
	private JudgeUtil jutil = new JudgeUtil();
	
	public Client client = new Client(this);
	
	public SocketChannel socketChannel = null;
	
	@Override
	public Object getWeldedJunctionAll() {
		try{
			JSONObject obj = new JSONObject();
			JSONArray ary = new JSONArray();
			List<WeldedJunction> list = wjm.getWeldedJunctionAll();
			for(int i=0;i<list.size();i++){
				obj.put("ID", jutil.setValue(list.get(i).getId()));
				obj.put("TASKID", jutil.setValue(list.get(i).getTaskid()));
				obj.put("TASKNO",jutil.setValue(list.get(i).getWeldedJunctionno()));
				obj.put("TASKDES",jutil.setValue(list.get(i).getSerialNo()));
				obj.put("WELDERID", jutil.setValue(list.get(i).getWelderid()));
				obj.put("WELDERNO",jutil.setValue(list.get(i).getPipelineNo()));
				obj.put("WELDERNAME",jutil.setValue(list.get(i).getRoomNo()));
				obj.put("MACHINEID", jutil.setValue(list.get(i).getMachineid()));
				obj.put("MACHINENO", jutil.setValue(list.get(i).getUnit()));
				obj.put("ITEMID",jutil.setValue(list.get(i).getItemid().getId()));
				obj.put("ITEMNAME",jutil.setValue(list.get(i).getItemid().getName()));
				obj.put("OPERATESTATUS",jutil.setValue(list.get(i).getDyne()));
				obj.put("STARTTIME", jutil.setValue(list.get(i).getStartTime()));
				obj.put("ENDTIME", jutil.setValue(list.get(i).getEndTime()));
				ary.add(obj);
			}
			return JSON.toJSONString(ary);
		}catch(Exception e){
			e.printStackTrace();
			return null;
		}
	}

	@Override
	public Object getWeldedJunctionById(String object) {
		try{
			JSONObject json = JSONObject.fromObject(object);
			JSONObject obj = new JSONObject();
			WeldedJunction list = wjm.getWeldedJunctionById(new BigInteger(json.getString("ID")));
			if(list!=null){
				obj.put("ID", jutil.setValue(list.getId()));
				obj.put("JUNCTIONNO",jutil.setValue(list.getWeldedJunctionno()));
				obj.put("SERIALNO",jutil.setValue(list.getSerialNo()));
				obj.put("PIPELINENO",jutil.setValue(list.getPipelineNo()));
				obj.put("ROOMNO",jutil.setValue(list.getRoomNo()));
				obj.put("DYNE",jutil.setValue(list.getDyne()));
				obj.put("UPDATECOUNT",jutil.setValue(list.getUpdatecount()));
				obj.put("ITEMID",jutil.setValue(list.getItemid().getId()));
				obj.put("ITEMNAME",jutil.setValue(list.getItemid().getName()));
			}
			return JSON.toJSONString(obj);
		}catch(Exception e){
			e.printStackTrace();
			return null;
		}
	}

	@Override
	public int getWeldedjunctionByNo(String object) {
		try{
			JSONObject json = JSONObject.fromObject(object);
			return wjm.getWeldedjunctionByNo(json.getString("JUNCTIONNO"));
		}catch(Exception e){
			e.printStackTrace();
			return 0;
		}
	}

	@Override
	public boolean addJunction(String object) {
		try{
			JSONObject json = JSONObject.fromObject(object);
			WeldedJunction wj = new WeldedJunction();
			wj.setWeldedJunctionno(json.getString("JUNCTIONNO"));
			wj.setSerialNo(json.getString("SERIALNO"));
			wj.setDyne(json.getInt("DYNE"));
			wj.setExternalDiameter(json.getString("EXTERNALDIAMETER"));
			String starttime =json.getString("STARTTIME");
			if(starttime!=null && !"".equals(starttime)){
				wj.setStartTime(starttime);
			}
			String endtime =json.getString("ENDTIME");
			if(endtime!=null && !"".equals(endtime)){
				wj.setEndTime(endtime);
			}
			Insframework itemid = new Insframework();
			itemid.setId(new BigInteger(json.getString("INSFID")));
			wj.setItemid(itemid);
			return wjm.addJunction(wj);
		}catch(Exception e){
			e.printStackTrace();
			return false;
		}
	}

	@Override
	public boolean updateJunction(String object) {
		try{
			JSONObject json = JSONObject.fromObject(object);
			WeldedJunction wj = new WeldedJunction();
			wj.setId(new BigInteger(json.getString("ID")));
			wj.setWeldedJunctionno(json.getString("JUNCTIONNO"));
			wj.setSerialNo(json.getString("SERIALNO"));
			wj.setDyne(json.getInt("DYNE"));
			wj.setExternalDiameter(json.getString("EXTERNALDIAMETER"));
			String starttime =json.getString("STARTTIME");
			if(starttime!=null && !"".equals(starttime)){
				wj.setStartTime(starttime);
			}
			String endtime =json.getString("ENDTIME");
			if(endtime!=null && !"".equals(endtime)){
				wj.setEndTime(endtime);
			}
			Insframework itemid = new Insframework();
			itemid.setId(new BigInteger(json.getString("INSFID")));
			wj.setItemid(itemid);
			return wjm.updateJunction(wj);
		}catch(Exception e){
			e.printStackTrace();
			return false;
		}
	}

	@Override
	public boolean deleteJunction(String object) {
		try{
			JSONObject json = JSONObject.fromObject(object);
			return wjm.deleteJunction(new BigInteger(json.getString("ID")));
		}catch(Exception e){
			e.printStackTrace();
			return false;
		}
	}

	@Override
	public Object getTaskResultAll(String object) {
		try{
			JSONObject json = JSONObject.fromObject(object);
			JSONObject obj = new JSONObject();
			JSONArray ary = new JSONArray();
			List<WeldedJunction> list = wjm.getTaskResultAll(json.getString("STR"));
			for(int i=0;i<list.size();i++){
				obj.put("ID", jutil.setValue(list.get(i).getId()));
				obj.put("TASKNO",jutil.setValue(list.get(i).getWeldedJunctionno()));
				obj.put("WELDERNAME",jutil.setValue(list.get(i).getSerialNo()));
				obj.put("MACHINENO",jutil.setValue(list.get(i).getPipelineNo()));
				obj.put("OPERATETYPENAME",jutil.setValue(list.get(i).getRoomNo()));
				obj.put("RESULT",jutil.setValue(list.get(i).getArea()));
				obj.put("RESULTNAME",jutil.setValue(list.get(i).getUnit()));
				ary.add(obj);
			}
			return JSON.toJSONString(ary);
		}catch(Exception e){
			e.printStackTrace();
			return null;
		}
	
	}

	@Override
	public boolean addTaskResult(String object) {
		try{
			JSONObject json = JSONObject.fromObject(object);
			WeldedJunction wj = new WeldedJunction();
			wj.setTaskid(new BigInteger(json.getString("TASKID")));
			wj.setWelderid(new BigInteger(json.getString("WELDERID")));
			wj.setMachineid(new BigInteger(json.getString("MACHINEID")));
			wj.setDyne(Integer.valueOf(json.getString("OPERATETYPEID")));
			wj.setOperatorid(new BigInteger(json.getString("OPERATORID")));
			wj.setUpdatecount(Integer.valueOf(json.getString("RESULTID")));
			wj.setArea(json.getString("RESULT"));
			wjm.addTaskResult(wj);
			return true;
		}catch(Exception e){
			e.printStackTrace();
			return false;
		}
	}

	@Override
	public boolean updateTaskResult(String object) {
		try{
			JSONObject json = JSONObject.fromObject(object);
			WeldedJunction wj = new WeldedJunction();
			wj.setId(new BigInteger(json.getString("ID")));
			wj.setTaskid(new BigInteger(json.getString("TASKID")));
			wj.setWelderid(new BigInteger(json.getString("WELDERID")));
			wj.setMachineid(new BigInteger(json.getString("MACHINEID")));
			wj.setDyne(Integer.valueOf(json.getString("OPERATESTATUS")));
			wj.setOperatorid(new BigInteger(json.getString("OPERATORID")));
			wj.setUpdatecount(Integer.valueOf(json.getString("RESULTID")));
			wj.setArea(json.getString("RESULT"));
			wjm.updateTaskResult(wj);
			return true;
		}catch(Exception e){
			e.printStackTrace();
			return false;
		}
	}

	@Override
	public boolean deleteTaskResult(String object) {
		try{
			JSONObject json = JSONObject.fromObject(object);
			return wjm.deleteTaskResult(new BigInteger(json.getString("ID")));
		}catch(Exception e){
			e.printStackTrace();
			return false;
		}
	}

	@Override
	public boolean giveToServer(String object) {
		client.run();
		boolean a = false;
		while(!a){
			if(socketChannel != null){
				try {
					socketChannel.writeAndFlush("FA000031010009000100000011007B00A400000311091D0C050C007B00A500000311091D14050C007B00A400000311091D14050CC017F5").sync();
				} catch (InterruptedException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				a = true;
			}
		}
		return true;
	}

}
