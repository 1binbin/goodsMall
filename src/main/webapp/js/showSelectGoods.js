window.addEventListener("scroll", function () {
    var scrollTop = document.body.scrollTop || document.documentElement.scrollTop;
    if (scrollTop >= 45){
        document.getElementById("search").className = "searchfix";
    }else {
        document.getElementById("search").className = "search";
    }
    if (scrollTop >= 477){
        document.getElementById("nav1").className = "nav1";
    }else {
        document.getElementById("nav1").className = "rightnav1";
    }
})