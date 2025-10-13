package com.example.bbm.Servlets;

import com.example.bbm.dao.DonorDAO;
import com.example.bbm.dao.RecipientDAO;
import com.example.bbm.dto.DonorDTO;
import com.example.bbm.dto.RecipientDTO;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class Donation extends HttpServlet {
    public void init() {
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html");
        List<RecipientDTO> satisfiedRecipients = new RecipientDAO().findSatisfiedRecipients();
        List<RecipientDTO> PendingRecipients = new RecipientDAO().findPendingRecipients();
        request.setAttribute("satisfiedRecipients", satisfiedRecipients);
        request.setAttribute("PendingRecipients", PendingRecipients);
        RequestDispatcher dispatcher = request.getRequestDispatcher("pages/donation.jsp");
        dispatcher.forward(request, response);
    }

    public void destroy() {
    }
}
