package com.dao;

import com.entity.GoodsModel;

import java.util.List;

/**
 * @Author hongxiaobin
 * @Time 2022/3/20-15:08
 * @Description 定义商品增删改查dao层接口
 */
public interface GoodsDao {
    /**
     * @Author: hongxiaobin
     * @Description: 商品添加
     * @Date: 2022/3/20 15:09
     * @Param: Connection
     * @Return: void
     */
    void insertGoods(GoodsModel goodsModel);

    /**
     * @Author: hongxiaobin
     * @Description: 商品删除
     * @Date: 2022/3/20 15:09
     * @Param: Connection
     * @Return: void
     */
    void deleteGoods(String isbn);

    /**
     * @Author: hongxiaobin
     * @Description: 商品修改
     * @Date: 2022/3/20 15:10
     * @Param: Connection
     * @Return: void
     */
    void update(GoodsModel goodsModel);

    /**
     * @Author: hongxiaobin
     * @Description: 商品模糊查询
     * @Date: 2022/3/20 15:10
     * @Param: Connection
     * @Return: List<GoodsModel>
     */
    List<GoodsModel> getGoodslist();

    /**
     * @Author: hongxiaobin
     * @Description: 商品编号精确查找
     * @Date: 2022/3/20 15:13
     * @Param: Connection
     * @Return: GoodsModel
     */
    List<GoodsModel> getGoods(String gid);

    /**
     * @Author: hongxiaobin
     * @Description: 商品名称模糊查找
     * @Date: 2022/3/20 15:13
     * @Param: Connection
     * @Return: GoodsModel
     */
    List<GoodsModel> getGoodsGname(String gname);

    /**
     * 商品类别模糊查询
     *
     * @Param:
     * @Return:
     */
    List<GoodsModel> getGoodsGcategory(String gcategory);
    /**全部范围内模糊查询
     * @Param:
     * @Return:
     */
    List<GoodsModel> getGoodsAll(String all);
}
