<%@page import="org.apache.sling.api.resource.ResourceResolver"%>
<%@page import="org.apache.sling.api.resource.Resource"%>
<%@page session="false"%><%--
  Copyright 1997-2008 Day Management AG
  Barfuesserplatz 6, 4001 Basel, Switzerland
  All Rights Reserved.

  This software is the confidential and proprietary information of
  Day Management AG, ("Confidential Information"). You shall not
  disclose such Confidential Information and shall use it only in
  accordance with the terms of the license agreement you entered into
  with Day.

  ==============================================================================

  Title component.

  Draws a title either store on the resource or from the page

--%><%@include file="/libs/foundation/global.jsp"%><%
%>
<%@ page import="com.day.cq.dam.api.Asset" %>
<%@ page import="java.util.Map" %>
<%@ page import="java.util.Set" %>
<%@ page import="java.util.Iterator" %>
<cq:defineObjects />

<%
    // first calculate the correct title - look for our sources if not set in paragraph
    String title = properties.get(NameConstants.PN_TITLE, String.class);
    if (title == null || title.equals("")) {
        // might be propagate from a head component
        title = (String) request.getAttribute("com.day.apps.geometrixx.title.pagetitle");

    }
    if (title == null || title.equals("")) {
        title = resourcePage.getPageTitle();
    }
    if (title == null || title.equals("")) {
        title = resourcePage.getTitle();
    }
    if (title == null || title.equals("")) {
        title = resourcePage.getName();
    }
    String defType = currentStyle.get("defaultType", "large");
    String type = properties.get("type", defType);
    String link = properties.get("href", "");
    if (link.length() > 0) {
        %><a href="<%= xssAPI.getValidHref(link) %>"><%
    }
    if (type.equals("small")) {
        %><cq:text property="jcr:title" value="<%= title %>" tagName="h3" escapeXml="true"/><%
    } else if (type.equals("link")) {
        %><cq:text property="jcr:title" value="<%= "\u00bb " + title %>" tagName="p" tagClass="link" escapeXml="true"/><%
    } else if (type.equals("extralarge")) {
        %><cq:text property="jcr:title" value="<%= title %>" tagName="h1" escapeXml="true"/><%
    } else {
        %><cq:text property="jcr:title" value="<%= title %>" tagName="h2" escapeXml="true"/><%
    }
    if (link.length() > 0) {
        %></a><%
    }
    %>

Testing PDF 
<br>
<%  NodeIterator nodeIterator = null;
	Resource resource2 = resourceResolver.getResource("/content/dam/geometrixx/documents");
	
	try {
        Node n = resource2.adaptTo(Node.class);		
        nodeIterator = n.getNodes();
        while (nodeIterator.hasNext()) {
					Node oneNode = nodeIterator.nextNode();
       				 %><%= oneNode.getPath() %>
					<% Asset ast = resourceResolver.getResource(oneNode.getPath()).adaptTo(Asset.class);
            			Object titleObj = ast.getMetadata("dc:title");
            			String title1;
                            if (titleObj instanceof Object[]) {
                                Object[] titleArray = (Object[]) titleObj;
                                title1 = (titleArray.length > 0) ? titleArray[0].toString() : ""; %><%
                            } else {
                                title1 = titleObj.toString(); %> <%
                            }
            			%><%= title1 %>
					<br><%

        }
    }
	catch (PathNotFoundException e) {
			log.error("Could not find path of node", e);
		} catch (RepositoryException e) {
			log.error("Repository error while reading node", e);
		} catch (Exception e) {
			log.error("Error retrieving rendered parsys output", e);
		}

    Resource resource1 = resourceResolver.getResource("/content/dam/geometrixx/documents/GeoCube_Datasheet.pdf");
			Asset asset=resource1.adaptTo(Asset.class); 

            Map<String, Object> mp= asset.getMetadata();

Set s=mp.entrySet();

        //Move next key and value of Map by iterator
        Iterator it=s.iterator();

        while(it.hasNext())
        {
			Map.Entry m =(Map.Entry)it.next();

            %><%= m.getKey() %> : <%
			Object titleObj2 = m.getValue();
			String title2;
                            if (titleObj2 instanceof Object[]) {
                                Object[] titleArray = (Object[]) titleObj2;
                                title2 = (titleArray.length > 0) ? titleArray[0].toString() : ""; %><%
                            } else {
                                title2 = titleObj2.toString(); %>  <%
                            }
            			%><%= title2 %>  <br>
			<% 
        } 
%>
