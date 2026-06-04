<cfset messageService = createObject("component", "components.MessageService")>
<cfset messagesQuery = messageService.listMessages()>
<!doctype html>
<html lang="ja">
<head>
  <meta charset="utf-8">
  <title>メッセージ一覧</title>
</head>
<body>
  <h1>メッセージ一覧</h1>

  <p><a href="index.cfm">トップへ戻る</a></p>

  <form method="post" action="create_message.cfm">
    <label for="body">新しいメッセージ</label>
    <input type="text" id="body" name="body">
    <button type="submit">登録</button>
  </form>

  <cfoutput>
    <p>件数: #messagesQuery.recordCount# 件</p>
  </cfoutput>

  <ul>
    <cfoutput query="messagesQuery">
      <li>#id#: #body#</li>
    </cfoutput>
  </ul>
</body>
</html>
