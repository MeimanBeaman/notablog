<#import "parts/common.ftlh" as common>

<@common.page>
    <div class="container">
    <div class="row mt-5">

        <!-- Post Content Column -->

        <div class="col-lg-8">

            <h5>Account settings</h5>

            <form method="post" class="mt-5" enctype="multipart/form-data">
                <div class="form-group row">
                    <label class="col-sm-3 col-form-label">Change password:</label>
                    <div class="col-sm-6">
                        <input type="password" name="password" class="form-control" placeholder="Password"/>
                    </div>
                </div>
                <div class="form-group row">
                    <label class="col-sm-3 col-form-label">Change email:</label>
                    <div class="col-sm-6">
                        <input type="email" name="email" class="form-control" placeholder="some@some.com"
                               value="${user.email!''}"/>
                    </div>
                </div>
                <#if user.profileImage??>
                    <hr>
                    <img src="/img/${user.profileImage}" class="img-fluid rounded" alt="">
                    <hr>
                </#if>
                <div class="form-group row">
                    <div class="custom-file">
                        <label class="custom-file-label" for="messageFile">Choose profile image</label>
                        <input type="file" class="custom-file-input" name="file"
                               id="messageFile"/>
                    </div>
                </div>
                <input type="hidden" name="_csrf" value="${_csrf.token}"/>
                <button class="btn btn-primary" type="submit">Save</button>
                <br>
                <br>
            </form>

        </div><!-- /.blog-main -->

    </div><!-- /.row -->
</@common.page>