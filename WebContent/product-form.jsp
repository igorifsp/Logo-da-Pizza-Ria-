<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<!DOCTYPE html>
<html lang="pt-br">
<head>
<meta charset="UTF-8" />
<link rel="icon"
	href="https://github.com/igorifsp/Logos/blob/main/icon_techstore.png?raw=true" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">

<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
	crossorigin="anonymous">
<title>Tech Store</title>
<style>
body {
	background: linear-gradient(90deg, black 0%, #3a8181 80%, #329ead 100%);
}

.card-body {
	background: linear-gradient(90deg, #329ead 0%, #3a8181 80%, black 100%);
}

.center-button {
	display: flex;
	justify-content: center;
	margin-top: 20px;
}

.btn-dark {
	width: 100%;
}
</style>
<script>
	function validarNumerosEVirgulas(input) {
		input.value = input.value.replace(/[^0-9,]/g, '');
	}

	function substituirPontosPorVirgulas(input) {
		input.value = input.value.replace(/\./g, ',');
	}

	function showSaveSuccessAlert() {
		alert("Produto salvo");
	}

	function onLoad() {
		var inputs = document.querySelectorAll("input[name='preco']");
		inputs.forEach(function(input) {
			substituirPontosPorVirgulas(input);
		});
	}
</script>
</head>
<body onload="onLoad()">
	<%@ include file="/components/navbar.jsp"%>
	<br>
	<div class="container" style="margin-bottom: 30px;">
		<div class="card">
			<div class="card-body">
				<c:if test="${product != null}">
					<form action="update" method="post" accept-charset="UTF-8">
				</c:if>
				<c:if test="${product == null}">
					<form action="insert" method="post" accept-charset="UTF-8">
				</c:if>

				<caption>
					<h2>
						<c:if test="${product != null}">
                            Editar produto
                        </c:if>
						<c:if test="${product == null}">
                            Adicionar novo produto
                        </c:if>
					</h2>
				</caption>

				<c:if test="${product != null}">
					<input type="hidden" name="id"
						value="<c:out value='${product.id}' />" />
				</c:if>

				<div class="form-group">
					<label for="codProd">Código do produto</label> <input min="0"
						value="<c:out value='${product.codProd}' />" class="form-control"
						name="codProd" required oninput="validarNumerosEVirgulas(this);">
				</div>

				<div class="form-group">
					<label for="nome">Nome do produto</label> <input type="text"
						value="<c:out value='${product.nome}' />" class="form-control"
						name="nome" required>
				</div>

				<div class="form-group">
					<label for="descricao">Descrição do produto</label>
					<textarea rows="3" class="form-control" name="descricao" required><c:out
							value='${product.descricao}' /></textarea>
				</div>

				<div class="form-group">
					<label for="marca">Marca do produto</label> <input type="text"
						value="<c:out value='${product.marca}' />" class="form-control"
						name="marca" required>
				</div>

				<div class="form-group">
					<label for="estoque">Estoque do produto</label> <input
						type="number" min="0" value="<c:out value='${product.estoque}' />"
						class="form-control" name="estoque" required>
				</div>

				<div class="form-group">
					<label for="preco">Preço do produto</label> <input step="any"
						min="0" value="<c:out value='${product.preco}' />"
						class="form-control" name="preco" required
						oninput="validarNumerosEVirgulas(this);">
				</div>

				<div class="center-button">
					<button type="submit" class="btn btn-dark">Salvar</button>
				</div>
				</form>
			</div>
		</div>
	</div>
	<%@ include file="/components/footer.jsp"%>
</body>
</html>
