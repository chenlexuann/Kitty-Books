package servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import java.util.ArrayList;
import books.Book;

@WebServlet("/removeBookServlet")
public class removeBookServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public removeBookServlet() {
        super();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String bookOrderParam = request.getParameter("WhichBook");
        
        if (bookOrderParam != null && !bookOrderParam.isEmpty()) {
            int bookOrder = Integer.parseInt(bookOrderParam);

            // Retrieve cart details from session
            ArrayList<Book> booksInCart = (ArrayList<Book>) request.getSession().getAttribute("cart");

            if (booksInCart != null && bookOrder >= 0 && bookOrder < booksInCart.size()) {
                booksInCart.remove(bookOrder); // Remove the book using the correct index
            }
        }

        // Redirect back to the cart page
        response.sendRedirect(request.getContextPath() + "/getCartServlet");
    }


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}
}