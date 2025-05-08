package com.data.ss4;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
@WebServlet("/product")
public class ProductServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        Product[] products = {
                new Product(1, "Product A", "Description A", 10.0),
                new Product(2, "Product B", "Description B", 20.0),
                new Product(3, "Product C", "", 0.0),
        };
        request.setAttribute("products", products);
        request.getRequestDispatcher("productList.jsp").forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String idParam = request.getParameter("id");
        request.setAttribute("searchId", idParam);

        Product[] products = {
                new Product(1, "Product A", "Description A", 10.0),
                new Product(2, "Product B", "Description B", 20.0),
                new Product(3, "Product C", "", 0),
        };

        Product foundProduct = null;
        try {
            int searchId = Integer.parseInt(idParam.trim());
            for (Product product : products) {
                if (product.getId() == searchId) {
                    foundProduct = product;
                    break;
                }
            }
        } catch (NumberFormatException e) {
            request.setAttribute("error", "Invalid product ID format.");
        } catch (Exception e) {
            // Handle any other exceptions
            request.setAttribute("error", "An error occurred while searching for the product.");
        }

        request.setAttribute("foundProduct", foundProduct);
        request.getRequestDispatcher("seachProduct.jsp").forward(request, response);
    }

}
