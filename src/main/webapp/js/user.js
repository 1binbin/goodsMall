// 轮播图
window.onload = function () {
    var box = this.document.getElementById("re");
    var lik = box.getElementsByTagName("li");

    function fun(i, j) {//转换图片函数，就是把透明度改了一下
        lik[i].style.opacity = 1;
        lik[j].style.opacity = 0;
        lik[i + 8].style.backgroundColor = "#ffffff";//改一下小图标
        lik[j + 8].style.backgroundColor = "#00000000"
    }

    fun(0, 1);//初始化下
    var i = 0;

    function auto() {//轮播循环函数
        if (++i >= 8) {
            i = 0;
            fun(0, 7);
        } else fun(i, i - 1);
    }

    timer = this.setInterval(auto, 3000);
    box.onmouseover = function () { //鼠标划上去，停止轮播
        clearInterval(timer);
    }
    box.onmouseout = function () { //鼠标划出，继续轮播
        timer = setInterval(auto, 3000); //调用定时器
    }
    var j = 0;
    for (; j < 8; j++) {//点击小图标也可以转换图片
        lik[j + 8].ind = j;
        lik[j + 8].onclick = function () {
            fun(this.ind, i)
            i = this.ind;
        }
    }
}
//页面滚动效果
window.addEventListener("scroll", function () {
    var scrollTop = document.body.scrollTop || document.documentElement.scrollTop;
    if (scrollTop >= 45){
        document.getElementById("search").className = "searchfix";
    }else {
        document.getElementById("search").className = "search";
    }
    if (scrollTop >= 477){
        document.getElementById("nav").className = "nav";
    }else {
        document.getElementById("nav").className = "rightnav";
    }
})
function like() {
    document.body.scrollTop = 450;
}