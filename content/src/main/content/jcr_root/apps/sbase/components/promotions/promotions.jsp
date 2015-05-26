<%--

  Promotions component.

  This is a promotion component
  
  this is a script ---> <% %> 
  to show java values as output on the webpage   ---> <%=   %> 

--%><%
%><%@include file="/libs/foundation/global.jsp"%><%
%><%@page session="false" %><%
%><%
    // TODO add you code here
%>


<h1> Promotions Component </h1>

<% String desc = properties.get("desc", "Enter some Description");
   String imagePath = properties.get("imagePath", "Give an Image Path");
   String title = properties.get("title", "Enter some Title");
 %> 
<style>
.promotions {
    width: 142px;
    height: 142px;
    border: 1px solid #EEE;
}

</style>
 
 <div class="promotions"> 
 <img src="<%= imagePath  %>" alt="Promotions" height="142" width="142">
 <h3>  <%= title %>  </h3>
 <p>   <%= desc %>   </p>
 </div>
 
 
 