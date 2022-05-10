package com.business;

import com.entity.GoodsModel;

import java.util.List;

/**
 * @Author hongxiaobin
 * @Time 2022/3/20-15:37
 * @Description 实现业务逻辑层
 */
public class GoodsEbiEmpl implements GoodsEbi {

    @Override
    public boolean insertGoods(GoodsModel goodsModel) {
//        判断商品是否存在
        List<GoodsModel> goodsModel1 = Daofactory.getgoodsdaoimpl().getGoods(goodsModel.getGid());
        if (goodsModel1.isEmpty()) {
            Daofactory.getgoodsdaoimpl().insertGoods(goodsModel);
            return true;
        } else {
            return false;
        }
    }

    @Override
    public boolean deleteGoods(String isbn) {
//        判断图书是否存在
        List<GoodsModel> goodsModel1 = Daofactory.getgoodsdaoimpl().getGoods(isbn);
        if (!goodsModel1.isEmpty()) {
            Daofactory.getgoodsdaoimpl().deleteGoods(isbn);
            return true;
        } else {
            return false;
        }
    }

    @Override
    public boolean updateGoods(GoodsModel goodsModel) {
        //        判断商品是否存在
        List<GoodsModel> goodsModel1 = Daofactory.getgoodsdaoimpl().getGoods(goodsModel.getGid());
        if (!goodsModel1.isEmpty()) {
            Daofactory.getgoodsdaoimpl().update(goodsModel);
            return true;
        } else {
            return false;
        }
    }

    @Override
    public List<GoodsModel> selectGoods(String isbn) {
        return Daofactory.getgoodsdaoimpl().getGoods(isbn);
    }

    @Override
    public List<GoodsModel> selectGoodsGname(String gname) {
        return Daofactory.getgoodsdaoimpl().getGoodsGname(gname);
    }

    @Override
    public List<GoodsModel> selectGoodsGcategory(String gcategory) {
        return Daofactory.getgoodsdaoimpl().getGoodsGcategory(gcategory);
    }

    @Override
    public List<GoodsModel> selectGoodsAll(String all) {
        return Daofactory.getgoodsdaoimpl().getGoodsAll(all);
    }

    @Override
    public List<GoodsModel> selectGoodsList() {
        return Daofactory.getgoodsdaoimpl().getGoodslist();
    }
}
