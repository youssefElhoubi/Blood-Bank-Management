package com.example.bbm.Servlets;

import com.example.bbm.dao.DonorDAO;
import com.example.bbm.dto.DonorDTO;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class DonorDetails extends HttpServlet {
    private DonorDAO donorDAO;
    private DonorDTO donorDTO;
public void init() {
    donorDAO = new DonorDAO();
}

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    try {
        response.setContentType("text/html");
        Long Id = Long.parseLong(request.getParameter("Id"));
        donorDTO = donorDAO.findById(Id) ;
        request.setAttribute("donor", donorDTO);
        RequestDispatcher dispatcher = request.getRequestDispatcher("pages/donorDetails.jsp");
        dispatcher.forward(request, response);
    } catch (Exception e) {
        e.printStackTrace();
    }
    }
public void destroy(){}

}
