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