<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jstree/3.2.1/themes/default/style.min.css" />
<title>결재라인지정</title>
</head>
<body>
	<div id="jstree">
		<!-- in this example the tree is populated from inline HTML -->
		<ul>
		<c:forEach var="" items="">
			<li>Root node 1
				<ul>
					<li id="child_node_1">Child node 1</li>
				</ul>
			</li>
			<li>Root node 2</li>
		</c:forEach>
		</ul>
	</div>
	<button>demo button</button>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/1.12.1/jquery.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/jstree/3.2.1/jstree.min.js"></script>
	<script>
		$(function() {
			// 6 create an instance when the DOM is ready
			$('#jstree').jstree();
			// 7 bind to events triggered on the tree
			$('#jstree').on("changed.jstree", function(e, data) {
				console.log(data.selected);
			});
			// 8 interact with the tree - either way is OK
			$('button').on('click', function() {
				$('#jstree').jstree(true).select_node('child_node_1');
				$('#jstree').jstree('select_node', 'child_node_1');
				$.jstree.reference('#jstree').select_node('child_node_1');
			});
		});
	</script>
</body>
</html>