package com.spring.service.impl;

import java.math.BigInteger;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.github.pagehelper.PageHelper;
import com.spring.dao.DataStatisticsMapper;
import com.spring.dto.WeldDto;
import com.spring.model.DataStatistics;
import com.spring.page.Page;
import com.spring.service.DataStatisticsService;

@Service
@Transactional
public class DataStatisticsServiceImpl implements DataStatisticsService {
	@Autowired
	private DataStatisticsMapper ds;
	
	@Override
	public List<DataStatistics> getItemMachineCount(Page page,BigInteger parent,String str) {
		PageHelper.startPage(page.getPageIndex(), page.getPageSize());
		return ds.getItemMachineCount(parent,str);
	}
	
	@Override
	public List<DataStatistics> getItemMachineCount(BigInteger parent) {
		return ds.getItemMachineCount(parent,null);
	}

	@Override
	public int getStartingUpMachineNum(BigInteger itemid, WeldDto dto) {
		return ds.getStartingUpMachineNum(itemid, dto);
	}

	@Override
	public DataStatistics getParameter() {
		return ds.getParameter();
	}

	@Override
	public DataStatistics getWorkMachineNum(BigInteger itemid, WeldDto dto) {
		return ds.getWorkMachineNum(itemid, dto);
	}

	@Override
	public DataStatistics getWorkJunctionNum(BigInteger itemid, WeldDto dto) {
		return ds.getWorkJunctionNum(itemid, dto);
	}

	@Override
	public BigInteger getStaringUpTime(BigInteger itemid, WeldDto dto) {
		return ds.getStaringUpTime(itemid, dto); 
	}

	@Override
	public BigInteger getStandytime(BigInteger itemid, WeldDto dto) {
		return ds.getStandytime(itemid, dto);
	}

	@Override
	public DataStatistics getWorkTimeAndEleVol(BigInteger itemid, WeldDto dto) {
		return ds.getWorkTimeAndEleVol(itemid, dto);
	}

	@Override
	public List<DataStatistics> getAllMachine(Page page,BigInteger itemid,String str) {
		PageHelper.startPage(page.getPageIndex(), page.getPageSize());
		return ds.getAllMachine(itemid,str);
	}

	@Override
	public List<DataStatistics> getAllWelder(Page page,String str) {
		PageHelper.startPage(page.getPageIndex(), page.getPageSize());
		return ds.getAllWelder(str);
	}

	@Override
	public List<DataStatistics> getAllJunction(Page page, String junctionno,String str) {
		PageHelper.startPage(page.getPageIndex(), page.getPageSize());
		return ds.getAllJunction(junctionno,str);
	}

	@Override
	public List<DataStatistics> getAllInsframe() {
		return ds.getAllInsframe();
	}

	@Override
	public List<DataStatistics> getWeldItemInCount(Page page, WeldDto dto,String str) {
		PageHelper.startPage(page.getPageIndex(), page.getPageSize());
		return ds.getWeldItemInCount(dto,str);
	}

	@Override
	public List<DataStatistics> getWeldItemOutCount(Page page, WeldDto dto,String str) {
		PageHelper.startPage(page.getPageIndex(), page.getPageSize());
		return ds.getWeldItemOutCount(dto,str);
	}

	@Override
	public List<DataStatistics> getWeldMachineInCount(Page page, WeldDto dto ,BigInteger itemid,String str) {
		PageHelper.startPage(page.getPageIndex(), page.getPageSize());
		return ds.getWeldMachineInCount(dto,itemid,str);
	}

	@Override
	public List<DataStatistics> getWeldMachineOutCount(Page page, WeldDto dto ,BigInteger itemid,String str) {
		PageHelper.startPage(page.getPageIndex(), page.getPageSize());
		return ds.getWeldMachineOutCount(dto,itemid,str);
	}

	@Override
	public List<DataStatistics> getWeldPersonInCount(Page page, WeldDto dto,String str) {
		PageHelper.startPage(page.getPageIndex(), page.getPageSize());
		return ds.getWeldPersonInCount(dto,str);
	}

	@Override
	public List<DataStatistics> getWeldPersonOutCount(Page page, WeldDto dto,String str) {
		PageHelper.startPage(page.getPageIndex(), page.getPageSize());
		return ds.getWeldPersonOutCount(dto,str);
	}

	@Override
	public List<DataStatistics> getWeldPieceInCount(Page page, WeldDto dto,String junctionno,String str) {
		PageHelper.startPage(page.getPageIndex(), page.getPageSize());
		return ds.getWeldPieceInCount(dto,junctionno,str);
	}

	@Override
	public List<DataStatistics> getWeldPieceOutCount(Page page, WeldDto dto,String junctionno,String str) {
		PageHelper.startPage(page.getPageIndex(), page.getPageSize());
		return ds.getWeldPieceOutCount(dto,junctionno,str);
	}

	@Override
	public List<DataStatistics> getFauit(Page page, WeldDto dto, int value) {
		PageHelper.startPage(page.getPageIndex(), page.getPageSize());
		return ds.getFauit(dto, value);
	}

	@Override
	public List<DataStatistics> getFauitDetail(Page page, WeldDto dto, BigInteger id, int value) {
		PageHelper.startPage(page.getPageIndex(), page.getPageSize());
		return ds.getFauitDetail(dto, id, value);
	}

	@Override
	public List<DataStatistics> getAllItemData(String str) {
		// TODO Auto-generated method stub
		return ds.getItemMachineCount(null,str);
	}

	@Override
	public List<DataStatistics> getAllMachineData(BigInteger itemid,String str) {
		// TODO Auto-generated method stub
		return ds.getAllMachine(itemid,str);
	}

	@Override
	public List<DataStatistics> getAllPersonData(String str) {
		// TODO Auto-generated method stub
		return ds.getAllWelder(str);
	}

	public List<DataStatistics> getAllJunctionData(String junctionno,String str) {
		// TODO Auto-generated method stub
		return ds.getAllJunction(junctionno,str);
	}

	@Override
	public List<DataStatistics> getWeldItemInCountData(WeldDto dto,String str) {
		// TODO Auto-generated method stub
		return ds.getWeldItemInCount(dto,str);
	}

	@Override
	public List<DataStatistics> getWeldItemOutCountData(WeldDto dto,String str) {
		// TODO Auto-generated method stub
		return ds.getWeldItemOutCount(dto,str);
	}

	@Override
	public List<DataStatistics> getWeldMachineInCountData(WeldDto dto, BigInteger itemid,String str) {
		// TODO Auto-generated method stub
		return ds.getWeldMachineInCount(dto, itemid,str);
	}

	@Override
	public List<DataStatistics> getWeldMachineOutCountData(WeldDto dto, BigInteger itemid,String str) {
		// TODO Auto-generated method stub
		return ds.getWeldMachineOutCount(dto, itemid,str);
	}

	@Override
	public List<DataStatistics> getWeldPersonInCountData(WeldDto dto,String str) {
		// TODO Auto-generated method stub
		return ds.getWeldPersonInCount(dto,str);
	}

	@Override
	public List<DataStatistics> getWeldPersonOutCountData(WeldDto dto,String str) {
		// TODO Auto-generated method stub
		return ds.getWeldPersonOutCount(dto,str);
	}

	@Override
	public List<DataStatistics> getWeldWorkpieceInCountData(WeldDto dto, String junctionno,String str) {
		// TODO Auto-generated method stub
		return ds.getWeldPieceInCount(dto, junctionno,str);
	}

	@Override
	public List<DataStatistics> getWeldWorkpieceOutCountData(WeldDto dto, String junctionno,String str) {
		// TODO Auto-generated method stub
		return ds.getWeldPieceOutCount(dto, junctionno,str);
	}

	@Override
	public List<DataStatistics> getWorkRank(BigInteger parent, String time) {
		return ds.getWorkRank(parent, time);
	}

	@Override
	public DataStatistics getWorkMachineCount(BigInteger itemid, String time) {
		return ds.getWorkMachineCount(itemid, time);
	}

	@Override
	public List<DataStatistics> getItemWeldTime(WeldDto dto) {
		return ds.getItemWeldTime(dto);
	}

	@Override
	public List<DataStatistics> getItemOverProofTime(WeldDto dto) {
		return ds.getItemOverProofTime(dto);
	}
}
