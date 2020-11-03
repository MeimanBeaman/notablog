<#import "parts/common.ftlh" as common>

<@common.page>
    <div class="row m-md-5">
        <div class="col-md-8 blog-main">
            <#--<div class="card-columns">-->
            <h5>${username}</h5>


            ${message?ifExists}
            <form method="post" class="mt-5">
                <div class="form-group row">
                    <label class="col-sm-3 col-form-label">Change password:</label>
                    <div class="col-sm-6">
                        <input type="password" name="password" class="form-control" placeholder="Password" />
                    </div>
                </div>
                <div class="form-group row">
                    <label class="col-sm-3 col-form-label">Change email:</label>
                    <div class="col-sm-6">
                        <input type="email" name="email" class="form-control" placeholder="some@some.com" value="${email!''}" />
                    </div>
                </div>
                <input type="hidden" name="_csrf" value="${_csrf.token}" />
                <button class="btn btn-primary" type="submit">Save</button>
            </form>

        </div><!-- /.blog-main -->

        <aside class="col-md-4 blog-sidebar">


        </aside><!-- /.blog-sidebar -->

    </div><!-- /.row -->
</@common.page>