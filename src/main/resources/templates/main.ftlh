<#import "parts/common.ftlh" as common>
<#include "parts/security.ftlh">
<#import "parts/pager.ftlh" as p>
<#--<#import "parts/messageEdit.ftlh" as messageEdit>-->

<@common.page>
    <div class="container">
        <div class="row">

            <!-- Post Content Column -->
            <div class="col-lg-8" id="message-list">
                <div class="my-3">
                    <h5> Last updates:</h5>
                </div>
                <hr/>
                <#include "parts/messageList.ftlh">
                <@p.pager "" page />
            </div><!-- /.blog-main -->


            <aside class="col-md-4 blog-sidebar">
                <#--                <@messageEdit.messageEdit/>-->
                <@p.pager "" page />
                <#include "parts/messageEdit.ftlh">
            </aside><!-- /.blog-sidebar -->

        </div><!-- /.row -->
    </div>
</@common.page>
