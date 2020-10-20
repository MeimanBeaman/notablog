<#import "parts/common.ftlh" as common>

<@common.page>
    <div class="row">
        <div class="col-md-8 blog-main">
            <#--<div class="card-columns">-->
            <h1 align="center">User editor</h1>
            <div class="form-group row mt-3">
                <form action="/user" method="post">
                    <div class="form-group">
                        <input type="text" class="form-control" value="${user.username}" name="username">
                    </div>
                    <#list roles as role>
                        <div class=class="form-group">
                            <label class="form-group ml-4"><input type="checkbox" class="form-check-input" name="${role}" ${user.roles?seq_contains(role)?string("checked", "")}>${role}</label>
                        </div>
                    </#list>
                    <input type="hidden" value="${user.id}" name="userId">
                    <input type="hidden" name="_csrf" value="${_csrf.token}">
                    <div class="form-group">
                        <button type="submit" class="btn btn-primary">Save</button>
                    </div>
                </form>
            </div>
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

<h1 align="center">User editor</h1>
<form action="/user" method="post">
    <input type="text" value="${user.username}" name="username">
    <#list roles as role>
        <div>
            <label><input type="checkbox" name="${role}" ${user.roles?seq_contains(role)?string("checked", "")}>${role}</label>
        </div>
    </#list>
    <input type="hidden" value="${user.id}" name="userId">
    <input type="hidden" name="_csrf" value="${_csrf.token}">
    <button type="submit">Save</button>
</form>