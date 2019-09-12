package com.spring.service;

import java.math.BigInteger;
import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.spring.dto.WeldDto;
import com.spring.model.User;
import com.spring.model.Wps;
import com.spring.page.Page;

public interface WpsService {
	List<Wps> findAll(Page page, BigInteger parent,String str);
	List<Wps> findAllSpe(BigInteger machine,BigInteger chanel);
	List<Wps> findSpe(BigInteger machine,String ch);
	List<Wps> findHistory(Page page, BigInteger parent);
	List<Wps> AllSpe(BigInteger machine,String ch);
	void give(Wps wps);
	BigInteger findByUid(long uid);
	void save(Wps wps);
	void update(Wps wps);
	int getUsernameCount(String fwpsnum);
	Wps findById(BigInteger fid);
	void delete(BigInteger fid);
	String findIpById(BigInteger fid);
	void deleteHistory(BigInteger fid);
	Wps findSpeById(BigInteger fid);
	int findCount(BigInteger machine, String string);
	void saveSpe(Wps wps);
	void updateSpe(Wps wps);
	List<Wps> getWpslibList(Page page, String search);
	List<Wps> getMainwpsList(Page page, BigInteger parent);
	int getWpslibNameCount(String wpsName);
	void saveWpslib(Wps wps);
	void updateWpslib(Wps wps);
	List<Wps> getWpslibStatus();
	void deleteWpslib(BigInteger fid);
	void deleteWpsBelongLib(BigInteger fid);
	void deleteMainWps(BigInteger fid);
	int getCountByWpslibidChanel(BigInteger wpslibid,int chanel);
	
	/**
	 * 获取松下wps
	 * @param parent
	 * @return
	 */
	List<Wps> getSxWpsList(Page page, BigInteger parent);
	
	/**
	 * 松下焊机wps新增
	 * @param wps
	 * @return
	 */
	boolean saveSxWps(Wps wps);
	
	/**
	 * 松下焊机wps新增(历史表)
	 * @param wps
	 * @return
	 */
	boolean saveSxWpsHistory(Wps wps);
	
	/**
	 * OTC焊机wps新增(历史表)
	 * @param wps
	 * @return
	 */
	boolean saveOtcWpsHistory(Wps wps);
	
	/**
	 * 松下焊机wps修改
	 * @param wps
	 * @return
	 */
	boolean editSxWps(Wps wps);
	
	/**
	 * 工艺库与下发焊机的对应列表
	 * @param wps
	 * @return
	 */
	List<Wps> getWpslibMachineHistoryList(Page page, String machineNum, String wpslibName, WeldDto dto);
	
	/**
	 * 查询OTC参数明细
	 * @param machineId 焊机id
	 * @param chanel 通道
	 * @param machineModel 保存时间
	 * @return
	 */
	Wps getOtcDetail(String machineId, String chanel, String time);
	
	/**
	 * 查询松下参数明细
	 * @param machineId 焊机id
	 * @param chanel 通道
	 * @param time 保存时间
	 * @return
	 */
	Wps getSxDetail(String machineId, String chanel, String time);
	
	/**
	 * 根据工艺库名称获取对应的id
	 */
	String getIdByWpslibname(String wpslibname);
	
	/**
	 * 根据焊机号和job号获取参数
	 * @param machine
	 * @param chanel
	 * @return
	 */
	List<Wps> getFnsDetail(BigInteger machine, String chanel);
	/**
	 * 获取焊机的所有job号
	 * @param machine
	 * @return
	 */
	List<Wps> getFnsJobList(BigInteger machine);
	/**
	 * 新增job
	 * @param wps
	 */
	void addJob(Wps wps);
	/**
	 * 修改job
	 * @param wps
	 */
	void updateJob(Wps wps);
	/**
	 * 删除Job
	 */
	void deleteJob(String machine,String chanel);
	
	/**
	 * 获取福尼斯TPSI焊机材质
	 */
	List<String> getTpsiMaterial();
	
	/**
	 * 获取福尼斯TPSI气体
	 */
	List<String> getTpsiGas();
	
	/**
	 * 获取福尼斯TPSI丝径
	 */
	List<String> getTpsiWire();
	
	/**
	 * 以工艺库id，含层号，焊道号为条件判段该工艺是否存在，大于0即存在
	 * @param wpsid 工艺库id
	 * @param layer 焊层号
	 * @param road 焊道号
	 * @return
	 */
	int getCountByWpsidAndLayerroad(String wpsid,String layer,String road);
	
	/**
	 * 新增工艺（实验室）
	 * @param wps
	 */
	void addWpsDetail(Wps wps);
	
	/**
	 * 修改工艺（实验室导入）
	 * @param wps
	 */
	void updateWpsDetail(Wps wps);
	
	/**
	 * 修改工艺（实验室网页）
	 * @param wps
	 */
	void updateWpsDetailById(Wps wps);
	
	/**
	 * 获取所有的工艺库名称
	 * @param uid
	 * @return
	 */
	List<Wps> getAllWpslib();
}
