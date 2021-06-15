<#import "parts/common.ftlh" as common>
<#import "parts/login.ftlh" as l>

<@common.page>
    <div class="container">
        <div class="row">
            <div class="col-lg-9">

                <h3 class="my-4">Post editing</h3>

                <div class="form-group mt-3">
                    <form method="post" enctype="multipart/form-data">
                        <div class="form-group">
                            <label class="form-label">Post title</label>
                            <input type="text"
                                   class="form-control ${(postTitleError??)?string('is-invalid', '')}"
                                   value="<#if message??>${message.postTitle}</#if>"
                                   name="postTitle" placeholder="Enter title"/>
                            <#if postTitleError??>
                                <div class="invalid-feedback">
                                    ${postTitleError}
                                </div>
                            </#if>
                        </div>
                        <div class="form-group">
                            <label class="form-label">Text</label>
                            <textarea
                                    class="form-control ${(textError??)?string('is-invalid', '')}"
                                    name="text" rows="6"
                                    placeholder="Enter message. You can use HTML tags here"><#if message??>${message.text?replace("<br>", "")}</#if></textarea>
                            <#if textError??>
                                <div class="invalid-feedback">
                                    ${textError}
                                </div>
                            </#if>
                        </div>
                        <div class="form-group">
                            <label class="form-label">Tag</label>
                            <input type="text"
                                   class="form-control ${(tagError??)?string('is-invalid', '')}"
                                   value="<#if message??>${message.tag}</#if>"
                                   name="tag" placeholder="Enter tag"/>
                            <#if tagError??>
                                <div class="invalid-feedback">
                                    ${tagError}
                                </div>
                            </#if>
                        </div>
                        <#if message.filename??>
                            <hr>
                            <img src="/img/${message.filename}" width="500" class="img-fluid rounded" alt="">
                            <hr>
                        </#if>
                        <div class="form-group">
                            <div class="custom-file">
                                <label class="custom-file-label" for="messageFile">Choose file</label>
                                <input type="file" class="custom-file-input" name="file"
                                       id="messageFile"/>
                            </div>
                        </div>
                        <input type="hidden" name="_csrf" value="${_csrf.token}"/>
                        <input type="hidden" name="id" value="<#if message??>${message.id} <#else>-1</#if>"/>
                        <div class="form-group">
                            <button type="submit" class="btn btn-primary">Send</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>

</@common.page>