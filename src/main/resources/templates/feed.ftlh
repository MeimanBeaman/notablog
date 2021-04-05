<#import "parts/common.ftlh" as common>
<#include "parts/security.ftlh">
<#import "parts/pager.ftlh" as p>
<#--<#import "parts/messageEdit.ftlh" as messageEdit>-->

<@common.page>
    <div class="container">
        <div class="row">

            <!-- Post Content Column -->
            <div class="col-lg-8" id="message-list">
                <#include "parts/messageList.ftlh">
                <@p.pager "feed" page />
            </div><!-- /.blog-main -->


            <aside class="col-md-4 blog-sidebar">
                <#--                <@messageEdit.messageEdit/>-->
                <@p.pager "feed" page />
                <#include "parts/messageEdit.ftlh">
            </aside><!-- /.blog-sidebar -->

        </div><!-- /.row -->
    </div>
</@common.page>