<html>
<body>
    <div>
        <form method="post">
            <input type="text" name="text" placeholder="Enter message">
            <input type="text" name="tag" placeholder="Enter tag">
            <button type="submit">Send</button>
        </form>
    </div>
    <div>Список сообщений</div>
    <p></p>
    <form method="post" action="filter">
        <input type="text" name="filter">
        <button type="submit">Search</button>
    </form>
    <#list messages as message>
    <div>
        <b>${message.id}</b>
        <span>${message.text}</span>
        <i>${message.tag}</i>
    </div>
    <#else>
    No message
    </#list>
</body>
</html>