<#import "parts/common.ftlh" as common>

<@common.page>
    <div class="container">
        <div class="row mt-3">

            <!-- Post Content Column -->

            <div class="col-lg-8">

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
                            <td><a href="/admin/${user.id}">Edit</a></td>
                        </tr>
                    </#list>
                    </tbody>
                </table>
                <p><a href="/main">Main page</a></p>
                <#--</div>-->
            </div><!-- /.blog-main -->
        </div><!-- /.row --></div>
</@common.page>

