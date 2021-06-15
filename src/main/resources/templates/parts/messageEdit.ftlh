
    <div class="mt-3  rounded">
        <div class="card">
            <div class="card-header">
                Have something to tell?
            </div>

            <div class="card-body">


<#--                <a class="btn btn-secondary" data-toggle="collapse" href="#AddMessageForm" role="button">-->
<#--                    Add new message-->
<#--                </a>-->

                <div class=" <#if message??>show</#if>" id="AddMessageForm">
                    <div class="form-group mt-3">
                        <form method="post" action="/" enctype="multipart/form-data">
                            <div class="form-group">
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
                                <textarea class="form-control ${(textError??)?string('is-invalid', '')}"
                                          name="text" rows="6"
                                          placeholder="Enter message. You can use HTML tags here"><#if message??>${message.text?replace("<br>", "")}</#if></textarea>
                                <#if textError??>
                                    <div class="invalid-feedback">
                                        ${textError}
                                    </div>
                                </#if>
                            </div>
                            <div class="form-group">
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
                            <div class="form-group">
                                <div class="custom-file">
                                    <label class="custom-file-label" for="messageFile">Choose file</label>
                                    <input type="file" class="custom-file-input" name="file"
                                           id="messageFile"/>
                                </div>
                            </div>
                            <input type="hidden" name="_csrf" value="${_csrf.token}"/>
                            <input type="hidden" name="id" value="<#if message??>${message.id} <#else>-1</#if>" />
                            <div class="form-group">
                                <button type="submit" class="btn btn-primary">Send</button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
