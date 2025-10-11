package com.example.bbm.Servlets;

import com.example.bbm.dao.RecipientDAO;
import com.example.bbm.dto.RecipientDTO;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class Recipient extends HttpServlet {
    private RecipientDAO recipientDAO;
    private RecipientDTO recipientDTO;
public void init() {
    this.recipientDAO = new RecipientDAO();
    this.recipientDTO = new RecipientDTO();
}
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html");
        RequestDispatcher dispatch  = request.getRequestDispatcher("pages/recipient.jsp");
        List<RecipientDTO> recipientDTO = recipientDAO.findAll();
        request.setAttribute("recipients", recipientDTO);
        dispatch.forward(request, response);
    }
public void destroy(){}
}
