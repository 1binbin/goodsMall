function person(id,n,cid,path) {
    if (cid === 'null'){
        window.location.href = path+"/jsp/index.jsp"
    }else {
        if (n ===1){
            document.getElementById(id).style.display = "flex";
        }
        if (n===2){
            document.getElementById(id).style.display = "none";
        }
    }
}
function okupdate() {
    document.getElementById("q").style.display = "none";
    document.getElementById("w").style.display = "block";
    document.getElementById("okButton").removeAttribute("disabled")
    document.getElementById("cname").removeAttribute("readonly");
    document.getElementById("cnickname").removeAttribute("readonly");
    document.getElementById("nan").removeAttribute("readonly");
    document.getElementById("nv").removeAttribute("readonly")
}
function updatePerson(path) {
    var cid = document.getElementById("cid").value;
    var cname = document.getElementById("cname").value;
    var cnickname = document.getElementById("cnickname").value;
    var sex = document.getElementsByClassName("ssex")
    var sex1;
    for (let i = 0; i < sex.length ; i++) {
        if (sex[i].checked){
            sex1 = sex[i].value;
        }
    }
    var url = path +"/customerServlet?action=updatePerson&cid="+cid+"&cname="+cname+"&cnickname="+cnickname+"&cesx="+sex1;
    let xml = new XMLHttpRequest();
    xml.open("get",url,true);
    xml.onreadystatechange = function (){
        if (xml.readyState ===4&& xml.status===200){
            alert("修改成功")
            window.location.reload()
        }
    }
    xml.send(null)
}
function changeAdd(cid,path) {
    var ch = document.getElementsByClassName("radioRadd")
    var radio
    for (let i = 0; i < ch.length; i++) {
        if (ch[i].checked){
            radio = ch[i].value;
        }
    }
    var url
    let xml = new XMLHttpRequest();
    if (radio === "t"){
        var shouhuoren = document.getElementById("shouhuoren").value;
        var shouhuophone = document.getElementById("shouhuophone").value;
        var radd = document.getElementById("radd").value;
        url = path+"/customerServlet?action=updateRadd&rname="+shouhuoren+shouhuophone+"&radd="+radd+"&type=one&cid="+cid;
    }else if (radio === "o"){
        var select = document.getElementById("seelctRadd")
        var index = select.selectedIndex;
        var shouhuoren1 = document.getElementById("shouhuoren1").value;
        var phont1 = document.getElementById("phont1").value;
        var radd1 = document.getElementById("radd1").value;
        url = path+"/customerServlet?action=updateRadd&rname="+shouhuoren1+phont1+"&radd="+radd1+"&type=two&old="+select.options[index].value+"&cid="+cid;
    }
    xml.open("get",url,true)
    xml.onreadystatechange = function (){
        console.log(xml.readyState)
        console.log(xml.status)
        if (xml.readyState ===4 && xml.status===200){
            alert("操作成功")
            window.location.reload()
        }
    }
    xml.send(null)
}