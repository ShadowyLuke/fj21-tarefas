<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<!-- JSTL Libraries -->
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>Insert title here</title>
		<script type="text/javascript" src="resources/js/jquery.js"></script>
	</head>
	<body>	
		<script type="text/javascript">
			function finalizaAgora(id) {
				$.post("finalizaTarefa", {'id': id}, function() {
					// selecionando o elemento html atraves da ID
					// e alterando o HTML dele
					$("#tarefa_"+id).html("Finalizado");
				});
			}
			
			function removeAgora(id) {
				$.post("removeTarefa", {"id" : id}, function() {
					$("td").closest("tr").hide();
				})
			}
		</script>
	
		<a href="novaTarefa">Criar nova tarefa</a>
		<br /><br />
		
		<table>
			<tr>
				<th>Id</th>
				<th>Descricao</th>
				<th>Finalizado?</th>
				<th>Data de finalizacao</th>
				<th></th>
			</tr>
			<c:forEach items="${tarefas }" var="tarefa">
				<tr>
					<td>${tarefa.id }</td>
					<td>${tarefa.descricao }</td>
					<c:if test="${tarefa.finalizado eq false }">
						<td id="tarefa_${tarefa.id }">
							<a href="#" onClick="finalizaAgora(${tarefa.id})">Finaliza Agora!</a>
						</td>
					</c:if>
					<c:if test="${tarefa.finalizado eq true }">
						<td>Finalizado</td>
					</c:if>
					<td> <fmt:formatDate value="${tarefa.dataFinalizacao.time }" pattern="dd/MM/yyyy"/> </td>
<%-- 					<td><a href="removeTarefa?id=${tarefa.id }">Remover</a></td> --%>
					<td><a href="#" onClick="removeAgora(${tarefa.id})">Remover</a></td>
					<td><a href="mostraTarefa?id=${tarefa.id }">Alterar</a></td>
				</tr>
			</c:forEach>
		</table>
	</body>
</html>