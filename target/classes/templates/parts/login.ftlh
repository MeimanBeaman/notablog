<#macro login path isRegisterForm>

    <form class="form-signin" action="${path}" method="post">
        <img class="mb-4" src="/images/hand-drawn-pencil-icon.svg" alt="" width="92" height="92">
        <#if !isRegisterForm>
                <#if RequestParameters.error??>
                    <div class="alert alert-danger" role="alert">
                        ${Session.SPRING_SECURITY_LAST_EXCEPTION.message}
                    </div>
                </#if>
        </#if>
        <h2 class="h3 mb-3 font-weight-normal">${message?if_exists}</h2>
        <#if !isRegisterForm>
            <h1 class="h3 mb-3 font-weight-normal">Login to Not a Blog</h1>
        <#else>
            <h1 class="h3 mb-3 font-weight-normal">Add new user</h1>
        </#if>
        <input type="text" name="username" value="<#if user??>${user.username}</#if>"
               class="form-control ${(usernameError??)?string('is-invalid', '')}"
               placeholder="Username" required autofocus>
            <#if usernameError??>
                <div class="invalid-feedback">
                    ${usernameError}
                </div>
            </#if>
        <input type="password" name="password"
               class="form-control ${(passwordError??)?string('is-invalid', '')}"
               placeholder="Password" required>
        <#if passwordError??>
            <div class="invalid-feedback">
                ${passwordError}
            </div>
        </#if>
        <#if isRegisterForm>

            <input type="password" name="passwordConfirm"
                   class="form-control ${(passwordConfirmError??)?string('is-invalid', '')}"
                   placeholder="Password Confirm" required>
            <#if passwordConfirmError??>
                <div class="invalid-feedback">
                    ${passwordConfirmError}
                </div>
            </#if>

            <input type="email" name="email" value="<#if user??>${user.email}</#if>"
                   class="form-control ${(emailError??)?string('is-invalid', '')}"
                   placeholder="some@example.com" required>
            <#if emailError??>
                <div class="invalid-feedback">
                    ${emailError}
                </div>
            </#if>
        </#if>
        <input type="hidden" name="_csrf" value="${_csrf.token}">
        <button class="btn btn-lg btn-primary btn-block" type="submit"><#if isRegisterForm>Create<#else>Login</#if></button>
        <#if !isRegisterForm><a class="btn btn-lg btn-primary btn-block" href="/registration">Add new user</a> </#if>
        <p>Based on Spring Framework | 2020  <br/><a href="https://github.com/MeimanBeaman/notablog">Github project repository</a></p>
    </form>
</#macro>

<#macro logout>
    <form action="/logout" method="post">
        <input type="hidden" name="_csrf" value="${_csrf.token}">
        <input class="btn btn-secondary" type="submit" value="Log Out"/>
    </form>
</#macro>