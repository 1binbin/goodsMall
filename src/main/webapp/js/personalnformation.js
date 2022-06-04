function person(n) {
    if (n ===1){
        document.getElementById("personalnformation").style.display = "flex";
    }
    if (n===2){
        document.getElementById("personalnformation").style.display = "none";
    }
}
function okupdate() {
    document.getElementById("q").style.display = "none";
    document.getElementById("w").style.display = "block";
    document.getElementById("cid").removeAttribute("readonly");
    document.getElementById("cname").removeAttribute("readonly");
    document.getElementById("cnickname").removeAttribute("readonly");
    document.getElementById("nan").removeAttribute("readonly");
    document.getElementById("nv").removeAttribute("readonly")
}