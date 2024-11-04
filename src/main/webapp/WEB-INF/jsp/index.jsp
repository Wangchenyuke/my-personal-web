<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="common/header.jsp" %>

<div class="container mt-4">
    <!-- 个人信息卡片 -->
    <div class="card mb-4 shadow-sm">
        <div class="card-body text-center">
            <img src="${pageContext.request.contextPath}/images/证件照.jpg"
                 style="width: 150px;"
                 alt="个人头像">
            <h2 class="card-title">王陈宇科</h2>
            <p class="text-muted">Java开发工程师</p>

            <!-- 社交链接 -->
            <div class="mb-3">
                <a href="https://github.com/Wangchenyuke"
                   class="btn btn-outline-dark me-2"
                   target="_blank">
                    <i class="fab fa-github"></i> GitHub
                </a>
                <a href="http://124.221.155.78/"
                   class="btn btn-outline-primary"
                   target="_blank">
                    <i class="fas fa-project-diagram"></i> 面试通项目
                </a>
            </div>
        </div>
    </div>

    <!-- 关于我 -->
    <div class="card mb-4 shadow-sm">
        <div class="card-body">
            <h3 class="card-title">
                <i class="fas fa-user text-primary"></i> 关于我
            </h3>
            <p class="card-text">我是一名充满热情的Java后端开发者，专注于构建高性能、可扩展的企业级应用。</p>
        </div>
    </div>


    <!-- 项目展示 -->
    <div class="card mb-4 shadow-sm">
        <div class="card-body">
            <h3 class="card-title">
                <i class="fas fa-project-diagram text-primary"></i> 项目展示
            </h3>
            <div class="card">
                <div class="card-body">
                    <h4 class="card-title">面试通平台</h4>
                    <p class="card-text">一个帮助开发者准备技术面试的在线平台</p>
                    <a href="http://124.221.155.78/"
                       class="btn btn-primary"
                       target="_blank">
                        访问项目
                    </a>
                </div>
            </div>
        </div>
    </div>

    <!-- 导航卡片 -->
    <div class="row row-cols-1 row-cols-md-3 g-4 mb-4">
        <div class="col">
            <div class="card h-100 shadow-sm">
                <div class="card-body text-center">
                    <i class="fas fa-landmark fa-3x text-primary mb-3"></i>
                    <h5 class="card-title">家乡文化</h5>
                    <p class="card-text">了解更多关于我家乡的文化特色</p>
                    <a href="culture/list" class="btn btn-outline-primary">查看详情</a>
                </div>
            </div>
        </div>
        <div class="col">
            <div class="card h-100 shadow-sm">
                <div class="card-body text-center">
                    <i class="fas fa-shopping-basket fa-3x text-primary mb-3"></i>
                    <h5 class="card-title">特产展示</h5>
                    <p class="card-text">发现我家乡的特色产品</p>
                    <a href="product/list" class="btn btn-outline-primary">查看详情</a>
                </div>
            </div>
        </div>
        <div class="col">
            <div class="card h-100 shadow-sm">
                <div class="card-body text-center">
                    <i class="fas fa-map-marked-alt fa-3x text-primary mb-3"></i>
                    <h5 class="card-title">旅游景点</h5>
                    <p class="card-text">探索我家乡的美丽景色</p>
                    <a href="tourist/list" class="btn btn-outline-primary">查看详情</a>
                </div>
            </div>
        </div>
    </div>
</div>

<%@ include file="common/footer.jsp" %> 