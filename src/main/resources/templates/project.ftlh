<#import "parts/common.ftlh" as common>
<#include "parts/security.ftlh">

<@common.page>
    <div class="container">
        <div class="row">

            <!-- Post Content Column -->
            <div class="col-lg-8 mt-4" id="message-list">
                <div class="card text-black <#if project.status>border-success<#else>border-info</#if> mb-3" >
                    <div class="card-header bg-light">
                        <a href="/projects/${project.id}">${project.name}</a>
                        <#if project.status>
                            <i class="far fa-check-circle fa-lg ml-2" ></i>
                        <#else>
                            <i class="fas fa-tasks fa-lg ml-2"></i>
                        </#if>
                    </div>
                    <div class="card-body bg-light">
                        <#if project.status>
                            <div class="alert alert-success" role="alert">
                                Project completed successfully
                            </div>
                        </#if>
                        <p class="card-text">${project.description}</p>
                    </div>
                    <div class="card-footer bg-light">
                        Lead: <a href="/user/${project.lead.id}" >${project.lead.username}</a>
                    </div>
                </div>
                <div class="my-3">
                    <h5> Project tasks:</h5>
                </div>
                <hr/>
                <#list tasks as task>
                    <div class="card text-black <#if task.status>border-success<#else>border-info</#if> mb-3" >
                        <div class="card-header bg-light">
                            ${task.name}
                            <#if task.status>
                                <i class="far fa-check-circle fa-lg ml-2" ></i>
                            <#else>
                                <i class="fas fa-tasks fa-lg ml-2"></i>
                            </#if>
                        </div>
                        <div class="card-body bg-light">
                            <#if task.status>
                                <div class="alert alert-success" role="alert">
                                    Task completed successfully
                                </div>
                            </#if>
                            <p class="card-text">${task.description}</p>
                        </div>
                        <div class="card-footer bg-light">
                            Responsible: <a href="/user/${task.responsible.id}" >${task.responsible.username}</a>
                            <#if task.responsible.id == currentUserId>
                                <a class="btn btn-outline-primary mx-1" href="/projects/task/changeStatus/${task.id}">
                                    <b>Change status</b>
                                </a>
                            </#if>
                            <#if project.lead.id == currentUserId>
                                <a class="btn btn-outline-primary mx-1" href="/projects/task/delete/${task.id}">
                                    <b>Delete task</b>
                                </a>
                            </#if>
                        </div>
                    </div>
                </#list>
            </div><!-- /.blog-main -->


            <aside class="col-md-4 blog-sidebar">
                <#if project.lead.id == currentUserId>
                    <a class="btn btn-outline-primary mt-4 mx-1" href="/projects/changeStatus/${project.id}">
                        <b>Change status</b>
                    </a>
                </#if>
                <#if project.lead.id == currentUserId>
                    <a class="btn btn-outline-primary mt-4 mx-1" href="/projects/delete/${project.id}">
                        <b>Delete project</b>
                    </a>
                </#if>
                <#if project.lead.id == currentUserId>
                    <div class="card my-4">
                        <h5 class="card-header">Add new task:</h5>
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
                                           name="worker" placeholder="Enter id of responsible worker"/>
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