<#import "parts/common.ftlh" as common>
<#import "parts/login.ftlh" as l>

<@common.page>
    <div class="row">
        <div class="col-md-8 blog-main">
            <#--<div class="card-columns">-->

            <div class="blog-post border-bottom">
                <h4><img class="avatar mr-3" src="/images/iconfinder_avatar_1814089.png">${message.authorName} <i>#${message.tag}</i></h4>
                <p class="blog-post-meta">${message.date?datetime} by <a href="#"> ${message.authorName}</a></p>
                <#if message.filename??>
                    <figure class="figure">
                        <img src="/img/${message.filename}" class="figure-img img-fluid rounded" alt="...">
                    </figure>
                </#if>
                <p><p class="card-text">${message.text}</p>
                <p class="blog-post-meta">Comments: </p>

            </div>

            <#--<div id="content">
                <#list comments as comment>
                    <div>
                        <span>${comment.text}</span>
                        <strong>${comment.user.username}</strong>
                        <strong>${message.date?datetime}</strong>
                    </div>
                </#list>
            </div>-->

            <div class="comment-widgets">
                <!-- Comment Row -->
                <#list comments as comment>
                <div class="d-flex flex-row comment-row m-t-0 mb-5">
                    <div class="p-2"><img src="/images/iconfinder_avatar_1814089.png" alt="user" width="50" class="rounded-circle"></div>
                    <div class="comment-text w-100">
                        <h6 class="font-medium">${comment.user.username}</h6> <span class="m-b-15 d-block"><span>${comment.text}</span></span>
                        <div class="comment-footer"> <span class="text-muted float-right">${message.date?datetime}</span> <button type="button" class="btn btn-danger btn-sm">Delete</button> </div>
                    </div>
                </div> <!-- Comment Row -->
                </#list>

            </div> <!-- Card -->
            <#--</div>-->


        </div><!-- /.blog-main -->

        <aside class="col-md-4 blog-sidebar">

            <div class="p-3 mb-3 bg-light rounded">

                <a class="btn btn-primary" data-toggle="collapse" href="#AddMessageForm" role="button" aria-expanded="false" aria-controls="collapseExample">
                    Add comment
                </a>

                <div class="collapse" id="AddMessageForm">
                    <div class="form-group mt-3">
                        <form action="/post/${message.id}" method="post">
                            <div class="form-group">
                                <input type="text" name="text" placeholder="Enter message">
                            </div>
                            <input type="hidden" name="_csrf" value="${_csrf.token}">
                            <div class="form-group">
                                <button type="submit" class="btn btn-primary">Add comment</button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </aside><!-- /.blog-sidebar -->

    </div><!-- /.row -->
</@common.page>

<#--<h3>Add comment</h3>
<div>
    <form action="/post/${message.id}" method="post">
        <input type="text" name="text" placeholder="Enter message">
        <input type="hidden" name="_csrf" value="${_csrf.token}">
        <button type="submit">Add comment</button>
    </form>
</div>-->

<#--
<div id="content">
    <#list comments as comment>
        <div>
            <span>${comment.text}</span>
            <strong>${comment.user.username}</strong>
            <strong>${message.date?datetime}</strong>
        </div>
    </#list>

</div>-->
