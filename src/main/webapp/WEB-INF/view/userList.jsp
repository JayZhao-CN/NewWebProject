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
            <button type="button" class="btn-success btn-sm">新增</button>
            <button type="button" class="btn-warning btn-sm">删除</button>
        </div>
    </div>
    <%--    列表--%>
    <div class="row">
        <div class="col-md-12">
            <table class="col-md-12 table table-striped table-dark">
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
                <c:forEach items="${pageInfo.list}" var="user">

                    <tr>
                        <th class="text-center">${user.uId}</th>
                        <th class="text-center">${user.uUsername}</th>
                        <th class="text-center">${user.uCode}</th>
                        <th class="text-center">${user.uPassword}</th>
                        <th class="text-center">${user.uPhone}</th>
                        <th class="text-center">${user.uPosition}</th>
                        <th class="text-center">${user.uPositionName.pName}</th>
                        <th class="text-center">${user.uTimeStart == null ? "无" : user.uTimeStart}</th>
                        <th class="text-center">${user.uTimeEnd == null ? "无" : user.uTimeEnd}</th>
                        <th class="text-center">
                            <button type="button" class="btn-success btn-xs">
                                <span class="glyphicon glyphicon-pencil" aria-hidden="true"></span>
                                更新
                            </button>
                            <button type="button" class="btn-warning btn-xs">
                                <span class="glyphicon glyphicon-remove" aria-hidden="true"></span>
                                删除
                            </button>
                        </th>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
        </div>
    </div>
    <%--    页码--%>
    <div class="row">
        <%--        查表信息--%>
        <div class="col-md-6">
            共${pageInfo.pageSize}页<br>
            当前第${pageInfo.pageNum}页<br>
            总记录数：${pageInfo.total}
        </div>
        <%--    分页信息--%>
        <div class="col-md-6 text-right">
            <nav aria-label="Page navigation">
                <ul class="pagination">
                    <c:if test="${pageInfo.isFirstPage}">

                        </li>
                        <li class="disabled">
                            <a href="#">首页</a>
                        </li>
                        <li class="disabled">
                            <a href="#" aria-label="Previous">
                                <span aria-hidden="true">&laquo;</span>
                            </a>
                        </li>
                    </c:if>
                    <c:if test="${!pageInfo.isFirstPage}">
                    <li>
                        <a href="${PATH}/user?page=1">首页</a>
                    </li>
                    <li>
                        <a href="${PATH}/user?page=${pageInfo.pageNum-1}" aria-label="Previous">
                            <span aria-hidden="true">&laquo;</span>
                        </a>

                        </c:if>
                        <c:forEach items="${pageInfo.navigatepageNums}" var="pages">
                        <c:if test="${pages == pageInfo.pageNum}">
                    <li class="active"><a href="#">${pages}</a></li>
                    </c:if>
                    <c:if test="${pages != pageInfo.pageNum}">
                        <li><a href="${PATH}/user?page=${pages}">${pages}</a></li>
                    </c:if>
                    </c:forEach>
                    <c:if test="${pageInfo.isLastPage}">
                        </li>
                        <li class="disabled">
                            <a href="#" aria-label="Next">
                                <span aria-hidden="true">&raquo;</span>
                            </a>
                        </li>
                        <li class="disabled">
                            <a href="#">尾页</a>
                        </li>
                    </c:if>
                    <c:if test="${!pageInfo.isLastPage}">

                        <li>
                            <a href="${PATH}/user?page=${pageInfo.pageNum+1}" aria-label="Next">
                                <span aria-hidden="true">&raquo;</span>
                            </a>
                        </li>
                        <li>
                            <a href="${PATH}/user?page=${pageInfo.pageSize}">尾页</a>
                        </li>
                    </c:if>
                </ul>
            </nav>
        </div>
    </div>
</div>

</body>
</html>
