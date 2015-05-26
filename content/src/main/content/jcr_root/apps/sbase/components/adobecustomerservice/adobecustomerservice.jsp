<%--

  Adobe Customer Service component.

  

--%><%
%><%@include file="/libs/foundation/global.jsp"%><%
%><%@page session="false" %><%
%><%
    // TODO add you code here
%>
<style> 
    .htmlcomponent {
        float: left;
        width: 200px;
        height: 200px;
    }

    #main-call {
      background-color: #56b146;
      border: 1px solid #fff;
      display: block;
      padding: 10px;
      width: 155px;
      margin: 0 auto;
      /* color: #fff; */
      font-weight: bold;
      font-size: 12px;
    }
</style>

<div class="htmlcomponent htmlcomponent_3">

<h2 id="contact"><%= properties.get("connectTitle", "Enter some Description")  %></h2>

<img src="/content/dam/sbase/follow-icon.png" id="contact-image" title="Follow">

</div>

<div class="htmlcomponent htmlcomponent_3">

<h2 id="contact"><%= properties.get("requestTitle", "Title")  %></h2>

<img src="/content/dam/sbase/request-more-information-speech-bubble-icon.png" id="action-image" alt="Contact An Adobe Specialist">

<p> <%= properties.get("requestDesc", "Enter some Description")  %> </p>

<p id="expert-call-text">
    <span id="main-call"><%= properties.get("buttonText", "Button Text name")  %></span>
</p>

</div>