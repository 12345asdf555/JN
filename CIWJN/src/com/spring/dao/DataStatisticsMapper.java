package com.spring.dao;

import java.math.BigInteger;
import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.spring.dto.WeldDto;
import com.spring.model.DataStatistics;

import tk.mybatis.mapper.common.Mapper;

public interface DataStatisticsMapper  extends Mapper<DataStatistics>{
	List<DataStatistics> getItemMachineCount(@Param("parent") BigInteger parent,@Param("str") String str);

	int getStartingUpMachineNum(@Param("itemid") BigInteger itemid,@Param("dto") WeldDto dto);
	
	DataStatistics getWorkMachineNum(@Param("itemid") BigInteger itemid,@Param("dto") WeldDto dto);
	
	DataStatistics getWorkJunctionNum(@Param("itemid") BigInteger itemid,@Param("dto") WeldDto dto);
	
	BigInteger  getStaringUpTime(@Param("itemid") BigInteger itemid,@Param("dto") WeldDto dto);
	
	DataStatistics getParameter();
	
	BigInteger getStandytime(@Param("itemid") BigInteger itemid,@Param("dto") WeldDto dto);
	
	DataStatistics getWorkTimeAndEleVol(@Param("itemid") BigInteger itemid,@Param("dto") WeldDto dto);
	
	List<DataStatistics> getAllMachine(@Param("item") BigInteger item,@Param("str") String str);
	
	List<DataStatistics> getAllWelder(@Param("str") String str);
	
	List<DataStatistics> getAllJunction(@Param("junctionno") String junctionno,@Param("str") String str);
	
	List<DataStatistics> getAllInsframe();
	
	List<DataStatistics> getWeldItemInCount(@Param("dto") WeldDto dto,@Param("str") String str);
	
	List<DataStatistics> getWeldItemOutCount(@Param("dto") WeldDto dto,@Param("str") String str);
	
	List<DataStatistics> getWeldMachineInCount(@Param("dto") WeldDto dto,@Param("itemid") BigInteger itemid,@Param("str") String str);
	
	List<DataStatistics> getWeldMachineOutCount(@Param("dto") WeldDto dto,@Param("itemid") BigInteger itemid,@Param("str") String str);
	
	List<DataStatistics> getWeldPersonInCount(@Param("dto") WeldDto dto,@Param("str") String str);
	
	List<DataStatistics> getWeldPersonOutCount(@Param("dto") WeldDto dto,@Param("str") String str);
	
	List<DataStatistics> getWeldPieceInCount(@Param("dto") WeldDto dto,@Param("junctionno") String junctionno,@Param("str") String str);
	
	List<DataStatistics> getWeldPieceOutCount(@Param("dto") WeldDto dto,@Param("junctionno") String junctionno,@Param("str") String str);
	
	List<DataStatistics> getFauit(@Param("dto") WeldDto dto,@Param("value") int value);
	
	List<DataStatistics> getFauitDetail(@Param("dto") WeldDto dto,@Param("id") BigInteger id,@Param("value") int value);
	
	List<DataStatistics> getWorkRank(@Param("parent")BigInteger parent,@Param("time")String time);
	
	DataStatistics getWorkMachineCount(@Param("itemid")BigInteger itemid,@Param("time")String time);
	
	List<DataStatistics> getItemWeldTime(@Param("dto")WeldDto dto);
	
	List<DataStatistics> getItemOverProofTime(@Param("dto")WeldDto dto);
}
