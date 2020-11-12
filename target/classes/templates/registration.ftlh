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
    <link href="https://startbootstrap.github.io/startbootstrap-blog-post/vendor/bootstrap/css/bootstrap.min.css"
          rel="stylesheet">

    <!-- Custom styles for this template -->
    <link href="/css/signin.css" rel="stylesheet">
</head>

<body class="text-center">
<@l.login "/registration" true/>
</body>
</html>