<cfif structKeyExists(form, "body") AND len(trim(form.body)) GT 0>
  <cfset messageService = createObject("component", "components.MessageService")>
  <cfset messageService.createMessage(trim(form.body))>
</cfif>

<cflocation url="messages.cfm" addtoken="false">
