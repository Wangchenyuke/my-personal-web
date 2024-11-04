<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="../common/header.jsp" %>

<div class="container mt-4">
    <div class="row justify-content-center">
        <div class="col-md-6">
            <div class="card">
                <div class="card-header">
                    用户登录
                </div>
                <div class="card-body">
                    <form id="loginForm">
                        <div class="form-group">
                            <label for="username">用户名</label>
                            <input type="text" class="form-control" id="username" name="username" required>
                        </div>
                        <div class="form-group">
                            <label for="password">密码</label>
                            <input type="password" class="form-control" id="password" name="password" required>
                        </div>
                        <button type="submit" class="btn btn-primary">登录</button>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>

<script>
$(document).ready(function() {
    $('#loginForm').submit(function(e) {
        e.preventDefault();
        $.ajax({
            url: '/user/login',
            type: 'POST',
            data: {
                username: $('#username').val(),
                password: $('#password').val()
            },
            success: function(response) {
                if (response.code === 200) {
                    alert('登录成功');
                    window.location.href = '/';
                } else {
                    alert(response.msg || '登录失败，请检查用户名和密码');
                }
            },
            error: function(xhr, status, error) {
                alert('系统错误，请稍后重试');
                console.error(xhr, status, error);
            }
        });
    });
});


</script>

<%@ include file="../common/footer.jsp" %> 