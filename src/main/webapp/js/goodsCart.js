window.addEventListener("scroll", function () {
    const scrollTop = document.body.scrollTop || document.documentElement.scrollTop;
    if (scrollTop >= 477){
        document.getElementById("nav2").className = "nav2";
    }else {
        document.getElementById("nav2").className = "rightnav2";
    }
})

function isChecked(e, id,id1) {
    if (e.checked) {
        document.getElementById(id).style.backgroundColor = 'rgba(255,148,136,0.5)';
    } else {
        document.getElementById(id).style.backgroundColor = '#fff';
        document.getElementById(id1).checked = false;
    }
}
function isChecked1(e,classname,id1) {
    const ele = document.getElementsByClassName(classname);
    const ele1 = document.getElementsByClassName(id1);
    const num = ele.length;
    if (e.checked) {
        for (let i = 0; i < num; i++) {
            ele[i].style.backgroundColor = 'rgba(255,148,136,0.5)';
            ele1[i].checked = true;
        }
    } else {
        for (let i = 0; i < num; i++) {
            ele[i].style.backgroundColor = '#fff';
            ele1[i].checked = false;
        }
    }
}
function allChecked(e,name1,n2,n3) {
    const ele = document.getElementsByClassName(name1);
    const num = ele.length;
    if (e.checked) {
        for (let i = 0; i < num; i++) {
            ele[i].checked = true;
            isChecked1(ele[i],n2,n3);
        }
    } else {
        for (let i = 0; i < num; i++) {
            ele[i].checked = false;
            isChecked1(ele[i],n2,n3);
        }
    }
}

function downnum(n) {
    const num = document.getElementById(n).value;
    if (Number(num) -1 >=1){
        document.getElementById(n).value = Number(num) -1;
    }else {
        document.getElementById(n).value = 1;
    }
}
function upnum(n){
    const num = document.getElementById(n).value;
    if (Number(num) +1 <=1000){
        document.getElementById(n).value = Number(num) + 1 ;
    }else {
        document.getElementById(n).value = 1000 ;
    }
}