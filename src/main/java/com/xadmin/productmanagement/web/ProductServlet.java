package com.xadmin.productmanagement.web;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.xadmin.productmanagement.bean.Product;
import com.xadmin.productmanagement.dao.ProductDao;

/**
 * Servlet implementation class ProductServlet
 */
@WebServlet("/")
public class ProductServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private ProductDao productDao;

	public void init() {
		productDao = new ProductDao();
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		doGet(request, response);
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");

		String action = request.getServletPath();

		try {
			switch (action) {
			case "/new":
				showNewForm(request, response);
				break;
			case "/insert":
				insertProduct(request, response);
				break;
			case "/delete":
				deleteProduct(request, response);
				break;
			case "/edit":
				showEditForm(request, response);
				break;
			case "/update":
				updateProduct(request, response);
				break;
			case "/list":
				listProducts(request, response);
				break;
			default:
				response.sendRedirect("list?page=1");
				break;
			}
		} catch (SQLException ex) {
			handleSQLException(ex, request, response);
		}
	}

	private void handleSQLException(SQLException e, HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		if (isDuplicateKeyError(e)) {
			request.setAttribute("errorMessage", "Erro ao processar a solicitação. Por favor, tente novamente.");

		} else {
			request.setAttribute("errorMessage", "Já existe um produto com este código.");

		}
		RequestDispatcher dispatcher = request.getRequestDispatcher("components/error.jsp");
		dispatcher.forward(request, response);
	}

	private boolean isDuplicateKeyError(SQLException e) {
		return e.getSQLState() != null && e.getSQLState().equals("23000") && e.getErrorCode() == 1062;
	}

	private void listProducts(HttpServletRequest request, HttpServletResponse response)
			throws SQLException, IOException, ServletException {
		int currentPage = 1;
		int recordsPerPage = 10;

		if (request.getParameter("page") != null) {
			currentPage = Integer.parseInt(request.getParameter("page"));
		}

		int start = (currentPage - 1) * recordsPerPage;

		List<Product> listProduct = productDao.selectProductsPaginated(start, recordsPerPage);
		request.setAttribute("listProduct", listProduct);

		int totalProducts = productDao.getTotalProducts();
		int totalPages = (int) Math.ceil((double) totalProducts / recordsPerPage);

		request.setAttribute("totalPages", totalPages);
		request.setAttribute("currentPage", currentPage);

		RequestDispatcher dispatcher = request.getRequestDispatcher("product-list.jsp");
		dispatcher.forward(request, response);
	}

	private void showNewForm(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		RequestDispatcher dispatcher = request.getRequestDispatcher("product-form.jsp");
		dispatcher.forward(request, response);
	}

	private void showEditForm(HttpServletRequest request, HttpServletResponse response)
			throws SQLException, ServletException, IOException {
		int id = Integer.parseInt(request.getParameter("id"));
		Product existingProduct = productDao.selectProduct(id);
		RequestDispatcher dispatcher = request.getRequestDispatcher("product-form.jsp");
		request.setAttribute("product", existingProduct);
		dispatcher.forward(request, response);

	}

	private void insertProduct(HttpServletRequest request, HttpServletResponse response)
			throws SQLException, IOException {
		int codProd = Integer.parseInt(request.getParameter("codProd"));
		String nome = request.getParameter("nome");
		String descricao = request.getParameter("descricao");
		String marca = request.getParameter("marca");
		int estoque = Integer.parseInt(request.getParameter("estoque"));
		String precoStr = request.getParameter("preco").replace(",", ".");
		double preco = Double.parseDouble(precoStr);

		Product newProduct = new Product(codProd, nome, descricao, marca, estoque, preco);
		productDao.insertProduct(newProduct);
		response.sendRedirect("list");
	}

	private void updateProduct(HttpServletRequest request, HttpServletResponse response)
			throws SQLException, IOException {
		int id = Integer.parseInt(request.getParameter("id"));
		int codProd = Integer.parseInt(request.getParameter("codProd"));
		String nome = request.getParameter("nome");
		String descricao = request.getParameter("descricao");
		String marca = request.getParameter("marca");
		int estoque = Integer.parseInt(request.getParameter("estoque"));
		String precoStr = request.getParameter("preco").replace(",", ".");
		double preco = Double.parseDouble(precoStr);

		Product mouse = new Product(id, codProd, nome, descricao, marca, estoque, preco);
		productDao.updateProduct(mouse);
		response.sendRedirect("list");
	}

	private void deleteProduct(HttpServletRequest request, HttpServletResponse response)
			throws SQLException, IOException {
		String idParam = request.getParameter("id");

		if (idParam != null && !idParam.isEmpty()) {
			int id = Integer.parseInt(idParam);
			productDao.deleteProduct(id);
			response.sendRedirect("list");
		} else {
			response.sendRedirect("list");
		}
	}

}
