package com.spring.dao;

import java.math.BigInteger;
import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.spring.dto.WeldDto;
import com.spring.model.Wps;
import com.spring.page.Page;

public interface WpsMapper {
	List<Wps> findAll(@Param("parent")BigInteger parent,@Param("str")String str);
	List<Wps> findAllSpe(@Param("machine")BigInteger machine,@Param("chanel")BigInteger chanel);
	List<Wps> findSpe(@Param("machine")BigInteger machine,@Param("chanel")String chanel);
	List<Wps> AllSpe(@Param("machine")BigInteger machine,@Param("chanel")String chanel);
	List<Wps> findHistory(@Param("parent")BigInteger parent);
	void save(Wps wps);
	void give(Wps wps);
	BigInteger findByUid(long uid);
	void update(Wps wps);
	int getUsernameCount(@Param("fwpsnum")String fwpsnum);
	Wps findById(BigInteger fid);
	Wps findSpeById(BigInteger fid);
	void delete(BigInteger fid);
	String findIpById(BigInteger fid);
	void deleteHistory(BigInteger fid);
	int findCount(@Param("machine")BigInteger machine, @Param("chanel")String chanel);
	void saveSpe(Wps wps);
	void updateSpe(Wps wps);
	List<Wps> getWpslibList(@Param("search")String search);
	List<Wps> getMainwpsList(@Param("parent")BigInteger parent);
	int getWpslibNameCount(@Param("wpsName")String wpsName);
	void saveWpslib(Wps wps);
	void updateWpslib(Wps wps);
	List<Wps> getWpslibStatus();
	void deleteWpslib(@Param("fid")BigInteger fid);
	void deleteWpsBelongLib(@Param("fid")BigInteger fid);
	void deleteMainWps(@Param("fid")BigInteger fid);
	int getCountByWpslibidChanel(@Param("wpslibid")BigInteger wpslibid,@Param("chanel")int chanel);
	
	List<Wps> getSxWpsList(@Param("parent")BigInteger parent);
	boolean saveSxWps(Wps wps);
	boolean saveSxWpsHistory(Wps wps);
	boolean saveOtcWpsHistory(Wps wps);
	boolean editSxWps(Wps wps);
	List<Wps> getWpslibMachineHistoryList(@Param("machineNum")String machineNum, @Param("wpslibName")String wpslibName, @Param("dto")WeldDto dto);
	Wps getSxDetail(@Param("machineId")String machineId, @Param("chanel")String chanel, @Param("time")String time);
	Wps getOtcDetail(@Param("machineId")String machineId, @Param("chanel")String chanel, @Param("time")String time);
	String getIdByWpslibname(@Param("wpslibname")String wpslibname);
	
	List<Wps> getFnsDetail(@Param("machine")BigInteger machine, @Param("chanel")String chanel);
	List<Wps> getFnsJobList(@Param("machine")BigInteger machine);
	void addJob(Wps wps);
	void updateJob(Wps wps);
	void deleteJob(@Param("machine")String machine,@Param("chanel")String chanel);
	List<String> getTpsiMaterial();
	List<String> getTpsiGas();
	List<String> getTpsiWire();
	
	int getCountByWpsidAndLayerroad(@Param("wpsid")String wpsid,@Param("layer")String layer,@Param("road")String road);
	void addWpsDetail(Wps wps);
	void updateWpsDetail(Wps wps);
	void updateWpsDetailById(Wps wps);
	
	List<Wps> getAllWpslib();
	List<Wps> getGrooveList(@Param("search")String search);
	List<Wps> getClassificationSociety();
	List<Wps> getWeldMaterial();
	List<Wps> getBaseMaterialList(@Param("search")String search);
	
	List<Wps> getPwpslibList(@Param("search")String search);
	List<Wps> getMainpwpsList(@Param("parent")BigInteger parent);
	void savePwpslib(Wps wps);
	void updatePwpslib(Wps wps);
	void deletePwpslib(@Param("fid")BigInteger fid);
	void deletePwpsBelongLib(@Param("fid")BigInteger fid);
	void addPwpsDetail(Wps wps);
	void updatePwpsDetailById(Wps wps);
	void deleteMainPwps(@Param("fid")BigInteger fid);
	Wps getBaseMaterialById(@Param("fid")BigInteger fid);
	Wps getWeldMaterialById(@Param("fid")BigInteger fid);
	List<Wps> getAllPwpslib();
	String getCountFromTask(@Param("taskNumber")String taskNumber);
	void pqrData(@Param("taskno")String taskno,@Param("board")String board);
	
	List<Wps> getpqrList(@Param("search")String search);
	void updatepqrlib(Wps wps);
	void savepqrlib(Wps wps);
	void deletepqrlib(@Param("fid")BigInteger fid);
	List<Wps> getMainpqrList(@Param("parent")BigInteger parent);
	void addPqrDetail(Wps wps);
	void updatePqrDetailById(Wps wps);
	void deleteMainPqr(@Param("fid")BigInteger fid);
	List<Wps> getMainpwpsByPqrid(@Param("fid")BigInteger fid);
	List<Wps> generateMainwps(@Param("name")String name);
	
}
