package com.example.bbm.Servlets;

import com.example.bbm.dao.DonorDAO;
import com.example.bbm.dao.RecipientDAO;
import com.example.bbm.dto.DonorDTO;
import com.example.bbm.dto.RecipientDTO;
import com.example.bbm.enums.BloodType;

import java.io.IOException;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class MakeDonation extends HttpServlet {
public void init() {}
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html");
        Long id = Long.parseLong(request.getParameter("id"));
        RecipientDTO recipient = new RecipientDAO().findById(id);
        BloodType bloodType = recipient.getBloodType();
        List<DonorDTO> donors = new DonorDAO().findByBloodType(bloodType);
        request.setAttribute("donors", donors);
        request.setAttribute("recipient", recipient);

        RequestDispatcher dispatcher = request.getRequestDispatcher("pages/makeDonation.jsp");
        dispatcher.forward(request, response);
    }

public void destroy(){}
}
