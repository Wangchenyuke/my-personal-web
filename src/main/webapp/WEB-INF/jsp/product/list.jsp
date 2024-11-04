<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="../common/header.jsp" %>

<div class="container mt-4">
    <div class="d-flex justify-content-between align-items-center mb-4">
        <h2>特产信息</h2>
        <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#addProductModal">
            添加特产
        </button>
    </div>

    <div class="row">
        <c:forEach items="${products}" var="product">
            <div class="col-md-4 mb-4">
                <div class="card h-100">
                    <img src="${product.imageUrl}" class="card-img-top" alt="${product.name}" style="height: 200px; object-fit: cover;">
                    <div class="card-body">
                        <h5 class="card-title">${product.name}</h5>
                        <p class="card-text">${product.description}</p>
                        <p class="card-text"><strong>价格：</strong>￥${product.price}</p>
                    </div>
                    <div class="card-footer bg-white border-top-0">
                        <button class="btn btn-info btn-sm" onclick="editProduct(${product.id})">编辑</button>
                        <button class="btn btn-danger btn-sm" onclick="deleteProduct(${product.id})">删除</button>
                    </div>
                </div>
            </div>
        </c:forEach>
    </div>
</div>

<!-- 添加特产模态框 -->
<div class="modal fade" id="addProductModal" tabindex="-1">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title">添加特产</h5>
                <button type="button" class="close" data-dismiss="modal">
                    <span>&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <form id="addProductForm">
                    <div class="form-group">
                        <label>特产名称</label>
                        <input type="text" class="form-control" name="name" required>
                    </div>
                    <div class="form-group">
                        <label>描述</label>
                        <textarea class="form-control" name="description" rows="3"></textarea>
                    </div>
                    <div class="form-group">
                        <label>价格</label>
                        <input type="number" class="form-control" name="price" step="0.01" required>
                    </div>
                    <div class="form-group">
                        <label>图片URL</label>
                        <input type="text" class="form-control" name="imageUrl">
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-dismiss="modal">取消</button>
                <button type="button" class="btn btn-primary" onclick="saveProduct()">保存</button>
            </div>
        </div>
    </div>
</div>

<!-- 编辑特产模态框 -->
<div class="modal fade" id="editProductModal" tabindex="-1">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title">编辑特产</h5>
                <button type="button" class="close" data-dismiss="modal">
                    <span>&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <form id="editProductForm">
                    <input type="hidden" name="id">
                    <div class="form-group">
                        <label>特产名称</label>
                        <input type="text" class="form-control" name="name" required>
                    </div>
                    <div class="form-group">
                        <label>描述</label>
                        <textarea class="form-control" name="description" rows="3"></textarea>
                    </div>
                    <div class="form-group">
                        <label>价格</label>
                        <input type="number" class="form-control" name="price" step="0.01" required>
                    </div>
                    <div class="form-group">
                        <label>图片URL</label>
                        <input type="text" class="form-control" name="imageUrl">
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-dismiss="modal">取消</button>
                <button type="button" class="btn btn-primary" onclick="updateProduct()">更新</button>
            </div>
        </div>
    </div>
</div>

<script>
function saveProduct() {
    const formData = new FormData(document.getElementById('addProductForm'));
    const data = Object.fromEntries(formData.entries());
    
    $.ajax({
        url: '/product/save',
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

function editProduct(id) {
    $.get('/product/get/' + id, function(response) {
        if(response.code === 200) {
            const product = response.data;
            const form = document.getElementById('editProductForm');
            form.id.value = product.id;
            form.name.value = product.name;
            form.description.value = product.description;
            form.price.value = product.price;
            form.imageUrl.value = product.imageUrl;
            $('#editProductModal').modal('show');
        }
    });
}

function updateProduct() {
    const formData = new FormData(document.getElementById('editProductForm'));
    const data = Object.fromEntries(formData.entries());
    
    $.ajax({
        url: '/product/update',
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

function deleteProduct(id) {
    if(confirm('确定要删除这个特产吗？')) {
        $.ajax({
            url: '/product/delete/' + id,
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