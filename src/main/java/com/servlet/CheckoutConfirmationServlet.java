package com.servlet;

import com.Database;
import com.model.Product;
import org.json.JSONArray;

import javax.servlet.ServletException;
import javax.servlet.http.*;
import java.io.IOException;
import java.net.URLDecoder;
import java.util.ArrayList;
import java.util.List;

public class CheckoutConfirmationServlet extends HttpServlet{
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session =  req.getSession(false);
        if (session == null || session.getAttribute("user") == null) {
            if(session != null) {
                session.setAttribute("errormsg", "You need to sign up or log in before purchase.");
            }
            req.getRequestDispatcher("/loginOrSignup.jsp").forward(req, resp);
            return;
        }

        List<Product> purchaseItems = new ArrayList<>();
        Boolean productFound = false;
        float totalSum = 0;
        Cookie[] cookies1 = req.getCookies();
        for(Cookie cookie : cookies1){
            if(cookie.getName().equals("product")){
                String productsString = URLDecoder.decode(cookie.getValue(), "UTF-8");
                try {
                    JSONArray jsonArray = new JSONArray(productsString);
                    List<Object> productIds = jsonArray.toList();
                    for(Object Id : productIds){
                        Product prod = Database.allproducts.get(Id.toString());
                        purchaseItems.add(prod);
                        totalSum += prod.getPrice();
                    }
                    productFound = true;

                } catch (Exception e){
                    e.printStackTrace();
                }
            }
        }

        if(!productFound){
            session.setAttribute("errormsg", "Your cart is empty.");
            req.getRequestDispatcher("/index.jsp").forward(req, resp);
        }

        session.setAttribute("totalSum", totalSum);
        session.setAttribute("purchaseItems", purchaseItems);
        req.getRequestDispatcher("/pages/checkout_confirmation.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

    }
}
