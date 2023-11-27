<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
  <head>
    <title>Erro</title>
    <style>
      body {
        background-image: url("https://github.com/igorifsp/Logos/blob/main/error.jpg?raw=true");
        background-size: cover; 
        background-repeat: no-repeat;
        background-position: center center;
        display: flex;
        align-items: center;
        justify-content: center;
        height: 100vh; 
        margin: 0;
      }

      .card {
        background: linear-gradient(90deg, #84ffff 0%, #3a8181 100%);
        border: 5px solid #2215d6;
        width: 300px; 
        text-align: center;
        padding: 20px;
        border-radius: 10px; 
        box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
      }
    </style>

    <script>
      window.onload = function () {
        var errorMessage =
          '<%= (String)request.getAttribute("errorMessage") %>';
        if (errorMessage !== null && errorMessage !== "") {
          alert(errorMessage);
        }
      };
    </script>
  </head>
  <body>
    <div class="card">
      <h2>Ocorreu um erro</h2>
      <p><%= request.getAttribute("errorMessage") %></p>
      <p>
        <a href="<%= request.getContextPath() %>/list">Voltar para o estoque</a>
      </p>
    </div>

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
