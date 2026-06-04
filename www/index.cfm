<!doctype html>
<html lang="ja">
<head>
  <meta charset="utf-8">
  <title>ColdFusion Practice</title>
</head>
<body>
  <h1>ColdFusion / CFML 練習</h1>

  <form method="post">
    <button type="submit" name="start" value="1">スタート</button>
  </form>

  <p><a href="messages.cfm">メッセージ一覧へ</a></p>

  <cfif structKeyExists(form, "start")>
    <cfquery name="messageQuery" datasource="practice">
      SELECT body
      FROM messages
      WHERE id = 1
    </cfquery>

    <cfoutput>
      <p>DBから取得したメッセージ：</p>
      <strong>#messageQuery.body#</strong>
    </cfoutput>
  </cfif>
</body>
</html>
