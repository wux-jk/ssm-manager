package com.zihexin.user.service;

import com.zihexin.user.entity.EasyUITreeNode;
import com.zihexin.user.util.E3Result;

import java.util.List;

/**
 * Created by Administrator on 2017/11/14 0014.
 */
public interface ContentCategoryService {
    List<EasyUITreeNode> getContentCatList(long parentId);
    E3Result addContentCategory(long parentId, String name);
}
