<#include "security.ftlh">
<#import "pager.ftlh" as p>

<#list page.content as message>
    <div class="mt-4" id="${message.id}">
        <!-- Post title -->
        <h1 class="mt-4">${message.postTitle}</h1>
        <p class="lead">
            by
            <a href="/user/${message.author.id}">${message.authorName}</a>
            <#if message.author.profileImage??>
                <img width="25" src="/img/${message.author.profileImage}"/>
            </#if>
        </p>
        <hr/>

        <!-- Post date -->
        <p>Posted ${message.date?datetime}</p>

        <hr/>

        <!-- Post Image -->
        <#if message.filename??>
            <img width="500" src="/img/${message.filename}" class="img-fluid rounded" alt=""/>
            <hr/>
        </#if>

        <#-- Post text -->
        <p/>
        <p class="card-text">${message.text?replace("\n", "<br/>")?no_esc}</p>

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
    <h4 class="h4">Messages not found</h4>
</#list>

