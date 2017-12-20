package com.chihuobao.mapper.business;

import com.chihuobao.po.ManInfo;
import com.chihuobao.po.ManInfoExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;
/**
 * 
 * @description 管理员评论数据访问接口
 * @author 王锦海
 * @date 2017年11月28日
 * @version 1.0
 */
public interface ManInfoMapper {
    int countByExample(ManInfoExample example);

    int deleteByExample(ManInfoExample example);

    int deleteByPrimaryKey(Integer infoid);

    int insert(ManInfo record);

    int insertSelective(ManInfo record);

    List<ManInfo> selectByExample(ManInfoExample example);

    ManInfo selectByPrimaryKey(Integer infoid);
    
    List<ManInfo> selectSysMsgAll();//查询所有消息
    
    List<ManInfo> selectSysMsgByShopId(Integer id);//查询商店所有消息

    int updateByExampleSelective(@Param("record") ManInfo record, @Param("example") ManInfoExample example);

    int updateByExample(@Param("record") ManInfo record, @Param("example") ManInfoExample example);

    int updateByPrimaryKeySelective(ManInfo record);

    int updateByPrimaryKey(ManInfo record);

	int updateMsgType();
}