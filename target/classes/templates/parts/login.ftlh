<#macro login path isRegisterForm>

    <form class="form-signin" action="${path}" method="post">
        <img class="mb-4" src="/images/hand-drawn-pencil-icon.svg" alt="" width="92" height="92">
        <h2 class="h3 mb-3 font-weight-normal">${message?if_exists}</h2>
        <#if !isRegisterForm>
            <h1 class="h3 mb-3 font-weight-normal">Login to Not a Blog</h1>
        <#else>
            <h1 class="h3 mb-3 font-weight-normal">Add new user</h1>
        </#if>
        <input type="text" name="username" class="form-control" placeholder="Username" required autofocus>
        <#if isRegisterForm>
            <input type="email" name="email" class="form-control" placeholder="some@example.com" required>
        </#if>
        <input type="password" name="password" class="form-control" placeholder="Password" required>
        <input type="hidden" name="_csrf" value="${_csrf.token}">
        <button class="btn btn-lg btn-primary btn-block" type="submit"><#if isRegisterForm>Create<#else>Login</#if></button>
        <#if !isRegisterForm><a class="btn btn-lg btn-primary btn-block" href="/registration">Add new user</a> </#if>
        <p>Based on Spring Framework | 2020  <br/><a href="https://github.com/MeimanBeaman/notablog">Github project repository</a></p>
    </form>
</#macro>

<#macro logout>
    <form action="/logout" method="post">
        <input type="hidden" name="_csrf" value="${_csrf.token}">
        <input class="btn btn-sm btn-outline-secondary" type="submit" value="Log Out"/>
    </form>
</#macro>