package com.business;

import com.business.businessimplement.GoodsEbi;
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
        List<GoodsModel> goodsModel1 = Daofactory.getgoodsdaoimpl().getGoods(isbn, eid);
        if (!goodsModel1.isEmpty()) {
            Daofactory.getgoodsdaoimpl().deleteGoods(isbn, eid);
            return true;
        } else {
            return false;
        }
    }

    @Override
    public boolean updateGoods(GoodsModel goodsModel) {
        //        判断商品是否存在
        List<GoodsModel> goodsModel1 = Daofactory.getgoodsdaoimpl().getGoods(goodsModel.getGid(), goodsModel.getEid());
        if (!goodsModel1.isEmpty()) {
            Daofactory.getgoodsdaoimpl().update(goodsModel);
            return true;
        } else {
            return false;
        }
    }

    @Override
    public List<GoodsModel> selectGoods(String isbn, String eid) {
        return Daofactory.getgoodsdaoimpl().getGoods(isbn, eid);
    }

    @Override
    public List<GoodsModel> selectGoodsGname(String gname, String eid, int start, int end) {
        return Daofactory.getgoodsdaoimpl().getGoodsGname(gname, eid, start, end);
    }

    @Override
    public List<GoodsModel> selectGoodsGid(String gname, String eid, int start, int end) {
        return Daofactory.getgoodsdaoimpl().getGoodsGid(gname, eid, start, end);
    }

    @Override
    public List<GoodsModel> selectGoodsGcategory(String gcategory, String eid, int start, int end) {
        return Daofactory.getgoodsdaoimpl().getGoodsGcategory(gcategory, eid, start, end);
    }

    @Override
    public List<GoodsModel> selectGoodsAll(String all, String eid, int start, int end) {
        return Daofactory.getgoodsdaoimpl().getGoodsAll(all, eid, start, end);
    }

    @Override
    public List<GoodsModel> selectGoodsList(String eid, int start, int end) {
        return Daofactory.getgoodsdaoimpl().getGoodslist(eid, start, end);
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

    @Override
    public List<GoodsModel> getGidEid(String gid, String eid) {
        return Daofactory.getgoodsdaoimpl().getGidEid(gid, eid);
    }

    @Override
    public List<GoodsModel> getGoodsSearch(String search) {
        return Daofactory.getgoodsdaoimpl().getGoodsSearch(search);
    }

    @Override
    public List<GoodsModel> getGoodsAll() {
        return Daofactory.getgoodsdaoimpl().getGoodsAll();
    }

    @Override
    public List<GoodsModel> getGoodsGcategory(String sgcategory,String search) {
        return Daofactory.getgoodsdaoimpl().getGoodsGcategory(sgcategory,search);
    }

    @Override
    public List<GoodsModel> getGoodsPrice(double down, double up, String search) {
        return Daofactory.getgoodsdaoimpl().getGoodsPrice(down, up, search);
    }

    @Override
    public List<GoodsModel> getGoodsTime(String search) {
        return Daofactory.getgoodsdaoimpl().getGoodsTime(search);
    }

    @Override
    public List<GoodsModel> gteGcategory(String search) {
        return Daofactory.getgoodsdaoimpl().getGcategory(search);
    }

    @Override
    public List<GoodsModel> likeGoods(String cid) {
        return Daofactory.getgoodsdaoimpl().likeGoods(cid);
    }

    @Override
    public void setGoods(String gid, String eid, int num) {
        Daofactory.getgoodsdaoimpl().setGoods(gid,eid,num);
    }
}
