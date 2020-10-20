<#import "parts/common.ftlh" as common>

<@common.page>
    <div class="row">
        <div class="col-md-8 blog-main">
            <#--<div class="card-columns">-->
            <h1 align="center" class="mb-4">List of users</h1>
            <table class="table">
                <thead>
                <tr>
                    <th>Name</th>
                    <th>Role</th>
                    <th></th>
                </tr>
                </thead>
                <tbody>
                <#list users as user>
                    <tr>
                        <td>${user.username}</td>
                        <td><#list user.roles as role>${role}<#sep>, </#list></td>
                        <td><a href="/user/${user.id}">Edit</a></td>
                    </tr>
                </#list>
                </tbody>
            </table>
            <p><a href="/main">Main page</a></p>
            <#--</div>-->

            <nav class="blog-pagination">
                <a class="btn btn-outline-primary" href="#">еще не работает</a>
                <a class="btn btn-outline-secondary disabled" href="#">еще не работает</a>
            </nav>

        </div><!-- /.blog-main -->

        <aside class="col-md-4 blog-sidebar">

            <div class="p-3">
                <h4 class="font-italic">Archives</h4>
                <ol class="list-unstyled mb-0">
                    <li><a href="#">March 2014</a></li>

                </ol>
            </div>

            <div class="p-3">
                <h4 class="font-italic">Elsewhere</h4>
                <ol class="list-unstyled">
                    <li><a href="#">GitHub</a></li>

                </ol>
            </div>
        </aside><!-- /.blog-sidebar -->

    </div><!-- /.row -->
</@common.page>

