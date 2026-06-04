<cfcomponent output="false">
  <cffunction name="listMessages" access="public" returntype="query" output="false">
    <cfquery name="local.messagesQuery" datasource="practice">
      SELECT id, body
      FROM messages
      ORDER BY id
    </cfquery>

    <cfreturn local.messagesQuery>
  </cffunction>

  <cffunction name="createMessage" access="public" returntype="void" output="false">
    <cfargument name="body" type="string" required="true">

    <cfset local.trimmedBody = trim(arguments.body)>

    <cfif len(local.trimmedBody) GT 0>
      <cfquery datasource="practice">
        INSERT INTO messages (body)
        VALUES (
          <cfqueryparam value="#local.trimmedBody#" cfsqltype="cf_sql_varchar">
        )
      </cfquery>
    </cfif>
  </cffunction>
</cfcomponent>
