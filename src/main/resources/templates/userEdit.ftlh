<#import "parts/common.ftlh" as common>

<@common.page>
    <div class="container">
        <div class="row mt-3">

            <!-- Post Content Column -->

            <div class="col-lg-8">

                <h1 align="center">User editor</h1>
                <div class="form-group row mt-3">
                    <form action="/admin" method="post">
                        <div class="form-group">
                            <input type="text" class="form-control" value="${user.username}" name="username">
                        </div>
                        <div>
                            <input type="text" class="form-control" value="${user.position}" name="position">
                        </div>
                        <#list roles as role>
                            <div class=class="form-group">
                                <label class="form-group ml-4"><input type="checkbox" class="form-check-input"
                                                                      name="${role}" ${user.roles?seq_contains(role)?string("checked", "")}>${role}
                                </label>
                            </div>
                        </#list>
                        <input type="hidden" value="${user.id}" name="userId">
                        <input type="hidden" name="_csrf" value="${_csrf.token}">
                        <div class="form-group">
                            <button type="submit" class="btn btn-primary">Save</button>
                        </div>
                    </form>
                </div>
                <#--</div>-->


            </div><!-- /.blog-main -->

        </div><!-- /.row --></div>

</@common.page>
