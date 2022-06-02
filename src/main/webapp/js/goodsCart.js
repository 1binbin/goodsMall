window.addEventListener("scroll", function () {
    const scrollTop = document.body.scrollTop || document.documentElement.scrollTop;
    if (scrollTop >= 477) {
        document.getElementById("nav2").className = "nav2";
    } else {
        document.getElementById("nav2").className = "rightnav2";
    }
})

function isChecked(e, id, id1,n) {
    //总价
    var price = Number(document.getElementById("price").innerText.substr(1,));
    if (e.checked) {
        price += Number(document.getElementById("allprice"+n).innerText.substr(1,));
        document.getElementById(id).style.backgroundColor = 'rgba(255,148,136,0.5)';
    } else {
        price -= Number(document.getElementById("allprice"+n).innerText.substr(1,));
        document.getElementById(id).style.backgroundColor = '#fff';
        document.getElementById(id1).checked = false;
    }
    document.getElementById("price").innerText = "￥" + price;
}

function isChecked1(e, classname, id1,n) {
    var price = Number(document.getElementById("price").innerText.substr(1,));
    var sumprice = document.getElementsByClassName(n);
    const ele = document.getElementsByClassName(classname);
    const ele1 = document.getElementsByClassName(id1);
    const num = ele.length;
    if (e.checked) {
        for (let i = 0; i < sumprice.length; i++) {
            price += Number(sumprice[i].innerHTML.substr(1,));
        }
        for (let i = 0; i < num; i++) {
            ele[i].style.backgroundColor = 'rgba(255,148,136,0.5)';
            ele1[i].checked = true;
        }
    } else {
        for (let i = 0; i < sumprice.length; i++) {
            price -= Number(sumprice[i].innerHTML.substr(1,));
        }
        for (let i = 0; i < num; i++) {
            ele[i].style.backgroundColor = '#fff';
            ele1[i].checked = false;
        }
    }
    document.getElementById("price").innerText = "￥" + price;
}

function setPrice(n4) {
    const allprice = document.getElementsByClassName(n4);
    let sum = 0;
    for (let i = 0; i < allprice.length; i++) {
        sum += Number(allprice[i].innerHTML.substr(1,));
    }
    document.getElementById("price").innerText = "￥" + sum;
}

function allChecked(e, name1, n2, n3, n4) {
    const ele = document.getElementsByClassName(name1);
    const num = ele.length;
    if (e.checked) {
        setPrice(n4)
        for (let i = 0; i < num; i++) {
            ele[i].checked = true;
            isChecked1(ele[i], n2, n3);
        }
    } else {
        document.getElementById("price").innerText = "￥0.0";
        for (let i = 0; i < num; i++) {
            ele[i].checked = false;
            isChecked1(ele[i], n2, n3);
        }
    }
}

function downnum(n) {
    let numprice = Number(document.getElementById("price").innerText.substr(1,));
    const allprice = document.getElementById("allprice" + n);
    const price = Number(document.getElementById("price" + n).innerText.substr(1,));
    const num = document.getElementById(n).value;
    if (Number(num) - 1 >= 1) {
        if (document.getElementById("checkedGoods"+n).checked){
            numprice -= price;
            document.getElementById("price").innerText = "￥"+numprice;
        }
        document.getElementById(n).value = Number(num) - 1;
    } else {
        document.getElementById(n).value = 1;
    }
    allprice.innerText = '￥' + (document.getElementById(n).value * price);
}

function upnum(n) {
    let numprice = Number(document.getElementById("price").innerText.substr(1,));
    const allprice = document.getElementById("allprice" + n);
    const price = Number(document.getElementById("price" + n).innerText.substr(1,));
    const num = document.getElementById(n).value;
    if (Number(num) + 1 <= 1000) {
        if (document.getElementById("checkedGoods"+n).checked){
            numprice += price;
            document.getElementById("price").innerText = "￥"+numprice;
        }
        document.getElementById(n).value = Number(num) + 1;
    } else {
        document.getElementById(n).value = 1000;
    }
    allprice.innerText = '￥' + (document.getElementById(n).value * price);
}