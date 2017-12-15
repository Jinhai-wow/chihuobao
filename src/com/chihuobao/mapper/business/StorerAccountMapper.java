package com.chihuobao.mapper.business;

import com.chihuobao.po.StorerAccount;
import com.chihuobao.po.StorerAccountExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;
/**
 * 
 * @description 商家账号数据访问接口
 * @author 王锦海
 * @date 2017年11月28日
 * @version 1.0
 */
public interface StorerAccountMapper {
    int countByExample(StorerAccountExample example);

    int deleteByExample(StorerAccountExample example);

    int deleteByPrimaryKey(Integer id);

    int insert(StorerAccount record);

    int insertSelective(StorerAccount record);

    List<StorerAccount> selectByExample(StorerAccountExample example);

    StorerAccount selectByPrimaryKey(Integer id);

    int updateByExampleSelective(@Param("record") StorerAccount record, @Param("example") StorerAccountExample example);

    int updateByExample(@Param("record") StorerAccount record, @Param("example") StorerAccountExample example);

    int updateByPrimaryKeySelective(StorerAccount record);

    int updateByPrimaryKey(StorerAccount record);
}