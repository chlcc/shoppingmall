<%@ tag pageEncoding="utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="tags" tagdir="/WEB-INF/tags"%>

<html>
<head>
	<title>Design</title>
	<tags:css></tags:css>
</head>
<body>
<div id="script">
	<tags:script></tags:script>
</div>
<tags:header></tags:header>
<tags:nav></tags:nav>

<main>
	<jsp:doBody/>
</main>
<tags:footer></tags:footer>

</body>
</html>