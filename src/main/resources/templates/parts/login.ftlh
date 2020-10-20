<#macro login path isRegisterForm>

    <form class="form-signin" action="${path}" method="post">
        <img class="mb-4" src="/images/hand-drawn-pencil-icon.svg" alt="" width="92" height="92">
        <#if !isRegisterForm>
            <h1 class="h3 mb-3 font-weight-normal">Login to Not a Blog</h1>
        <#else>
            <h1 class="h3 mb-3 font-weight-normal">Add new user</h1>
        </#if>
        <label for="inputEmail" class="sr-only">Username</label>
        <input type="text" name="username" class="form-control" placeholder="Username" required autofocus>
        <label for="inputPassword" class="sr-only">Password</label>
        <input type="password" name="password" class="form-control" placeholder="Password" required>
        <input type="hidden" name="_csrf" value="${_csrf.token}">
        <#if isRegisterForm>
            <button class="btn btn-lg btn-primary btn-block" type="submit" value="Creare">Create</button>
        <#else>
            <button class="btn btn-lg btn-primary btn-block" type="submit" value="Login">Login</button>
        </#if>
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