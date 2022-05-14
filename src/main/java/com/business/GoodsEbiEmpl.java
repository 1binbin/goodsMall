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
        List<GoodsModel> goodsModel1 = Daofactory.getgoodsdaoimpl().getGoods(goodsModel.getGid(), goodsModel.getEid());
        if (goodsModel1.isEmpty()) {
            Daofactory.getgoodsdaoimpl().insertGoods(goodsModel);
            return true;
        } else {
            return false;
        }
    }

    @Override
    public boolean deleteGoods(String isbn, String eid) {
//        判断图书是否存在
        List<GoodsModel> goodsModel1 = Daofactory.getgoodsdaoimpl().getGoods(isbn,eid);
        if (!goodsModel1.isEmpty()) {
            Daofactory.getgoodsdaoimpl().deleteGoods(isbn,eid);
            return true;
        } else {
            return false;
        }
    }

    @Override
    public boolean updateGoods(GoodsModel goodsModel) {
        //        判断商品是否存在
        List<GoodsModel> goodsModel1 = Daofactory.getgoodsdaoimpl().getGoods(goodsModel.getGid(),goodsModel.getEid());
        if (!goodsModel1.isEmpty()) {
            Daofactory.getgoodsdaoimpl().update(goodsModel);
            return true;
        } else {
            return false;
        }
    }

    @Override
    public List<GoodsModel> selectGoods(String isbn, String eid) {
        return Daofactory.getgoodsdaoimpl().getGoods(isbn,eid);
    }

    @Override
    public List<GoodsModel> selectGoodsGname(String gname, String eid) {
        return Daofactory.getgoodsdaoimpl().getGoodsGname(gname,eid);
    }

    @Override
    public List<GoodsModel> selectGoodsGcategory(String gcategory, String eid) {
        return Daofactory.getgoodsdaoimpl().getGoodsGcategory(gcategory,eid);
    }

    @Override
    public List<GoodsModel> selectGoodsAll(String all, String eid) {
        return Daofactory.getgoodsdaoimpl().getGoodsAll(all,eid);
    }

    @Override
    public List<GoodsModel> selectGoodsList(String eid) {
        return Daofactory.getgoodsdaoimpl().getGoodslist(eid);
    }

    @Override
    public List<GoodsModel> getdEid() {
        return Daofactory.getgoodsdaoimpl().getdEid();
    }

    @Override
    public List<GoodsModel> getdEidGoods(String eid) {
        return Daofactory.getgoodsdaoimpl().getdEidGoods(eid);
    }

    @Override
    public List<GoodsModel> getGcategory() {
        return Daofactory.getgoodsdaoimpl().getGcategory();
    }

}
