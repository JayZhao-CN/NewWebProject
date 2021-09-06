<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%
    pageContext.setAttribute("PATH", request.getContextPath());
%>
<!DOCTYPE html>
<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>美舒雅登录系统</title>

    <!-- jQuery (Bootstrap 的所有 JavaScript 插件都依赖 jQuery，所以必须放在前边) -->
    <script src="${PATH}/static/js/jquery-3.5.1.min.js"></script>

    <link rel="icon" href="${PATH}/static/public/images/managerSystem.ico">
    <link href="${PATH}/static/public/css/base.css" rel="stylesheet" type="text/css">
    <link href="${PATH}/static/public/css/login.css" rel="stylesheet" type="text/css">
</head>
<body id="login_body">

<div class="login">
    <div class="login_form">
        <h1 class="userLogo">美舒雅睡衣 登录系统</h1>
    </div>
    <form action="" method="post" id="form">
        <div class="login_form">
            <div class="user">
                <select class="text_value1" id="login_select">

                </select><br>
                <input class="text_value" type="text" id="login_username" placeholder="账号"><br>
                <input class="text_value" type="password" id="login_password" placeholder="密码"><br>
                <button class="button2" id="login_submit" type="button" onclick="return false">登录</button>

            </div>
        </div>
    </form>
</div>

<script type="application/javascript" >

    <%--    ajax动态请求--%>
    $(function () {
        deleteSession();
        getPositionList();
    });

    //获取登录状态
    function deleteSession() {
        $.ajax({
            url: "${PATH}/deleteSession",
            type: "GET",
            success: function (result) {

            }
        })
    }

    //登录按钮绑定
    $("#login_submit").click(function () {
        var uPosition = $("#login_select option:selected").val()
        var uCode = document.getElementById("login_username").value
        var uPassword = document.getElementById("login_password").value
        if (uPosition != "000" && uCode != "" && uPassword != "") {
            // var patt = /^(\w){6,20}$/
            verifyUser(uPosition,uCode,uPassword)
        } else {
            alert("请完整填写信息！")
        }
    })

    //异步请求职位下拉框列表方法
    function getPositionList() {
        $.ajax({
            url: "${PATH}/positionList",
            type: "GET",
            success: function (result) {
                var positionList = result.dataInfo.positionList
                $("#login_body select").empty()
                $("<option></option>").append("--请选择职位信息--").attr("value", "000").appendTo($("#login_body select"))
                $.each(positionList, function (i, val) {
                    $("<option></option>").append(val.pName).attr("value", val.pCode).appendTo($("#login_body select"))
                })
            }
        });
    }

    //异步请求验证账号
    function verifyUser(uPosition,uCode,uPassword) {
        var param = {"uPosition":uPosition,"uCode":uCode,"uPassword":uPassword}
        $.ajax({
            url: "${PATH}/verify",
            data:param,
            type: "POST",
            success:function (result) {
                var getCode = result.code
                if (100 == getCode){
                    console.log("返回成功")
                // var getResult = result.dataInfo;
                if (result.dataInfo.login_result){
                    console.log("密码正确")

                    var getPosition = result.dataInfo.position

                    var url = "${PATH}/pages/"+getPosition
                    window.location.href = url
                }else{
                    alert("账号或密码错误")
                }
            }else {
                    alert("无此用户，请检查账号")
                }
            }
        })
    }
</script>
</body>
</html>