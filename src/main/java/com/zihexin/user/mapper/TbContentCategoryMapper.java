package com.zihexin.user.mapper;

import com.zihexin.user.entity.TbContentCategory;
import com.zihexin.user.entity.TbContentCategoryExample;

import java.util.List;

/**
 * Created by Administrator on 2017/11/14 0014.
 */
public interface TbContentCategoryMapper {


    List<TbContentCategory> selectByExample(TbContentCategoryExample example);
}
