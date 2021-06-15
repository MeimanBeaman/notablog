<#include "security.ftlh">
<#import "pager.ftlh" as p>

<#list page.content as message>
    <div class="mt-4" id="${message.id}">
        <!-- Post title -->
        <h3 class="mt-4">${message.postTitle}</h3>
        <p class="lead">
            by
            <a href="/user/${message.author.id}">${message.authorName}</a>, ${message.author.position}
            <#if message.author.profileImage??>
                <img width="30" src="/img/${message.author.profileImage}"/>
            <#else>
                <img width="30" src="/images/iconfinder_avatar_1814089.png">
            </#if>
        </p>
        <hr/>

        <!-- Post date -->
        <p>Posted ${message.date?datetime}</p>

        <hr/>

        <!-- Post Image -->
        <#if message.filename??>
            <img src="/img/${message.filename}" width="500" class="img-fluid rounded" alt=""/>
            <hr/>
        </#if>

        <#-- Post text -->
        <p/>
        <div>
            <p class="card-text">${message.text?replace("\n", "<br/>")?no_esc}</p>
        </div>

        <hr/>

        <#-- Post buttons -->
        <p class="blog-post-meta">
            <a class="col align-self-center" href="/post/${message.id}/like">
                <#if message.meLiked>
                    <i class="fas fa-thumbs-up mr-2"></i>
                <#else>
                    <i class="far fa-thumbs-up mr-2"></i>
                </#if>
                ${message.likes}
            </a>


            <a class="btn btn-outline-primary" href="/post/${message.id}"><b>Comments</b></a>
            <#if message.author.id == currentUserId>
                <a class="btn btn-outline-primary" href="/post/edit/${message.id}">
                    <b>Edit</b>
                </a>
                <a class="btn btn-outline-primary" href="/post/delete/${message.id}">
                    <b>Delete</b>
                </a>
            </#if>
            <i>|<a class="btn btn-link" href="/?filter=${message.tag}">#${message.tag?lower_case}</a></i>
        </p>

        <hr/>
        <br/>

    </div>
<#else>
    <h4 class="my-3">Messages not found</h4>
</#list>

