package com.spring.dao;

import java.math.BigInteger;
import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.spring.model.WeldedJunction;

import tk.mybatis.mapper.common.Mapper;

public interface WeldedJunctionMapper extends Mapper<WeldedJunction>{
	List<WeldedJunction> getWeldedJunctionAll();
	
	WeldedJunction getWeldedJunctionById(@Param("id")BigInteger id);
	
	boolean addJunction(WeldedJunction wj);

	boolean updateJunction(WeldedJunction wj);

	boolean deleteJunction(@Param("id")BigInteger id);
	
	int getWeldedjunctionByNo(@Param("wjno")String wjno);

	boolean addTaskResult(WeldedJunction wj);

	boolean deleteTaskResult(@Param("id")BigInteger id);

	List<WeldedJunction> getTaskResultAll(@Param("str")String str);

	boolean updateTaskResult(WeldedJunction wj);
}
