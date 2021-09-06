<%--
  Created by IntelliJ IDEA.
  User: JayZhao
  Date: 2021/8/15
  Time: 16:31
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
    pageContext.setAttribute("PATH", request.getContextPath());
%>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>员工列表</title>

    <!-- jQuery (Bootstrap 的所有 JavaScript 插件都依赖 jQuery，所以必须放在前边) -->
    <script src="${PATH}/static/js/jquery-3.5.1.min.js"></script>
    <!-- Bootstrap -->
    <link rel="stylesheet" href="${PATH}/static/bootstrap-3.4.1-dist/css/bootstrap.min.css">

    <%--    new style--%>
    <link href="${PATH}/static/new-1.0-resources/css/style.css" rel="stylesheet" type="text/css" media="all"/>
    <!--// Common Css -->
    <!-- Nav Css -->
    <link rel="stylesheet" href="${PATH}/static/new-1.0-resources/css/style4.css">
    <!--// Nav Css -->
    <!-- Fontawesome Css -->
    <link href="${PATH}/static/new-1.0-resources/css/fontawesome-all.css" rel="stylesheet">
    <!-- 加载 Bootstrap 的所有 JavaScript 插件。你也可以根据需要只加载单个插件。 -->
    <script src="${PATH}/static/bootstrap-3.4.1-dist/js/bootstrap.min.js"></script>
</head>
<body>

<%--添加用户模态框--%>
<div class="modal fade" id="userAdd" tabindex="-1" role="dialog">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title">添加用户</h4>
            </div>
            <div class="modal-body">

<%--                用户表单--%>
                <form class="form-horizontal">

                    <div class="form-group">
                        <label for="inputUsername" class="col-sm-2 control-label">姓名</label>
                        <div class="col-sm-10">
                            <input type="text" name="uUsername" class="form-control" id="inputUsername" placeholder="姓名">
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="inputCode" class="col-sm-2 control-label">编号</label>
                        <div class="col-sm-10">
                            <input type="text" name="uCode" class="form-control" id="inputCode" placeholder="输入编号">
                        </div>
                    </div>

                    <div class="form-group">
                    <label for="inputPhone" class="col-sm-2 control-label">电话</label>
                    <div class="col-sm-10">
                        <input type="text" name="uPhone" class="form-control" id="inputPhone" placeholder="电话">
                    </div>
                </div>

                    <div class="form-group">
                    <label for="inputPositionCode" class="col-sm-2 control-label">职位代号</label>
                    <div class="col-sm-10">
                        <input type="text" name="uPosition" class="form-control" id="inputPositionCode" placeholder="职位代号（如：103)">
                    </div>
                </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-warning" data-dismiss="modal">取消</button>
                <button type="button" class="btn btn-primary">提交</button>
            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal-dialog -->
</div><!-- /.modal -->


<%--使用bootstrap搭建布局 为四行--%>
<div class="container">
    <%--    标题--%>
    <div class="row">
        <div class="col-lg-12">
            <h1 style="font-family: 'microsoft yahei', sans-serif">员工列表</h1>
        </div>
    </div>
    <%--    按钮--%>
    <div class="row">
        <div class="col-md-4 col-md-offset-8 text-center text-center">
            <button id="btn_add" type="button" class="btn-success btn-sm">新增</button>
            <button type="button" class="btn-warning btn-sm">删除</button>
        </div>
    </div>
    <%--    列表--%>
    <div class="row">
        <div class="col-md-12">
            <table class="col-md-12 table table-striped table-dark" id="user_table">
                <thead>
                <tr class="success">
                    <th class="text-center">#</th>
                    <th class="text-center">姓名</th>
                    <th class="text-center">代号</th>
                    <th class="text-center">密码</th>
                    <th class="text-center">电话</th>
                    <th class="text-center">职位代号</th>
                    <th class="text-center">职位名称</th>
                    <th class="text-center">入职时间</th>
                    <th class="text-center">离职时间</th>
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
</div>
<script type="application/javascript">

    //新增员工按钮方法
    $("#btn_add").click(function () {
        $("#userAdd").modal({
            backdrop:"static"
        })
    })

    <%--    ajax动态请求列表数据--%>
    $(function () {
        to_page(1);
    });

    //跳转方法
    function to_page(page_num) {
        $.ajax({
            url: "${PATH}/user",
            data: "page="+page_num,
            type: "POST",
            success: function (result) {
                build_user_list(result);
                build_page_list(result);
                build_sli_list(result);
            }
        });
    }

    //解析user列表信息并显示
    function build_user_list(result) {
        $("#user_table tbody").empty();
        var users = result.dataInfo.pageInfo.list;
        $.each(users, function (index, item) {
            var userId = $("<td></td>").addClass("text-center").append(item.uId);
            var userName = $("<td></td>").addClass("text-center").append(item.uUsername);
            var userCode = $("<td></td>").addClass("text-center").append(item.uCode);
            var userPassword = $("<td></td>").addClass("text-center").append(item.uPassword);
            var userPhone = $("<td></td>").addClass("text-center").append(item.uPhone);
            var userPositionCode = $("<td></td>").addClass("text-center").append(item.uPosition);
            var userPositionName = $("<td></td>").addClass("text-center").append(item.uPositionName.pName);
            var userStart = $("<td></td>").addClass("text-center").append(item.uTimeStart == null ? "无" : item.uTimeStart);
            var userEnd = $("<td></td>").addClass("text-center").append(item.uTimeEnd == null ? "无" : item.uTimeStart);

            /*<th class="text-center">
                            <button type="button" class="btn-success btn-xs">
                                <span class="glyphicon glyphicon-pencil" aria-hidden="true"></span>
                                修改
                            </button>
                            <button type="button" class="btn-warning btn-xs">
                                <span class="glyphicon glyphicon-remove" aria-hidden="true"></span>
                                删除
                            </button>
                        </th>*/
            var btn_reset = $("<button></button>").addClass("btn-success btn-xs").append($("<span></span>").addClass("glyphicon glyphicon-pencil")).append("修改");
            var btn_del = $("<button></button>").addClass("btn-warning btn-xs").append($("<span></span>").addClass("glyphicon glyphicon-remove")).append("删除");

            var userOperation = $("<td></td>").addClass("text-center").append(btn_reset).append(" ").append(btn_del);

            $("<tr></tr>").append(userId)
                .append(userName)
                .append(userCode)
                .append(userPassword)
                .append(userPhone)
                .append(userPositionCode)
                .append(userPositionName)
                .append(userStart)
                .append(userEnd)
                .append(userOperation)
                .appendTo("#user_table tbody");
        })
    }

    //解析分页信息，并显示
    function build_page_list(result) {
        $("#user_page_msg").empty();

        var total = result.dataInfo.pageInfo.total;
        var pageSize = result.dataInfo.pageInfo.pageSize;
        var pageNum = result.dataInfo.pageInfo.pageNum;
        /*<div class="col-md-6">

        </div>*/
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
        }else {

        pageFirst.click(function(){
            to_page(1)
        })
        pagePer.click(function(){
            if (result.dataInfo.pageInfo.hasPreviousPage){
            to_page(result.dataInfo.pageInfo.prePage)
            }
        })
        }
        var pagelast = $("<li></li>").append($("<a></a>").append("尾页").attr("href", "#"));
        var pageNext = $("<li></li>").append($("<a></a>").attr("href", "#").append($("<span></span>").append("&raquo;")));
        if (result.dataInfo.pageInfo.isLastPage == true) {
            pagelast.addClass("disabled");
            pageNext.addClass("disabled");
        }else {

        pagelast.click(function(){
            to_page(result.dataInfo.pageInfo.pageSize)
        })
        pageNext.click(function(){
            if (result.dataInfo.pageInfo.hasNextPage){

            to_page(result.dataInfo.pageInfo.nextPage)
            }
        })
        }
        pageUl.append(pageFirst).append(pagePer);

        $.each(result.dataInfo.pageInfo.navigatepageNums, function (index, item) {
            var pageNow = $("<li></li>").append($("<a></a>").append(item).attr("href", "#"));
            if (result.dataInfo.pageInfo.pageNum == item) {
                pageNow.addClass("active");
            }
            pageNow.click(function () {
                to_page(item);
            });
            pageUl.append(pageNow)
        });

        pageUl.append(pageNext).append(pagelast);

        var pageNav = $("<nav></nav>").append(pageUl);

        pageNav.appendTo($("#user_sli_msg"));
    }

</script>
</body>
</html>
