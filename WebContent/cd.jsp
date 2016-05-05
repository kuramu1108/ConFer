<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="x" uri="http://java.sun.com/jsp/jstl/xml" %>
<c:set var="xmltext">
 <cd>
 
  <title>A Funk Odyssey</title>
  <%
  out.println("<artist>Anybody</artist>");
  %>
  
  <tracklist>
    <track id="1">
      <title>Feels So Good</title>
      <time>4:38</time>
      <rating>2</rating>
    </track>
  
    <track id="2">
      <title>Little L</title>
      <time>4:10</time>
      <rating>5</rating>
    </track>
  
    <track id="3">
      <title>You Give Me Something</title>
      <time>5:02</time>
      <rating>3</rating>
    </track>
  
    <track id="4">
      <title>Corner of the Earth</title>
      <time>3:57</time>
      <rating>1</rating>
    </track>
  </tracklist>
 
 </cd>
</c:set>
<c:import url="cd2.xsl" var="xslt"/>
<c:import url="cd.xml" var="xml2"/>
<x:transform xml="${xml2}" xslt="${xslt}"/>