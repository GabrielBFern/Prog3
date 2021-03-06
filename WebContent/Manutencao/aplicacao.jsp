<%@page import="dao.AplicaoDAO"%>
<%@page import="bean.Aplicao"%>
<%@page session="true"%>
<%@page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<%
	String id = request.getParameter("id");
	int idTarefa=0;
	boolean inclusao=false;
	Aplicao a;
	try {
		a = new AplicaoDAO().ler(Integer.valueOf(id));
	} catch ( Exception e) {
		try {
			idTarefa = Integer.valueOf(request.getParameter("idTarefa"));
		} catch ( Exception exp) {
		    throw new ServletException("Sem ID da tarefa");
		}
		inclusao = true;
		a = null;
	}

%>
<html>
<head>
<title>Manutencao - Tarefa</title>
<link rel="stylesheet" type="text/css" href="/Manutencao/aplicao.css" />
<link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
<link rel="stylesheet" href="https://code.getmdl.io/1.3.0/material.indigo-blue.min.css" />
<script defer="defer" src="https://code.getmdl.io/1.3.0/material.min.js"></script>
</head>
<body>
	<div>
		<jsp:include page="/WEB-INF/hdr.jsp" />
	</div>


<style>
#rectangle {
  margin: auto;
  text-align: center;
  width: 300px;
  height: 230px;
  background: white;
  border-radius: 10px;
  padding: 10px;
  position: relative;
  top: 50%;
  transform: translateY(50%);
  -webkit-transform: translateY(50%);
  -ms-transform: translateY(50%);
}
</style>

	<form method="post" action=<%=inclusao?"Incluir":"Alterar"%>>
		<div id="rectangle">

			<input type="hidden" value="aplicacao" name="entidade" />
			<input type="hidden" value="<%=a==null?"0":a.getId()%>" name="id" />
			<input type="hidden" value="<%=a==null?idTarefa:a.getIdTarefa()%>" name="idTarefa" />


			<div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
				<input class="mdl-textfield__input" type="text" name="texto" value="<%=a==null?"":a.getTexto()%>" required>
				<label class="mdl-textfield__label" for="texto">Texto</label>
			</div>

			<div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
				<input class="mdl-textfield__input" type="text" name="observacoes" value="<%=a==null?"":a.getObservacoes()%>" required >
				<label class="mdl-textfield__label" for="observacoes">Observacoes</label>
			</div>

			<input class="mdl-button mdl-js-button mdl-button--raised mdl-js-ripple-effect mdl-button--accent" type="submit" value="Enviar" />
		</div>
	</form>
	<%
    // Se nao estiver em inclusao
    if(!inclusao){ %>
	<form method="post" action="Deletar">
		<input type="hidden" value="tarefa" name="entidade" /> <input
			type="hidden" value=<%=a==null?"":a.getId()%> name="id" />
		<button type="submit">Deletar</button>
	</form>
	<% } %>
</body>
</html>
