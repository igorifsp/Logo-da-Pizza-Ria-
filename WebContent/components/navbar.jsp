<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
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
    <link rel="preconnect" href="https://fonts.googleapis.com" />
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
    <link
      href="https://fonts.googleapis.com/css2?family=Nova+Square&display=swap"
      rel="stylesheet"
    />
    <title>Product Management</title>
    <style>
      body {
        font-family: "Nova Square", sans-serif;
      }

      .navbar {
        background-color: black;
        border: 8px solid #15d6d3;
      }

      .navbar-brand img {
        width: 30%;
      }

      .custom-nav-link {
        color: #15d6d3 !important;
        font-weight: bold;
        transition: color 0.3s ease;
      }

      .custom-nav-link:hover {
        color: #0e7c7b !important;
      }
    </style>
  </head>
  <body>
    <nav class="navbar navbar-expand-md navbar-dark">
      <a class="navbar-brand" href="<%=request.getContextPath()%>/list">
        <img
          src="https://github.com/igorifsp/Logos/blob/main/TechStore.gif?raw=true"
          alt="TechStore"
        />
      </a>
      <button
        class="navbar-toggler"
        type="button"
        data-toggle="collapse"
        data-target="#navbarNav"
        aria-controls="navbarNav"
        aria-expanded="false"
        aria-label="Toggle navigation"
      >
        <span class="navbar-toggler-icon"></span>
      </button>
      <div class="collapse navbar-collapse" id="navbarNav">
        <ul class="navbar-nav ml-auto">
          <li class="nav-item">
            <a
              class="nav-link custom-nav-link"
              href="<%=request.getContextPath()%>/new"
              >ADICIONAR</a
            >
          </li>
          <li class="nav-item">
            <a
              class="nav-link custom-nav-link"
              href="<%=request.getContextPath()%>/list"
              >ESTOQUE</a
            >
          </li>
        </ul>
      </div>
    </nav>

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
