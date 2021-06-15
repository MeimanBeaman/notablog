<#import "parts/common.ftlh" as common>
<#import "parts/login.ftlh" as l>

<@common.page>
    <div class="container">
        <div class="row">

            <!-- Post Content Column -->

            <div class="col-lg-9">
                <div class="mt-5">
                    <!-- Post title -->
                    <h1 class="mt-4">${message.postTitle}</h1>
                    <p class="lead">
                        by
                        <a href="#">${message.authorName}</a>
                        <#if message.author.profileImage??>
                            <img width="30" src="/img/${message.author.profileImage}"/>
                        <#else>
                            <img width="30" src="/images/iconfinder_avatar_1814089.png">
                        </#if>
                    </p>
                    <hr>

                    <!-- Post date -->
                    <p>Posted ${message.date?datetime}</p>

                    <hr>

                    <!-- Post Image -->
                    <#if message.filename??>
                        <img src="/img/${message.filename}" class="img-fluid rounded" alt="">
                        <hr>
                    </#if>

                    <#-- Post text -->
                    <p>
                    <p class="card-text">${message.text?no_esc}</p>

                    <br>

                    <#if hasComments>
                        <h5 class="blog-post-meta">
                            Comments:
                        </h5>

                        <hr>
                        <br>
                    <#else>
                        <h5 class="blog-post-meta">
                            No comments yet
                        </h5>
                    </#if>

                    <#list comments as comment>
                        <div class="card">
                            <div class="card-body">
                                <div class="media mb-4">
                                    <#if message.author.profileImage??>
                                        <img width="50" class="img-fluid rounded" src="/img/${message.author.profileImage}"/>
                                    <#else>
                                        <img width="50" src="/images/iconfinder_avatar_1814089.png">
                                    </#if>
                                    <div class="media-body ml-3">
                                        <h5 class="mt-0">${comment.user.username}</h5>
                                        ${comment.text?replace("\n", "<br/>")?no_esc}
                                        <hr>
                                        <p class="blog-post-meta">${message.date?datetime} <a href="/post/comment/delete/${comment.getId()}">
                                                Delete comment
                                            </a>
                                        </p>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </#list>

                    <div class="card my-4">
                        <h5 class="card-header">Leave a Comment:</h5>
                        <div class="card-body">
                            <form action="/post/${message.id}" method="post">
                                <div class="form-group">
                                    <textarea type="text" name="text" placeholder="Enter comment"
                                              class="form-control" rows="3"></textarea>
                                </div>
                                <input type="hidden" name="_csrf" value="${_csrf.token}">
                                <button type="submit" class="btn btn-primary">Submit</button>
                            </form>
                        </div>
                    </div>

                </div>
            </div><!-- /.blog-main -->

        </div><!-- /.row -->
    </div>

</@common.page>

