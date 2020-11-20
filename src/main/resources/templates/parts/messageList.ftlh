<#include "security.ftlh">

<#list messages as message>
    <div class="mt-4">
        <!-- Post title -->
        <h1 class="mt-4">${message.postTitle}</h1>
        <p class="lead">
            by
            <a href="/user/${message.author.id}">${message.authorName}</a>
            <img width="25" src="/images/iconfinder_avatar_1814089.png">
        </p>
        <hr>

        <!-- Post date -->
        <p>Posted ${message.date?datetime}</p>

        <hr>

        <!-- Post Image -->
        <#if message.filename??>
            <img width="500" src="/img/${message.filename}" class="img-fluid rounded" alt="">
            <hr>
        </#if>

        <#-- Post text -->
        <p>
        <p class="card-text">${message.text?replace("\n", "<br>")?no_esc}</p>

        <hr>

        <p class="blog-post-meta">
            <a class="btn btn-outline-primary" href="/post/${message.id}"><b>Comments</b></a>
            <#if message.author.id == currentUserId>
            <a class="btn btn-outline-primary" href="/user/${message.author.id}?message=${message.id}">
                <b>Edit</b>
            </a>
            </#if>
            <i>|<a class="btn btn-link" href="/main?filter=${message.tag}">#${message.tag?lower_case}</a></i>
        </p>

        <hr>
        <br>

    </div>

<#else>
    <h4 class="h4">Messages not found</h4>
</#list>