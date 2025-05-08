package com.data.ss4;

import com.data.ss4.Product;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;

@WebServlet("/productList")
public class b7Servlet extends HttpServlet {
    private List<Product> products;

    @Override
    public void init() throws ServletException {
        // Khởi tạo danh sách sản phẩm tĩnh
        products = new ArrayList<>();
        products.add(new Product(1, "Laptop Dell", "ngon", 1500.0));
        products.add(new Product(2, "Smartphone Samsung", "Điện thoại thông minh", 800.0));
        products.add(new Product(3, "Tai nghe Sony", "Âm thanh sống động", 200.0));
        products.add(new Product(4, "Máy ảnh Canon", "Chất lượng hình ảnh cao", 1200.0));
        products.add(new Product(5, "Loa Bluetooth JBL", "Âm bass mạnh mẽ", 150.0));
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String minPriceStr = request.getParameter("minPrice");
        String maxPriceStr = request.getParameter("maxPrice");

        List<Product> filteredProducts = new ArrayList<>(products);

        // Lọc sản phẩm nếu có tham số giá
        if (minPriceStr != null && maxPriceStr != null && !minPriceStr.isEmpty() && !maxPriceStr.isEmpty()) {
            try {
                double minPrice = Double.parseDouble(minPriceStr);
                double maxPrice = Double.parseDouble(maxPriceStr);
                filteredProducts = products.stream()
                        .filter(p -> p.getPrice() >= minPrice && p.getPrice() <= maxPrice)
                        .collect(Collectors.toList());
            } catch (NumberFormatException e) {
                // Nếu nhập sai định dạng, giữ nguyên danh sách
            }
        }

        // Đưa danh sách đã lọc vào request
        request.setAttribute("products", filteredProducts);

        // Chuyển hướng đến JSP
        request.getRequestDispatcher("filterProduct.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }
}