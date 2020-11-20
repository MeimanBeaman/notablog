<#import "parts/common.ftlh" as common>
<#include "parts/security.ftlh">

<@common.page>
    <div class="container">
        <div class="row">

            <!-- Post Content Column -->

            <div class="col-lg-8">
                <#include "parts/messageList.ftlh">
            </div><!-- /.blog-main -->


            <aside class="col-md-4 blog-sidebar">
                <div class="media mt-4">
                    <img width="50" class="mr-3" src="/images/iconfinder_avatar_1814089.png">
                    <div class="media-body">
                        <h3 class="mt-0">${author.username}</h3>
                        <#if !isCurrentUser>
                            <#if isSubscriber>
                                <a class="btn btn-info my-2" href="/user/${author.id}/unsubscribe">Unsubscribe</a> <br>
                            <#else>
                                <a class="btn btn-info my-2" href="/user/${author.id}/subscribe">Subscribe</a> <br>
                            </#if>

                        </#if>
                        <a href="/user/${author.id}/subscriptions/list">${SubscriptionsCount} subscriptions</a> <br>
                        <a href="/user/${author.id}/subscribers/list">${SubscribersCount} subscribers</a>
                    </div>
                </div>
                <div class="mt-4">
                <#if isCurrentUser>
                    <#include "parts/messageEdit.ftlh">
                </#if>
                </div>


            </aside><!-- /.blog-sidebar -->

        </div><!-- /.row -->
    </div>
</@common.page>