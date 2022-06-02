package com.dao.implement;

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
    void deleteGoods(String isbn, String eid);

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
    List<GoodsModel> getGoodslist(String eid, int start, int end);

    /**
     * @Author: hongxiaobin
     * @Description: 商品编号精确查找
     * @Date: 2022/3/20 15:13
     * @Param: Connection
     * @Return: GoodsModel
     */
    List<GoodsModel> getGoods(String gid, String eid);

    List<GoodsModel> getGoodsGid(String gid, String eid, int start, int end);

    /**
     * @Author: hongxiaobin
     * @Description: 商品名称模糊查找
     * @Date: 2022/3/20 15:13
     * @Param: Connection
     * @Return: GoodsModel
     */
    List<GoodsModel> getGoodsGname(String gname, String eid, int start, int end);

    /**
     * 商品类别模糊查询
     *
     * @Param:
     * @Return:
     */
    List<GoodsModel> getGoodsGcategory(String gcategory, String eid, int start, int end);

    /**
     * 全部范围内模糊查询
     *
     * @Param:
     * @Return:
     */
    List<GoodsModel> getGoodsAll(String all, String eid, int start, int end);

    List<GoodsModel> getdEid();

    List<GoodsModel> getdEidGoods(String eid);

    List<GoodsModel> getGcategory();
    List<GoodsModel> getGidEid(String gid,String eid);
}
