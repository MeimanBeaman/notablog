<#include "security.ftlh">
<#import "login.ftlh" as l>


<nav class="navbar navbar-expand-lg navbar-light fixed-top" style="background-color: #81bbfd;">
    <div class="container">
        <a class="navbar-brand" href="/">
            <img src="/images/hand-drawn-pencil-icon.svg" width="30" height="30" class="d-inline-block align-top" alt=""
                 loading="lazy">
            not a blog
        </a>

        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarResponsive"
                aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarResponsive">
            <ul class="navbar-nav ml-auto">
                <#if know>
                    <li class="nav-item">
                        <form method="get" action="/main" class="input-group">
                            <input type="text" name="filter" class="form-control" value="${filter?ifExists}"
                                   placeholder="Search by tag">
                            <span class="input-group-append">
                                <button class="btn btn-secondary" type="submit">Search</button>
                            </span>
                        </form>
                    </li>
                </#if>

                <li class="nav-item <#--active-->">
                    <a class="nav-link" href="/main">My feed</a>
                </li>
                <#if isAdmin>
                    <li class="nav-item">
                        <ins><a class="nav-link" href="/user">User list</a></ins>
                    </li>
                </#if>
                <#if know>
                    <li class="nav-item">
                        <a class="nav-link" href="/user/profile">${name}</a>
                    </li>
                    <li>
                        <div class="">
                            <@l.logout/>
                        </div>
                    </li>
                </#if>
                <#if !know>
                    <li class="nav-item">
                        <a class="btn btn-sm btn-outline-secondary mr-3" href="/login">Login</a>
                    </li>
                    <li class="nav-item">
                        <a class="btn btn-sm btn-outline-secondary mr-3" href="/registration">Registration</a>
                    </li>
                </#if>
            </ul>
        </div>
    </div>
</nav>