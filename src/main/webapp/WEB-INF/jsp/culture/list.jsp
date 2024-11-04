<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="../common/header.jsp" %>

<div class="container mt-4">
    <div class="d-flex justify-content-between align-items-center mb-4">
        <h2>家乡文化</h2>
        <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#addCultureModal">
            添加文化
        </button>
    </div>

    <div class="row">
        <c:forEach items="${cultures}" var="culture">
            <div class="col-md-4 mb-4">
                <div class="card h-100">
                    <img src="${culture.imageUrl}" class="card-img-top" alt="${culture.title}" style="height: 200px; object-fit: cover;">
                    <div class="card-body">
                        <h5 class="card-title">${culture.title}</h5>
                        <p class="card-text">${culture.content}</p>
                    </div>
                    <div class="card-footer bg-white border-top-0">
                        <button class="btn btn-info btn-sm" onclick="editCulture(${culture.id})">编辑</button>
                        <button class="btn btn-danger btn-sm" onclick="deleteCulture(${culture.id})">删除</button>
                    </div>
                </div>
            </div>
        </c:forEach>
    </div>
</div>

<!-- 添加文化模态框 -->
<div class="modal fade" id="addCultureModal" tabindex="-1">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title">添加文化</h5>
                <button type="button" class="close" data-dismiss="modal">
                    <span>&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <form id="addCultureForm">
                    <div class="form-group">
                        <label>标题</label>
                        <input type="text" class="form-control" name="title" required>
                    </div>
                    <div class="form-group">
                        <label>内容</label>
                        <textarea class="form-control" name="content" rows="3"></textarea>
                    </div>
                    <div class="form-group">
                        <label>图片URL</label>
                        <input type="text" class="form-control" name="imageUrl">
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-dismiss="modal">取消</button>
                <button type="button" class="btn btn-primary" onclick="saveCulture()">保存</button>
            </div>
        </div>
    </div>
</div>

<!-- 编辑文化模态框 -->
<div class="modal fade" id="editCultureModal" tabindex="-1">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title">编辑文化</h5>
                <button type="button" class="close" data-dismiss="modal">
                    <span>&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <form id="editCultureForm">
                    <input type="hidden" name="id">
                    <div class="form-group">
                        <label>标题</label>
                        <input type="text" class="form-control" name="title" required>
                    </div>
                    <div class="form-group">
                        <label>内容</label>
                        <textarea class="form-control" name="content" rows="3"></textarea>
                    </div>
                    <div class="form-group">
                        <label>图片URL</label>
                        <input type="text" class="form-control" name="imageUrl">
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-dismiss="modal">取消</button>
                <button type="button" class="btn btn-primary" onclick="updateCulture()">更新</button>
            </div>
        </div>
    </div>
</div>

<script>
function saveCulture() {
    const formData = new FormData(document.getElementById('addCultureForm'));
    const data = Object.fromEntries(formData.entries());
    
    $.ajax({
        url: '/culture/save',
        type: 'POST',
        contentType: 'application/json',
        data: JSON.stringify(data),
        success: function(response) {
            if(response.code === 200) {
                alert('添加成功');
                location.reload();
            } else {
                alert(response.msg || '添加失败');
            }
        },
        error: function() {
            alert('系统错误');
        }
    });
}

function editCulture(id) {
    $.get('/culture/get/' + id, function(response) {
        if(response.code === 200) {
            const culture = response.data;
            const form = document.getElementById('editCultureForm');
            form.id.value = culture.id;
            form.title.value = culture.title;
            form.content.value = culture.content;
            form.imageUrl.value = culture.imageUrl;
            $('#editCultureModal').modal('show');
        }
    });
}

function updateCulture() {
    const formData = new FormData(document.getElementById('editCultureForm'));
    const data = Object.fromEntries(formData.entries());
    
    $.ajax({
        url: '/culture/update',
        type: 'POST',
        contentType: 'application/json',
        data: JSON.stringify(data),
        success: function(response) {
            if(response.code === 200) {
                alert('更新成功');
                location.reload();
            } else {
                alert(response.msg || '更新失败');
            }
        },
        error: function() {
            alert('系统错误');
        }
    });
}

function deleteCulture(id) {
    if(confirm('确定要删除这条文化记录吗？')) {
        $.ajax({
            url: '/culture/delete/' + id,
            type: 'POST',
            success: function(response) {
                if(response.code === 200) {
                    alert('删除成功');
                    location.reload();
                } else {
                    alert(response.msg || '删除失败');
                }
            },
            error: function() {
                alert('系统错误');
            }
        });
    }
}
</script>

<%@ include file="../common/footer.jsp" %> 