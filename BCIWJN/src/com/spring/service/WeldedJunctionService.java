package com.spring.service;

import java.math.BigInteger;
import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.spring.dto.WeldDto;
import com.spring.model.WeldedJunction;
import com.spring.page.Page;

public interface WeldedJunctionService {
	
	/**
	 * 查询所有任务
	 */
	List<WeldedJunction> getWeldedJunctionAll(Page page, String str);
	List<WeldedJunction> getWeldedJunctionAll(String str);
	
	/**
	 * 查询所有任务(不包含分页信息)
	 */
	List<WeldedJunction> getWeldedJunction(String str);
	
	/**
	 * 根据id查询
	 * @param id 任务id
	 * @return
	 */
	WeldedJunction getWeldedJunctionById(BigInteger id);
	
	/**
	 * 根据焊工获取任务
	 * @param welder
	 * @param dto
	 * @return
	 */
	List<WeldedJunction> getJunctionByWelder(Page page, String welder,WeldDto dto);
	
	/**
	 * 判断任务编号是否存在
	 * @param wjno 悍缝编号
	 * @return 受影响的行数
	 */
	int getWeldedjunctionByNo(String wjno);
	
	/**
	 * 新增任务
	 * @param wj
	 */
	boolean addJunction(WeldedJunction wj);

	/**
	 * 修改任务
	 * @param wj
	 */
	boolean updateJunction(WeldedJunction wj);

	/**
	 * 删除任务
	 * @param wj
	 */
	boolean deleteJunction(BigInteger id);
	
	/**
	 * 焊工对应的焊机任务信息
	 * @param page 分页
	 * @param dto 
	 * @param str
	 * @param welderid 焊机编号
	 * @return
	 */
	List<WeldedJunction> getJMByWelder(Page page, WeldDto dto,String welderid);
	
	/**
	 * 时间段内焊接开始时间
	 */
	String getFirsttime(WeldDto dto, BigInteger machineid, String welderid,String junid);
	
	/**
	 * 时间段内焊接结束时间
	 */
	String getLasttime(WeldDto dto, BigInteger machineid, String welderid,String junid);
	
	/**
	 * 查询任务执行
	 */
	List<WeldedJunction> getTaskResultAll(Page page, String str);
	
	/**
	 * 判断任务是否已经开始被执行或完成
	 * @param taskid任务id
	 * @return
	 */
	int getCountByTaskid(BigInteger taskid,BigInteger type);
	
	/**
	 * 新增任务
	 * @param object
	 * @return
	 */
	boolean addTask(WeldedJunction wj);
	
	/**
	 * 修改任务
	 * @param object
	 * @return
	 */
	boolean updateTask(WeldedJunction wj);
	
	/**
	 * 根据任务ID修改任务
	 * @param object
	 * @return
	 */
	boolean updateTaskByFid(WeldedJunction wj);
	
	/**
	 * 根据任务编号修改任务
	 * @param wj
	 */
	void updateTaskByNumber(WeldedJunction wj);
	
	/**
	 * 查询空闲任务
	 * @param str
	 * @return
	 */
	List<WeldedJunction> getFreeJunction(Page page,String str);

	/**
	 * 查询任务的所有焊工
	 * @param page
	 * @return
	 */
	List<WeldedJunction> getRealWelder(Page page,BigInteger taskid);
	
	/**
	 * 以任务编号，焊机焊工id为条件查询所有层道
	 * @param page
	 * @param dto
	 * @param tempTime
	 * @param welderid
	 * @return
	 */
	List<WeldedJunction> getSwDetail(Page page,String taskno,String time,WeldDto dto);
}
