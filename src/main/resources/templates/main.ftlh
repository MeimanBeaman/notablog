<#import "parts/common.ftlh" as common>
<#import "parts/login.ftlh" as l>

<@common.page>
    <div class="container">
        <div class="row">

            <!-- Post Content Column -->

            <div class="col-lg-8">
                <#list messages as message>
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


                        <p class="blog-post-meta">
                            <a href="/post/${message.id}"><b>Comments</b></a>
                            <i><a href="/main?filter=${message.tag}">#${message.tag?lower_case}</a></i>
                        </p>

                        <hr>
                        <br>

                    </div>

                <#else>
                    <h4 class="h4">Messages not found</h4>
                </#list>
            </div><!-- /.blog-main -->


            <aside class="col-md-4 blog-sidebar">

                <div class="mt-3  rounded">
                    <div class="card">
                        <h5 class="card-header">
                            <a class="btn btn-secondary" data-toggle="collapse" href="#AddMessageForm" role="button">
                                Add new message
                            </a>
                        </h5>

                        <div class="collapse <#if message??>show</#if>" id="AddMessageForm">
                            <div class="form-group mt-3">
                                <form method="post" enctype="multipart/form-data">
                                    <div class="form-group">
                                        <input type="text"
                                               class="form-control ${(postTitleError??)?string('is-invalid', '')}"
                                               value="<#if message??>${message.postTitle}</#if>"
                                               name="postTitle" placeholder="Enter title">
                                        <#if postTitleError??>
                                            <div class="invalid-feedback">
                                                ${postTitleError}
                                            </div>
                                        </#if>
                                    </div>
                                    <div class="form-group">
                                <textarea class="form-control ${(textError??)?string('is-invalid', '')}"
                                          name="text" rows="6"
                                          placeholder="Enter message. You can use HTML tags here"><#if message??>${message.text}</#if></textarea>
                                        <#if textError??>
                                            <div class="invalid-feedback">
                                                ${textError}
                                            </div>
                                        </#if>
                                    </div>
                                    <div class="form-group">
                                        <input type="text" class="form-control ${(tagError??)?string('is-invalid', '')}"
                                               value="<#if message??>${message.tag}</#if>"
                                               name="tag" placeholder="Enter tag">
                                        <#if tagError??>
                                            <div class="invalid-feedback">
                                                ${tagError}
                                            </div>
                                        </#if>
                                    </div>
                                    <div class="form-group">
                                        <div class="custom-file">
                                            <label class="custom-file-label" for="messageFile">Choose file</label>
                                            <input type="file" class="custom-file-input" name="file" id="messageFile">
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
                </div>


            </aside><!-- /.blog-sidebar -->

        </div><!-- /.row -->
    </div>
</@common.page>
