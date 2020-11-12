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
                        <img width="25" src="/images/iconfinder_avatar_1814089.png">
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

                    <h5 class="blog-post-meta">
                        Comments:
                    </h5>

                    <hr>
                    <br>

                    <#list comments as comment>
                        <div class="media mb-4">
                            <img width="50" class="mr-3" src="/images/iconfinder_avatar_1814089.png">
                            <div class="media-body">
                                <h5 class="mt-0">${comment.user.username}</h5>
                                ${comment.text?no_esc}
                                <hr>
                                <p class="blog-post-meta">${message.date?datetime}</p>
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

