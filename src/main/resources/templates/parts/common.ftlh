<#import "login.ftlh" as l>
<#include "security.ftlh">

<#macro page>
    <!DOCTYPE html>
    <html lang="en">
    <head>

        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <meta name="description" content="">
        <meta name="author" content="">
        <meta http-equiv="content-type" content="text/html; charset=UTF-8">

        <title>Not a Blog</title>
        <link rel="icon" type="image/x-icon" href="/images/hand-drawn-pencil-icon.svg"/>


        <link href="https://startbootstrap.github.io/startbootstrap-blog-post/css/blog-post.css" rel="stylesheet">
        <link href="https://startbootstrap.github.io/startbootstrap-blog-post/vendor/bootstrap/css/bootstrap.min.css"
              rel="stylesheet">

        <style>
            html {
                position: relative;
                min-height: 100%;
            }

            body {
                margin: 0 0 100px; /* bottom = footer height */
                background-color: #f0f0f0;
            }

            footer {
                position: absolute;
                left: 0;
                bottom: 0;
                height: 100px;
                width: 100%;
            }
        </style>


    </head>

    <body>
    <div class="container">

        <#include "navbar.ftlh"/>

    </div>

    <#nested>

    <footer class="footer mt-auto py-4" style="background-color: #81bbfd;">
        <div class="container">
            <p class="m-0 text-center text-dark">Made as a university project by Meiman Bimendin | 2020</p>
            <p class="m-0 text-center text-dark"><a href="https://github.com/MeimanBeaman/notablog">Github project
                    repository</a></p>
        </div>
        <!-- /.container -->
    </footer>

    <!-- Bootstrap core JavaScript
    ================================================== -->
    <!-- Placed at the end of the document so the pages load faster -->
    <script src="/javascript/jquery-3.js"
            integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN"
            crossorigin="anonymous"></script>
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


    </body>
    </html>
</#macro>