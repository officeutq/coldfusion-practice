<!doctype html>
<html lang="ja">
<head>
  <meta charset="utf-8">
  <title>メッセージ一覧</title>
</head>
<body>
  <h1>メッセージ一覧</h1>

  <p><a href="index.cfm">トップへ戻る</a></p>

  <cfquery name="messagesQuery" datasource="practice">
    SELECT id, body
    FROM messages
    ORDER BY id
  </cfquery>

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
