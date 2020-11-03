<#import "parts/common.ftlh" as common>
<#import "parts/login.ftlh" as l>

<@common.page>
    <div class="row">
        <div class="col-md-8 blog-main">
            <#--<div class="card-columns">-->
            <#list messages as message>
                <div class="blog-post border-bottom">
                    <h4><img class="avatar mr-3" src="/images/iconfinder_avatar_1814089.png">${message.postTitle}</h4>
                    <i><a href="/main?filter=${message.tag}">#${message.tag?lower_case}</a></i>
                    <p class="blog-post-meta">${message.date?datetime} by <a href="#"> ${message.authorName}</a></p>
                    <#if message.filename??>
                        <figure class="figure">
                            <img src="/img/${message.filename}" class="figure-img img-fluid rounded" alt="...">
                        </figure>
                    </#if>
                    <p><p class="card-text">${message.text?no_esc}</p>
                    <p class="blog-post-meta"><a href="/post/${message.id}"><b>Comments</b></a></p>

                </div>

            <#else>
                No message
            </#list>
            <#--</div>-->

            <nav class="blog-pagination">
                <a class="btn btn-outline-primary" href="#">еще не работает</a>
                <a class="btn btn-outline-secondary disabled" href="#">еще не работает</a>
            </nav>

        </div><!-- /.blog-main -->

        <aside class="col-md-4 blog-sidebar">

            <div class="p-3 mb-3 rounded">

                <a class="btn btn-primary" data-toggle="collapse" href="#AddMessageForm" role="button" aria-expanded="false" aria-controls="collapseExample">
                    Add new message
                </a>

                <div class="collapse" id="AddMessageForm">
                    <div class="form-group mt-3">
                        <form method="post" enctype="multipart/form-data">
                            <div class="form-group">
                                <input type="text" class="form-control" name="postTitle" placeholder="Enter title">
                            </div>
                            <div class="form-group">
                                <textarea class="form-control" name="text" rows="6" placeholder="Enter message. You can use HTML tags here"></textarea>
                            </div>
                            <div class="form-group">
                                <input type="text" class="form-control" name="tag" placeholder="Enter tag">
                            </div>
                            <div class="form-group">
                                <div class="custom-file">
                                    <input type="file" class="form-control" name="file" id="messageFile">
                                    <label class="custom-file-label" for="messageFile">Choose file</label>
                                </div>
                            </div>
                            <input type="hidden" name="_csrf" value="${_csrf.token}">
                            <div class="form-group">
                                <button type="submit" class="btn btn-primary">Send</button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>

            <div class="p-3">
                <h4 class="font-italic">Archives</h4>
                <ol class="list-unstyled mb-0">
                    <li><a href="#">March 2014</a></li>

                </ol>
            </div>

            <div class="p-3">
                <h4 class="font-italic">Elsewhere</h4>
                <ol class="list-unstyled">
                    <li><a href="#">GitHub</a></li>

                </ol>
            </div>
        </aside><!-- /.blog-sidebar -->

    </div><!-- /.row -->
</@common.page>
