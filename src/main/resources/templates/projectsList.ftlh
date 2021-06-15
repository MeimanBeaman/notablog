<#import "parts/common.ftlh" as common>
<#include "parts/security.ftlh">

<@common.page>
    <div class="container">
        <div class="row">

            <!-- Post Content Column -->
            <div class="col-lg-8 mt-4" id="message-list">
                <#list projects as project>
                    <div class="card text-black bg-light <#if project.status>border-success <#else>border-info</#if> mb-3" >
                        <div class="card-header ">
                            <a href="/projects/${project.id}">${project.name}</a>
                            <#if project.status>
                                <i class="far fa-check-circle fa-lg ml-2" ></i>
                            <#else>
                                <i class="fas fa-tasks fa-lg ml-2"></i>
                            </#if>
                        </div>
                        <div class="card-body">
                            <#if project.status>
                                <div class="alert alert-success" role="alert">
                                    Project completed successfully
                                </div>
                            </#if>
                            <p class="card-text">${project.description}</p>
                        </div>
                        <div class="card-footer">
                            Lead: <a href="/user/${project.lead.id}" >${project.lead.username}</a>
                        </div>
                    </div>
                </#list>
            </div><!-- /.blog-main -->


            <aside class="col-md-4 blog-sidebar">
                <#if isAdmin>
                <div class="card my-4">
                    <h5 class="card-header">Add new project:</h5>
                    <div class="card-body">
                        <form method="post">
                            <div class="form-group">
                                <input type="text"
                                       class="form-control"
                                       name="name" placeholder="Enter name"/>
                            </div>
                            <div class="form-group">
                                    <textarea type="text" name="description" placeholder="Enter description"
                                              class="form-control" rows="3"></textarea>
                            </div>
                            <div class="form-group">
                                <input type="number"
                                       class="form-control"
                                       name="lead" placeholder="Enter lead's id"/>
                            </div>
                            <input type="hidden" name="_csrf" value="${_csrf.token}">
                            <button type="submit" class="btn btn-primary">Add</button>
                        </form>
                    </div>
                </div>
                </#if>
            </aside><!-- /.blog-sidebar -->

        </div><!-- /.row -->
    </div>
</@common.page>