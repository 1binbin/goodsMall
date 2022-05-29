window.addEventListener("scroll", function () {
    var scrollTop = document.body.scrollTop || document.documentElement.scrollTop;
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
    var ele = document.getElementsByClassName(classname);
    var ele1= document.getElementsByClassName(id1);
    var num = ele.length;
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
    var ele = document.getElementsByClassName(name1);
    var num = ele.length;
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