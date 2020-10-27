<#import "parts/login.ftlh" as l>
<!doctype html>
    <html lang="en">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <meta name="description" content="">
        <meta name="author" content="">
        <link rel="icon" type="image/x-icon" href="/css/favicon.ico"/>

        <title>Log in in not a blog</title>

        <!-- Bootstrap core CSS -->
        <link href="/css/bootstrap.css" rel="stylesheet">
        <link href="/css/blog.css" rel="stylesheet">

        <!-- Custom styles for this template -->
        <link href="/css/signin.css" rel="stylesheet">
    </head>

    <body class="text-center">
    ${message?if_exists}
    <@l.login "/login" false/>
    </body>
</html>
