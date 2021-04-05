<#import "parts/common.ftlh" as c>

<@c.page>
    <div class="container">
        <div class="row mt-3">
            <!-- Post Content Column -->
            <div class="col-lg-8">
                <h1 align="center" class="mb-4">${type?cap_first} of ${author.username}</h1>
                <ul class="list-group">
                    <#list users as user>
                        <li class="list-group-item">
                            <img width="30" src="/images/iconfinder_avatar_1814089.png">
                            <a href="/user/${user.id}">${user.getUsername()}</a>
                        </li>
                    </#list>
                </ul>
            </div>
        </div>
    </div>

</@c.page>
