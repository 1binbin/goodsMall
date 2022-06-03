package com.business.businessimplement;

import com.entity.GoodsModel;

import java.util.List;

/**
 * @Author hongxiaobin
 * @Time 2022/3/20-15:37
 * @Description 处理业务逻辑接口
 */
public interface GoodsEbi {
    /**
     * @Author: hongxiaobin
     * @Description: 添加图书
     * @Date: 2022/3/20 15:37
     * @Param: GoodsModel
     * @Return: boolean
     */
    boolean insertGoods(GoodsModel goodsModel);

    /**
     * @Author: hongxiaobin
     * @Description: 删除图书
     * @Date: 2022/3/20 15:38
     * @Param: String
     * @Return: boolean
     */
    boolean deleteGoods(String isbn ,String eid);

    /**
     * @Author: hongxiaobin
     * @Description: 修改图书
     * @Date: 2022/3/20 15:39
     * @Param: GoodsModel
     * @Return: boolean
     */
    boolean updateGoods(GoodsModel goodsModel);

    /**
     * @Author: hongxiaobin
     * @Description: 按照商品编号模糊查询商品
     * @Date: 2022/3/20 15:40
     * @Param: null
     * @Return: GoodsModel
     */
    List<GoodsModel> selectGoods(String gid,String eid);

    /**
     * @Author: hongxiaobin
     * @Description: 按照商品名称模糊查询商品
     * @Date: 2022/3/20 15:40
     * @Param: null
     * @Return: GoodsModel
     */
    List<GoodsModel> selectGoodsGname(String gname,String eid,int start,int end);
    List<GoodsModel> selectGoodsGid(String gname,String eid,int start,int end);

    List<GoodsModel> selectGoodsGcategory(String gcategory,String eid,int start,int end);

    List<GoodsModel> selectGoodsAll(String all,String eid,int start,int end);
    /**
     * @Author: hongxiaobin
     * @Description: 精确查询所有图书
     * @Date: 2022/3/20 15:40
     * @Param: String
     * @Return: List<GoodsModel>
     */
    List<GoodsModel> selectGoodsList(String eid,int start,int end);
    List<GoodsModel> getdEid();
    List<GoodsModel> getdEidGoods(String eid);
    List<GoodsModel> getGcategory();
    List<GoodsModel> getGidEid(String gid,String eid);

   /*搜索模块*/
   List<GoodsModel> getGoodsSearch(String search);
    List<GoodsModel> getGoodsAll();
    List<GoodsModel> getGoodsGcategory(String sgcategory,String search);
    List<GoodsModel> getGoodsPrice(double down,double up,String search);
    List<GoodsModel> getGoodsTime(String search);
}
