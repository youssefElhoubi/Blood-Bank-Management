package com.example.bbm.Servlets;

import com.example.bbm.dao.RecipientDAO;
import com.example.bbm.dto.RecipientDTO;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class RecipientDetails extends HttpServlet {
    private RecipientDAO recipientDAO;
public void init() {
    recipientDAO = new RecipientDAO();
}
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html");
        Long id  = Long.parseLong(request.getParameter("id"));
        RecipientDTO recipient =  recipientDAO.findById(id);
        request.setAttribute("recipient", recipient);
        RequestDispatcher dispatcher = request.getRequestDispatcher("pages/recipientDetails.jsp");
        dispatcher.forward(request, response);
    }

public void destroy(){}
}
