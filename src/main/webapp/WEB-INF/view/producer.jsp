<%--
  Created by IntelliJ IDEA.
  User: JayZhao
  Date: 2021/8/22
  Time: 17:09
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    pageContext.setAttribute("PATH", request.getContextPath());
%>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>产品列表</title>

    <!-- jQuery (Bootstrap 的所有 JavaScript 插件都依赖 jQuery，所以必须放在前边) -->
    <script src="${PATH}/static/js/jquery-3.5.1.min.js"></script>
    <!-- Bootstrap -->
    <link rel="stylesheet" href="${PATH}/static/bootstrap-3.4.1-dist/css/bootstrap.min.css">
    <!-- 加载 Bootstrap 的所有 JavaScript 插件。你也可以根据需要只加载单个插件。 -->
    <script src="${PATH}/static/bootstrap-3.4.1-dist/js/bootstrap.min.js"></script>
</head>
<body>

<%--添加模态框--%>
<div class="modal fade" id="modalAdd" tabindex="-1" role="dialog">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span>
                </button>
                <h4 class="modal-title">选择</h4>
                <h3 style="color: #ff0005" id="msg"></h3>
            </div>
            <div class="modal-body">

                <%--                用户表单--%>
                <form class="form-horizontal">

                    <div class="form-group" hidden="hidden">
                        <div class="col-sm-10">
                            <%--                            <input type="text" name="cutNum" class="form-control" id="inputCutNUm" placeholder="刀次">--%>
                            <h6 class="form-control-static" id="selectedId"></h6>
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="selectedCutNUm" class="col-sm-2 control-label">刀次</label>
                        <div class="col-sm-10">
                            <%--                            <input type="text" name="cutNum" class="form-control" id="inputCutNUm" placeholder="刀次">--%>
                            <p class="form-control-static" id="selectedCutNUm">第  刀</p>
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="selectedStyle" class="col-sm-2 control-label">款式</label>
                        <div class="col-sm-10">
                            <%--                            <input type="text" name="style" class="form-control" id="inputStyle" placeholder="男/女款">--%>
                            <%--                            <select id="selectStyle" class="form-control col-sm-2">--%>
                            <%--                                <option>--选择款式--</option>--%>
                            <%--                            </select>--%>
                            <p class="form-control-static" id="selectedStyle">式</p>
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="selectedColor" class="col-sm-2 control-label">颜色</label>
                        <div class="col-sm-10">
                            <%--                            <input type="text" name="style" class="form-control" id="inputStyle" placeholder="男/女款">--%>
                            <%--                            <select id="selectColor" class="form-control col-sm-2">--%>
                            <%--                                <option>--选择颜色--</option>--%>
                            <%--                            </select>--%>
                            <p class="form-control-static" id="selectedColor">色</p>
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="selectedSize" class="col-sm-2 control-label">型号</label>
                        <div class="col-sm-10">
                            <%--                            <input type="text" name="style" class="form-control" id="inputStyle" placeholder="男/女款">--%>
                            <%--                            <select id="selectSize" class="form-control col-sm-2">--%>
                            <%--                                <option>--选择型号--</option>--%>
                            <%--                            </select>--%>
                            <p class="form-control-static" id="selectedSize">号</p>
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="selectedCount" class="col-sm-2 control-label">数量</label>
                        <div class="col-sm-10">
                            <%--                            <input type="text" name="count" class="form-control" id="inputCount" placeholder="数量">--%>
                            <p class="form-control-static" id="selectedCount">件</p>

                        </div>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-warning" data-dismiss="modal">取消</button>
                <button type="button" class="btn btn-primary" id="btn_submit">确认选择</button>
            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal-dialog -->
</div><!-- /.modal -->


<div>
    <%--使用bootstrap搭建布局 为四行--%>
    <div class="container" id="div_show">
        <%--    标题--%>
        <div class="row">
            <div class="col-lg-12">
                <h5 id="h1_session" style="color: #721c24" class="col-md-4 col-md-offset-8 text-center"></h5>
                <h3 style="font-family: 'microsoft yahei', sans-serif" id="date_produce"></h3>
            </div>
        </div>
        <%--    按钮--%>
        <%--        <div class="row">--%>
        <%--            <div class="col-md-4 col-md-offset-8 text-center">--%>
        <%--                <button id="btn_add" type="button" class="btn-success btn-sm col-md-4 col-md-offset-8">新增</button>--%>
        <%--            </div>--%>
        <%--        </div>--%>
        <%--    列表--%>
        <div class="row">
            <div class="col-md-12">
                <table class="col-md-12 table table-striped table-dark" id="user_table">
                    <thead>
                    <tr class="success">
                        <th class="text-center">刀次</th>
                        <th class="text-center">款式</th>
                        <th class="text-center">颜色</th>
                        <th class="text-center">型号</th>
                        <th class="text-center">数量</th>
                        <th class="text-center">操作</th>
                    </tr>
                    </thead>
                    <tbody>

                    </tbody>
                </table>
            </div>
        </div>
        <%--    页码--%>
        <div class="row">
            <%--        查表信息--%>
            <div class="col-md-6" id="user_page_msg">

            </div>
            <%--    分页信息--%>
            <div class="col-md-6 text-right" id="user_sli_msg">

            </div>
        </div>
</body>

<script type="application/javascript">

    //页面渲染时执行查询请求
    $(function () {
        getSession(1);
        getClothes(1);
    })

    //获取系统时间
    $("#date_produce").append(new Date().toLocaleDateString()).append("可选列表")

    //获取登录状态
    function getSession(state) {
        $.ajax({
            url: "${PATH}/processSession",
            type: "GET",
            success: function (result) {
                switch (state) {
                    case 1:
                        if (result.dataInfo.uCode != null) {
                            $("#div_show *").attr("hidden", false);
                            var uCode = result.dataInfo.uCode
                            var uUsername = result.dataInfo.uUsername
                            var uCompany = result.dataInfo.uCompany
                            var uCoName = result.dataInfo.uCoName
                            $("#h1_session").append(uCoName).append(uUsername)
                        } else {
                            window.location.href = "${PATH}/"
                            $("#div_show *").attr("hidden", true);
                        }
                    case 0:
                        if (result.dataInfo.uCode != null) {
                            return;
                        } else {
                            window.location.href = "${PATH}/"
                        }

                }


            }
        })
    }


    //获取解析服装数据列表
    function getClothes(page_num) {
        console.log("获取数据中...")
        $.ajax({
            url: "${PATH}/select/producer",
            data: "page=" + page_num,
            type: "POST",
            success: function (result) {
                build_clothes_list(result);
                build_page_list(result);
                build_sli_list(result);
            }
        })
    }

    //解析服装列表
    function build_clothes_list(result) {
        $("#user_table tbody").empty();
        var clList = result.dataInfo.pageInfo.list
        $.each(clList, function (i, v) {
            var clCom = v.cCompany.coName
            var cId = v.cId
            var cNumCut = $("<td></td>").addClass("text-center").append(v.cNumCut);
            var cType = $("<td></td>").addClass("text-center").append(v.cType.tName);
            var cStyle = $("<td></td>").addClass("text-center").append(v.cStyle.sName);
            var cColor = $("<td></td>").addClass("text-center").append(v.cColor.colName);
            var cSize = $("<td></td>").addClass("text-center").append(v.cSize.siName);
            var cProcessor = $("<td></td>").addClass("text-center").append(v.cUser.processor);
            var cNumCount = $("<td></td>").addClass("text-center").append(v.cNumCount);
            var selectButton = $("<td></td>").addClass("text-center").append($("<button></button>")
                .attr("type", "button")
                .attr("class", "btn-success btn_select")
                .attr("cId", cId)
                .append("选择"));
            $("<tr></tr>").append(cNumCut)
                // .append(cType)
                .append(cStyle)
                .append(cColor)
                .append(cSize)
                // .append(cProcessor)
                .append(cNumCount)
                .append(selectButton)
                .appendTo("#user_table tbody");

        })
    }

    //解析分页信息，并显示
    function build_page_list(result) {
        $("#user_page_msg").empty();

        var total = result.dataInfo.pageInfo.total;
        var pageSize = result.dataInfo.pageInfo.pages;
        var pageNum = result.dataInfo.pageInfo.pageNum;

        $("#user_page_msg")
            .append("总记录数：")
            .append(total).append("<br>")
            .append("第").append(pageNum).append("页").append("<br>")
            .append("共").append(pageSize).append("页");
    }

    //跳转页
    function build_sli_list(result) {

        $("#user_sli_msg").empty();

        var pageUl = $("<ul></ul>").addClass("pagination");

        var pageFirst = $("<li></li>").append($("<a></a>").append("首页").attr("href", "#"));
        var pagePer = $("<li></li>").append($("<a></a>").attr("href", "#").append($("<span></span>").append("&laquo;")));
        if (result.dataInfo.pageInfo.isFirstPage == true) {
            pageFirst.addClass("disabled");
            pagePer.addClass("disabled");
        } else {

            pageFirst.click(function () {
                getClothes(1)
            })
            pagePer.click(function () {
                if (result.dataInfo.pageInfo.hasPreviousPage) {
                    getClothes(result.dataInfo.pageInfo.prePage)
                }
            })
        }
        var pagelast = $("<li></li>").append($("<a></a>").append("尾页").attr("href", "#"));
        var pageNext = $("<li></li>").append($("<a></a>").attr("href", "#").append($("<span></span>").append("&raquo;")));
        if (result.dataInfo.pageInfo.isLastPage == true) {
            pagelast.addClass("disabled");
            pageNext.addClass("disabled");
        } else {

            pagelast.click(function () {
                getClothes(result.dataInfo.pageInfo.pages)
            })
            pageNext.click(function () {
                if (result.dataInfo.pageInfo.hasNextPage) {

                    getClothes(result.dataInfo.pageInfo.nextPage)
                }
            })
        }
        pageUl.append(pageFirst).append(pagePer);

        $.each(result.dataInfo.pageInfo.navigatepageNums, function (index, item) {
            var pageNow = $("<li></li>").append($("<a></a>").append(item).attr("href", "#"));

            if (result.dataInfo.pageInfo.pageNum == item) {
                pageNow.addClass("active");
                //清楚保存的页面信息
                $("#date_produce").removeAttr("current")
                //记录当前页面
                $("#date_produce").attr("current",item)
            }
            pageNow.click(function () {
                getClothes(item);
            });
            pageUl.append(pageNow)
        });

        pageUl.append(pageNext).append(pagelast);

        var pageNav = $("<nav></nav>").append(pageUl);

        pageNav.appendTo($("#user_sli_msg"));
    }

    $(document).on("click", ".btn_select", function () {
        //清空id值
        $("#modalAdd h6").empty()

        var cid = $(this).attr("cId")

        //清空基本信息值
        $("#modalAdd p").empty()

        //添加id值
        $("#selectedId").append(cid)

        $("#modalAdd").modal({
            backdrop: "static"
        })
        $.ajax({
            url:"${PATH}/select_clothes_id",
            data: "cId="+cid,
            type: "POST",
            success:function (result) {
                var cut = result.dataInfo.clothes
                $.each(cut,function (i,v) {
                    $("#selectedCutNUm").append("第 "+v.cNumCut+" 刀")
                    $("#selectedStyle").append(v.cStyle.sName)
                    $("#selectedColor").append(v.cColor.colName+"色")
                    $("#selectedSize").append(v.cSize.siName+"号")
                    $("#selectedCount").append(v.cNumCount+" 件")
                })
            }
        })

    })

    //提交按钮绑定
    $("#btn_submit").click(function () {

        getSession(0)

        var cId = document.getElementById("selectedId").innerText

        $("#msg").empty()
        $.ajax({
            url: "${PATH}/selected_clothes",
            data: "cId="+cId,
            type: "POST",
            success: function (result) {
                if (result.code == 100) {
                    $("#modalAdd").modal("toggle")
                    var page = $("#date_produce").attr("current")
                    console.log(page)
                    getClothes(page)
                } else if (result.code == 200) {
                    $("#msg").append("选择失败")
                }
            }
        })
    })
</script>
</html>
