package servlets;
//Author: Chen Lexuan
//Class: DIT/FT/2A/02
//Date: 6/8/2023
//Description: ST0510/JAD Assignment 2


import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import model.*;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class cartQuantityServlet
 */
@WebServlet("/quantity-inc-dec")
public class cartQuantityServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public cartQuantityServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
//		response.getWriter().append("Served at: ").append(request.getContextPath());
		try (PrintWriter out = response.getWriter()) {
			String action = request.getParameter("action");
			int id = Integer.parseInt(request.getParameter("id"));
			ArrayList<Cart> cart_list = (ArrayList<Cart>) request.getSession().getAttribute("cart-list");
			int max = Integer.parseInt(request.getParameter("quantityMax"));
			if (action != null && id >= 1) {
				if (action.equals("inc")) {
					for (Cart c : cart_list) {
						if (c.getBookId() == id && c.getCartQuantity() < max) {
							int quantity = c.getCartQuantity();
							quantity++;
							c.setCartQuantity(quantity);
						}
					}
					response.sendRedirect("cart.jsp");
				}

				if (action.equals("dec")) {
					for (Cart c : cart_list) {
						if (c.getBookId() == id && c.getCartQuantity() > 1) {
							int quantity = c.getCartQuantity();
							quantity--;
							c.setCartQuantity(quantity);
							break;
						}
					}
					response.sendRedirect("cart.jsp");
				}
			} else {
				response.sendRedirect("cart.jsp");
			}
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}