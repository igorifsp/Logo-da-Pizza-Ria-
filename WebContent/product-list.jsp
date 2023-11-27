<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%> <%@ taglib uri="http://java.sun.com/jsp/jstl/core"
prefix="c"%> <%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<!DOCTYPE html>
<html lang="pt-br">
  <head>
    <meta charset="UTF-8" />
    <link
      rel="icon"
      href="https://github.com/igorifsp/Logos/blob/main/icon_techstore.png?raw=true"
    />
    <meta
      name="viewport"
      content="width=device-width, initial-scale=1, shrink-to-fit=no"
    />

    <link
      rel="stylesheet"
      href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
      integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
      crossorigin="anonymous"
    />
    <title>Tech Store</title>
    <style>
      body {
        background: linear-gradient(90deg, black 0%, #3a8181 80%, #329ead 100%);
      }

      h2 {
        color: black;
        font-weight: bold;
      }

      .custom-hr {
        border: 1px solid #15d6d3;
        margin: 20px 0;
      }

      .table-responsive {
        overflow: auto;
      }

      .container {
        text-align: center;
        margin-top: 20px;
      }

      input {
        width: 100%;
      }

      .btn-round {
        border-radius: 20px;
        margin-right: 5px;
      }

      .btn-edit {
        background-color: #28a745;
        color: #fff;
      }

      .btn-delete {
        background-color: #dc3545;
        color: #fff;
      }

      .pagination {
        display: flex;
        justify-content: center;
        margin-top: 20px;
      }

      .pagination a {
        color: black;
        float: left;
        padding: 8px 16px;
        text-decoration: none;
        transition: background-color 0.3s;
      }

      .pagination a.active {
        background-color: black;
        color: white;
      }

      .pagination a:hover:not(.active) {
        background-color: #3a8181;
      }

      .title {
        color: #15d6d3 !important;
      }

      #successAlert {
        display: none;
      }

      #productTable {
        border-collapse: collapse;
        width: 100%;
      }

      #productTable th,
      #productTable td {
        border: 5px solid #15d6d3;
        padding: 8px;
      }

      #productTable th {
        background-color: black;
        color: white;
      }

      #productTable tbody tr {
        background-color: black;
        color: white;
        font-weight: bold;
      }

      #productTable tbody tr:hover {
        background-color: #054c56;
      }
    </style>

    <script>
      function filterTable(columnIndex) {
        var input, filter, table, tr, td, i, txtValue;
        input = document.getElementById("filterInput" + columnIndex);
        filter = input.value.toUpperCase();
        table = document.getElementById("productTable");
        tr = table.getElementsByTagName("tr");

        for (i = 0; i < tr.length; i++) {
          td = tr[i].getElementsByTagName("td")[columnIndex];
          if (td) {
            txtValue = td.textContent || td.innerText;
            if (txtValue.toUpperCase().indexOf(filter) > -1) {
              tr[i].style.display = "";
            } else {
              tr[i].style.display = "none";
            }
          }
        }
      }

      function confirmDelete(productId) {
        var result = confirm("Tem certeza que deseja apagar este produto?");
        if (result) {
          deleteProduct(productId);
        }
      }

      function deleteProduct(productId) {
        showSuccessAlert();

        return false;
      }

      function showSuccessAlert() {
        var successAlert = document.getElementById("successAlert");
        successAlert.style.display = "block";
        setTimeout(function () {
          successAlert.style.display = "none";
        }, 5000);
      }
    </script>
  </head>
  <body>
    <%@ include file="/components/navbar.jsp"%>

    <div class="container">
      <h2 class="text-center">Produtos em Estoque</h2>
      <hr class="custom-hr" />
      <div class="container text-left">
        <a
          href="<%=request.getContextPath()%>/new"
          class="btn btn-info btn-round"
          >Adicionar Novo Produto</a
        >
      </div>
      <br />

      <div
        id="successAlert"
        class="alert alert-success alert-dismissible fade show"
        role="alert"
      >
        <strong>Apagado com sucesso!</strong>
        <button
          type="button"
          class="close"
          data-dismiss="alert"
          aria-label="Close"
        >
          <span aria-hidden="true">&times;</span>
        </button>
      </div>

      <div class="table-responsive">
        <table class="table table-bordered" id="productTable">
          <thead>
            <tr>
              <th class="title">
                Código
                <input type="text" id="filterInput0" onkeyup="filterTable(0)" />
              </th>
              <th class="title">
                Nome
                <input type="text" id="filterInput1" onkeyup="filterTable(1)" />
              </th>
              <th class="title">
                Descrição
                <input type="text" id="filterInput2" onkeyup="filterTable(2)" />
              </th>
              <th class="title">
                Marca
                <input type="text" id="filterInput3" onkeyup="filterTable(3)" />
              </th>
              <th class="title">
                Estoque
                <input type="text" id="filterInput4" onkeyup="filterTable(4)" />
              </th>
              <th class="title">
                Preço
                <input type="text" id="filterInput5" onkeyup="filterTable(5)" />
              </th>
            </tr>
          </thead>
          <tbody>
            <c:forEach var="product" items="${listProduct}">
              <tr>
                <td><c:out value="${product.codProd}" /></td>
                <td><c:out value="${product.nome}" /></td>
                <td><c:out value="${product.descricao}" /></td>
                <td><c:out value="${product.marca}" /></td>
                <td><c:out value="${product.estoque}" /></td>
                <td>
                  <fmt:formatNumber
                    value="${product.preco}"
                    type="currency"
                    currencySymbol="R$"
                  />
                </td>
                <td>
                  <a
                    href="<%=request.getContextPath()%>/edit?id=<c:out value='${product.id}' />"
                    class="btn btn-secondary btn-round btn-edit"
                    >Editar</a
                  >
                  <a
                    href="<%=request.getContextPath()%>/delete?id=<c:out value='${product.id}' />"
                    class="btn btn-dark btn-round btn-delete"
                    onclick="return confirmDelete('<c:out value='${product.id}' />');"
                    >Deletar</a
                  >
                </td>
              </tr>
            </c:forEach>
          </tbody>
        </table>
      </div>

      <div class="pagination" style="margin-bottom: 30px">
        <c:forEach var="i" begin="1" end="${totalPages}">
          <a
            href="<%=request.getContextPath()%>/list?page=<c:out value='${i}' />"
            class="<c:if test='${currentPage eq i}'>active</c:if>"
          >
            ${i}
          </a>
        </c:forEach>
      </div>
    </div>
    <%@ include file="/components/footer.jsp"%>

    <script
      src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
      integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
      crossorigin="anonymous"
    ></script>
    <script
      src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"
      integrity="sha384-UJz9Y6e2Iq0D6h3dJOdKPD4BbpZf5PmJQGi5t9xUzCqMazQTH"
      crossorigin="anonymous"
    ></script>
    <script
      src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"
      integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM"
      crossorigin="anonymous"
    ></script>
  </body>
</html>
