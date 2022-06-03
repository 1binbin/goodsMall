<%--
  Created by IntelliJ IDEA.
  Author: hongxiaobin
  User: hongxiaobin
  Date: 2022/6/3
  Time: 15:45
  Description: 
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
    <head>
        <%
            String path = request.getContextPath();
        %>
        <title>Title</title>
        <link rel="stylesheet" href="">
    </head>
    <body>
        <div class="cart">
            <div class="cart-top">
                <input type="checkbox" id="checked0"
                                         onclick="isChecked1(this,'goods0','goodsChecked0','allprice0')"
                                         class="employee">
                <label for="checked0">快乐店铺</label>
                <div class="cart-goods">
                    <div class="goods goods0" id="goods00"><input type="checkbox" id="checkedGoodsnum00"
                                                                  class="goodsChecked0 allGoods 15875195553 131231241123"
                                                                  onclick="isChecked(this,'goods00','checked0','num00')">
                        <div class="goods-img"
                             onclick="window.open('/GoodsMall/jsp/user/goodsDetails.jsp?eid=15875195553&gid=131231241123')">
                            <img alt="暂无图片" src="/GoodsMall/Product_main_photo/15875195553/131231241123.jpg"
                                 title="点击查看详情"></div>
                        <span class="text">衣服 | 好看的衣服</span><span class="price" id="pricenum00">￥222</span>
                        <div class="goods-num">
                            <button onclick="downnum('num00')">-</button>
                            <input type="text" min="1" value="1" id="num00" disabled="disabled"
                                   class="15875195553-131231241123">
                            <button onclick="upnum('num00')">+</button>
                        </div>
                        <span class="allprice allprice0" id="allpricenum00">￥222</span><a href="" class="delete">删除</a>
                    </div>

                    <div class="goods goods0" id="goods01"><input type="checkbox" id="checkedGoodsnum01"
                                                                  class="goodsChecked0 allGoods 15875195553 341"
                                                                  onclick="isChecked(this,'goods01','checked0','num01')">
                        <div class="goods-img"
                             onclick="window.open('/GoodsMall/jsp/user/goodsDetails.jsp?eid=15875195553&gid=341')"><img
                                alt="暂无图片" src="/GoodsMall/Product_main_photo/15875195553/341.jpg" title="点击查看详情"></div>
                        <span class="text">衣服 | 好看的衣服</span><span class="price" id="pricenum01">￥222</span>
                        <div class="goods-num">
                            <button onclick="downnum('num01')">-</button>
                            <input type="text" min="1" value="1" id="num01" disabled="disabled" class="15875195553-341">
                            <button onclick="upnum('num01')">+</button>
                        </div>
                        <span class="allprice allprice0" id="allpricenum01">￥222</span><a href="" class="delete">删除</a>
                    </div>

                    <div class="goods goods0" id="goods02"><input type="checkbox" id="checkedGoodsnum02"
                                                                  class="goodsChecked0 allGoods 15875195553 4211321"
                                                                  onclick="isChecked(this,'goods02','checked0','num02')">
                        <div class="goods-img"
                             onclick="window.open('/GoodsMall/jsp/user/goodsDetails.jsp?eid=15875195553&gid=4211321')">
                            <img alt="暂无图片" src="/GoodsMall/Product_main_photo/15875195553/4211321.jpg" title="点击查看详情">
                        </div>
                        <span class="text">衣服 | 好看的衣服</span><span class="price" id="pricenum02">￥222</span>
                        <div class="goods-num">
                            <button onclick="downnum('num02')">-</button>
                            <input type="text" min="1" value="1" id="num02" disabled="disabled"
                                   class="15875195553-4211321">
                            <button onclick="upnum('num02')">+</button>
                        </div>
                        <span class="allprice allprice0" id="allpricenum02">￥222</span><a href="" class="delete">删除</a>
                    </div>

                    <div class="goods goods0" id="goods03"><input type="checkbox" id="checkedGoodsnum03"
                                                                  class="goodsChecked0 allGoods 15875195553 54"
                                                                  onclick="isChecked(this,'goods03','checked0','num03')">
                        <div class="goods-img"
                             onclick="window.open('/GoodsMall/jsp/user/goodsDetails.jsp?eid=15875195553&gid=54')"><img
                                alt="暂无图片" src="/GoodsMall/Product_main_photo/15875195553/54.jpg" title="点击查看详情"></div>
                        <span class="text">衣服 | 好看的衣服</span><span class="price" id="pricenum03">￥222</span>
                        <div class="goods-num">
                            <button onclick="downnum('num03')">-</button>
                            <input type="text" min="1" value="1" id="num03" disabled="disabled" class="15875195553-54">
                            <button onclick="upnum('num03')">+</button>
                        </div>
                        <span class="allprice allprice0" id="allpricenum03">￥222</span><a href="" class="delete">删除</a>
                    </div>

                    <div class="goods goods0" id="goods04"><input type="checkbox" id="checkedGoodsnum04"
                                                                  class="goodsChecked0 allGoods 15875195553 976"
                                                                  onclick="isChecked(this,'goods04','checked0','num04')">
                        <div class="goods-img"
                             onclick="window.open('/GoodsMall/jsp/user/goodsDetails.jsp?eid=15875195553&gid=976')"><img
                                alt="暂无图片" src="/GoodsMall/Product_main_photo/15875195553/976.jpg" title="点击查看详情"></div>
                        <span class="text">衣服 | 好看的衣服</span><span class="price" id="pricenum04">￥222</span>
                        <div class="goods-num">
                            <button onclick="downnum('num04')">-</button>
                            <input type="text" min="1" value="1" id="num04" disabled="disabled" class="15875195553-976">
                            <button onclick="upnum('num04')">+</button>
                        </div>
                        <span class="allprice allprice0" id="allpricenum04">￥222</span><a href="" class="delete">删除</a>
                    </div>

                </div>
            </div>
        </div>
    </body>
</html>
