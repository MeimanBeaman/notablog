<#import "login.ftlh" as l>
<#include "security.ftlh">

<#macro page>
<!DOCTYPE html>
<html lang="en"><head>
    <meta http-equiv="content-type" content="text/html; charset=UTF-8">
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">
    <link rel="icon" type="image/x-icon" href="/images/hand-drawn-pencil-icon.svg"/>
    <

    <title>not a blog</title>

    <link rel="canonical" href="https://getbootstrap.com/docs/4.0/examples/blog/">

    <!-- Bootstrap core CSS -->
    <link href="/css/bootstrap.css" rel="stylesheet">

    <!-- Custom styles for this template -->
    <link href="/css/css.css" rel="stylesheet">
    <link href="/css/blog.css" rel="stylesheet">
</head>

<body>
<div class="container">
    <header class="blog-header py-3">
        <div class="row flex-nowrap justify-content-between align-items-center">
            <div class="col-4 pt-1">
                <a class="text-muted" href="#"><#--здесь пока пусто--></a>
            </div>
            <div class="col-4 text-center">
                <a class="blog-header-logo text-dark" href="#">not a blog</a>
            </div>
            <div class="col-4 d-flex justify-content-end align-items-center">

                <#if know>
                    <a class="text-muted mr-3">Hello, ${name}</a>
                    <div class="mr-3">
                        <@l.logout/>
                    </div>
                </#if>
                <#if !know>
                    <a class="btn btn-sm btn-outline-secondary mr-3" href="/login">Login</a>
                    <a class="btn btn-sm btn-outline-secondary mr-3" href="/registration">Registration</a>
                </#if>
            </div>
        </div>
    </header>

    <#include "navbar.ftlh"/>

</div>

<main role="main" class="container mt-5">

    <#nested>

</main><!-- /.container -->

<footer class="blog-footer">
    <p>Made as a university project by Meiman Bimendin | 2020</p>
    <p><a href="https://github.com/MeimanBeaman/notablog">Github project repository</a></p>
</footer>

<!-- Bootstrap core JavaScript
================================================== -->
<!-- Placed at the end of the document so the pages load faster -->
<script src="/javascript/jquery-3.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
<script>window.jQuery || document.write('<script src="../../assets/js/vendor/jquery-slim.min.js"><\/script>')</script>
<script src="/javascript/popper.js"></script>
<script src="/javascript/bootstrap.js"></script>
<script src="/javascript/holder.js"></script>
<script>
    Holder.addTheme('thumb', {
        bg: '#55595c',
        fg: '#eceeef',
        text: 'Thumbnail'
    });
</script>


<svg xmlns="http://www.w3.org/2000/svg" width="200" height="250" viewBox="0 0 200 250" preserveAspectRatio="none" style="display: none; visibility: hidden; position: absolute; top: -100%; left: -100%;"><defs><style type="text/css"></style></defs><text x="0" y="13" style="font-weight:bold;font-size:13pt;font-family:Arial, Helvetica, Open Sans, sans-serif">Thumbnail</text></svg></body></html>
</#macro>