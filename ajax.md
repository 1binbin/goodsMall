```java
public class t {
    @Override
    protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String name = (String) req.getSession().getAttribute("adminName");
        String eid = name.substring(0, name.length() - 5);
        List<GoodsModel> list = EBofactory.getgoodsebiempl().selectGoodsList(eid);
        JSONArray jsonArray = (JSONArray) JSONObject.toJSON(list);
        //解决中文乱码
        resp.setContentType("text/xml;charset=UTF-8");
        resp.setHeader("Cache-Control", "no-cache");
        resp.setCharacterEncoding("UTF-8");
        PrintWriter printWriter = resp.getWriter();
        printWriter.print(jsonArray);
        System.out.println(jsonArray);
    }
}
```

```javascript
window.onload = function () {
            let xml = new XMLHttpRequest();
            xml.open("get", "<%=path>/adminServlet?action=showgoods", true)
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
```

