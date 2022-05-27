function check(form) {
    //    商品编号输入框不为空
    if (form.gid.value === "") {
        alert("商品编号为空");
        form.gid.focus();
        return false;
    }
    //    验证价格最多两位小数
    var regu = /^(([0-9]+)|([0-9]+\.[0-9]{0,2}))$/;
    if (form.gprice.value !== "" && !regu.test(form.gprice.value)) {
        alert("价格请输入最多两位小数的非负数");
        form.gprice.focus();
        return false;
    }
    if (form.ginprice.value !== "" && !regu.test(form.ginprice.value)) {
        alert("价格请输入最多两位小数的非负数");
        form.ginprice.focus();
        return false;
    }
    //    验证数量为非负数
    var regu1 = /^\d+$/
    if (form.gnum.value !== "" && !regu1.test(form.gnum.value)) {
        alert("库存量请输入非负整数")
        form.gnum.focus();
        return false;
    }
}

function deleteCheck(deleteGid) {
    if (window.confirm("确定删除以下商品？\n商品编号：" + deleteGid)) {
        window.open("<%=path%>/adminServlet?action=delete&gid=" + deleteGid, "_self")
    }
}

//    搜索
function selectSearch() {
    var selectText = document.getElementById("select").value;
    var myselect = document.getElementById("selecteange");
    var index = myselect.selectedIndex;
    var url = "<%=path%>/adminServlet?action=select&selectGid=" + selectText + "&selectOption=" + myselect.options[index].value;
    window.open(url, "_self");
}

//    刷新
function allGoods() {
    window.open("<%=path%>/adminServlet?action=all", "_self")
}

function outlogin() {
    if (window.confirm("确定是否退出登录？")) {
        window.open("<%=path%>/jsp/index.jsp", "_self")
    }
}

const first = document.getElementById("first")
const second = document.getElementById("second")
const third = document.getElementById("third")
const fourth = document.getElementById("fourth")
const a = document.getElementById("a")
const b = document.getElementById("b")
const c = document.getElementById("c")
const d = document.getElementById("d")
const updatebottom = document.getElementById("updatebottom")
const addbottom = document.getElementById("addbottom")
const showimg = document.getElementById("showimg")

function bOnclick() {
    second.style.display = "block";
    third.style.display = "none";
    fourth.style.display = "none";
}

function cOnclick() {
    second.style.display = "none";
    third.style.display = "block";
    fourth.style.display = "none";
}

function dOnclick() {
    second.style.display = "none";
    third.style.display = "none";
    fourth.style.display = "block";
}

function update(gid, gname, gcategory, gnum, ginprice, gpeice, gdescribe) {
    updatebottom.style.transform = "scaleX(1)"
    document.getElementById("img1").src = "<%=path%>/Product_main_photo/<%=name%>/" + gid + ".jpg";
    document.getElementById("ugid").value = gid;
    document.getElementById("ugname").value = gname;
    document.getElementById("ugnum").value = gnum;
    document.getElementById("uginprice").value = ginprice;
    document.getElementById("ugprice").value = gpeice;
    document.getElementById("ugcategory").value = gcategory;
    document.getElementById("ugdescribe").value = gdescribe;
}

function reset() {
    updatebottom.style.transform = "scaleX(0)"
}

function resetImg() {
    showimg.style.transform = "scaleY(0)"
}

//图片更新
function showImg(cell) {
    document.getElementById('img').src = window.URL.createObjectURL(cell.files[0]);
}

function showImg1(cell) {
    document.getElementById('img1').src = window.URL.createObjectURL(cell.files[0]);
}

function showgoodsimg(gid, gdescribe) {
    document.getElementById("img2").src = "<%=path%>/Product_main_photo/<%=name%>/" + gid + ".jpg";
    if (gdescribe != null) {
        document.getElementById("goodsImgtextarea").value = gdescribe;
    }
    showimg.style.transform = "scaleY(1)"
}

function isCheck(e) {
    if (e.checked) {
        addbottom.style.transform = "scaleX(1)"
    } else {
        addbottom.style.transform = "scaleX(0)"
    }
}
function showgoods() {
    var selectText = document.getElementById("select").value;
    var myselect = document.getElementById("selecteange");
    var index = myselect.selectedIndex;
    var url = "<%=path%>/adminServlet?action=select&selectGid=" + selectText + "&selectOption=" + myselect.options[index].value;
    let xml = new XMLHttpRequest();
    xml.open("get", url, true)
    xml.onreadystatechange = function () {
        if (xml.readyState === 4 && xml.status === 200) {
            let vals = xml.responseText;
            let jsonArr = eval(vals);
            let temp = '';
            let table = document.getElementById("goodstable");
            for (let goods of jsonArr) {
                const a = "showgoodsimg('" + goods.gid + "','" + goods.gdescribe + "')";
                const b = "deleteCheck('" + goods.gid + "')";
                const c = "update('" + goods.gid + "','" + goods.gname + "','" + goods.gcategory + "','" + goods.gnum + "','" + goods.ginprice + "','" + goods.gprice + "')";
                temp +=
                    '<tr>' +
                    '<td>' + goods.gid + '</td>' +
                    '<td>' + goods.gname + '</td>' +
                    '<td>' + goods.gcategory + '</td>' +
                    '<td>' + goods.gnum + '</td>' +
                    '<td>' + goods.ginprice + '</td>' +
                    '<td>' + goods.gprice + '</td>' +
                    '<td onclick=' + a + '><i class="fa fa-info-circle" aria-hidden="true"></i></td>' +
                    '<td onclick=' + b + '><i class="fa fa-trash-o" aria-hidden="true"></i></td>' +
                    '<td onclick=' + c + '><i class="fa fa-pencil-square-o" aria-hidden="true"></i></td>' +
                    '</tr>'
            }
            table.innerHTML = temp;
        }
    }
    xml.send(null);
}