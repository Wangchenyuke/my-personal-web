<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="../common/header.jsp" %>

<div class="container mt-4">
    <div class="d-flex justify-content-between align-items-center mb-4">
        <h2>旅游景点</h2>
        <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#addSpotModal">
            添加景点
        </button>
    </div>

    <div class="row">
        <c:forEach items="${spots}" var="spot">
            <div class="col-md-4 mb-4">
                <div class="card h-100">
                    <img src="${spot.imageUrl}" class="card-img-top" alt="${spot.name}" style="height: 200px; object-fit: cover;">
                    <div class="card-body">
                        <h5 class="card-title">${spot.name}</h5>
                        <p class="card-text">${spot.description}</p>
                        <p class="card-text"><strong>地址：</strong>${spot.address}</p>
                        <p class="card-text"><strong>门票：</strong>￥${spot.ticketPrice}</p>
                    </div>
                    <div class="card-footer bg-white border-top-0">
                        <button class="btn btn-info btn-sm" onclick="editSpot(${spot.id})">编辑</button>
                        <button class="btn btn-danger btn-sm" onclick="deleteSpot(${spot.id})">删除</button>
                    </div>
                </div>
            </div>
        </c:forEach>
    </div>
</div>

<!-- 添加景点模态框 -->
<div class="modal fade" id="addSpotModal" tabindex="-1">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title">添加景点</h5>
                <button type="button" class="close" data-dismiss="modal">
                    <span>&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <form id="addSpotForm">
                    <div class="form-group">
                        <label>景点名称</label>
                        <input type="text" class="form-control" name="name" required>
                    </div>
                    <div class="form-group">
                        <label>描述</label>
                        <textarea class="form-control" name="description" rows="3"></textarea>
                    </div>
                    <div class="form-group">
                        <label>地址</label>
                        <input type="text" class="form-control" name="address" required>
                    </div>
                    <div class="form-group">
                        <label>门票价格</label>
                        <input type="number" class="form-control" name="ticketPrice" step="0.01" required>
                    </div>
                    <div class="form-group">
                        <label>图片URL</label>
                        <input type="text" class="form-control" name="imageUrl">
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-dismiss="modal">取消</button>
                <button type="button" class="btn btn-primary" onclick="saveSpot()">保存</button>
            </div>
        </div>
    </div>
</div>

<!-- 编辑景点模态框 -->
<div class="modal fade" id="editSpotModal" tabindex="-1">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title">编辑景点</h5>
                <button type="button" class="close" data-dismiss="modal">
                    <span>&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <form id="editSpotForm">
                    <input type="hidden" name="id">
                    <div class="form-group">
                        <label>景点名称</label>
                        <input type="text" class="form-control" name="name" required>
                    </div>
                    <div class="form-group">
                        <label>描述</label>
                        <textarea class="form-control" name="description" rows="3"></textarea>
                    </div>
                    <div class="form-group">
                        <label>地址</label>
                        <input type="text" class="form-control" name="address" required>
                    </div>
                    <div class="form-group">
                        <label>门票价格</label>
                        <input type="number" class="form-control" name="ticketPrice" step="0.01" required>
                    </div>
                    <div class="form-group">
                        <label>图片URL</label>
                        <input type="text" class="form-control" name="imageUrl">
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-dismiss="modal">取消</button>
                <button type="button" class="btn btn-primary" onclick="updateSpot()">更新</button>
            </div>
        </div>
    </div>
</div>

<script>
function saveSpot() {
    const formData = new FormData(document.getElementById('addSpotForm'));
    const data = Object.fromEntries(formData.entries());
    
    $.ajax({
        url: '/tourist/save',
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

function editSpot(id) {
    $.get('/tourist/get/' + id, function(response) {
        if(response.code === 200) {
            const spot = response.data;
            const form = document.getElementById('editSpotForm');
            form.id.value = spot.id;
            form.name.value = spot.name;
            form.description.value = spot.description;
            form.address.value = spot.address;
            form.ticketPrice.value = spot.ticketPrice;
            form.imageUrl.value = spot.imageUrl;
            $('#editSpotModal').modal('show');
        }
    });
}

function updateSpot() {
    const formData = new FormData(document.getElementById('editSpotForm'));
    const data = Object.fromEntries(formData.entries());
    
    $.ajax({
        url: '/tourist/update',
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

function deleteSpot(id) {
    if(confirm('确定要删除这个景点吗？')) {
        $.ajax({
            url: '/tourist/delete/' + id,
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