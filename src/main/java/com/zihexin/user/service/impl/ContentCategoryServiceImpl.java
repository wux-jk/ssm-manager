package com.zihexin.user.service.impl;

import com.zihexin.user.entity.EasyUITreeNode;
import com.zihexin.user.entity.TbContentCategory;
import com.zihexin.user.entity.TbContentCategoryExample;
import com.zihexin.user.mapper.TbContentCategoryMapper;
import com.zihexin.user.service.ContentCategoryService;
import com.zihexin.user.util.E3Result;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

/**
 * Created by Administrator on 2017/11/14 0014.
 *
 */
@Service
public class ContentCategoryServiceImpl implements ContentCategoryService {

    @Autowired
    private TbContentCategoryMapper contentCategoryMapper;

    @Override
    public List<EasyUITreeNode> getContentCatList(long parentId) {

        // 根据parentid查询子节点列表
        TbContentCategoryExample example = new TbContentCategoryExample();

        TbContentCategoryExample.Criteria criteria = example.createCriteria();
        //设置查询条件
        criteria.andParentIdEqualTo(parentId);
        //执行查询
        List<TbContentCategory> catList = contentCategoryMapper.selectByExample(example);
        //转换成EasyUITreeNode的列表
        List<EasyUITreeNode> nodeList = new ArrayList<>();
        for (TbContentCategory tbContentCategory : catList) {
            EasyUITreeNode node = new EasyUITreeNode();
            node.setId(tbContentCategory.getId());
            node.setText(tbContentCategory.getName());
            node.setState(tbContentCategory.getIsParent() ? "closed" : "open");
            //添加到列表
            nodeList.add(node);
        }
        return nodeList;
    }


    @Override
    public E3Result addContentCategory(long parentId, String name) {
        return null;
    }


}