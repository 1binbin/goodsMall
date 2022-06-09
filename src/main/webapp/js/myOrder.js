window.addEventListener("scroll", function () {
    const scrollTop = document.body.scrollTop || document.documentElement.scrollTop;
    if (scrollTop >= 477){
        document.getElementById("nav2").className = "nav2";
    }else {
        document.getElementById("nav2").className = "rightnav2";
    }
})
