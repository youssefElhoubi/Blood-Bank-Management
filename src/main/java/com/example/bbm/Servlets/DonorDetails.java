package com.example.bbm.Servlets;

import com.example.bbm.dao.DonorDAO;
import com.example.bbm.dto.DonorDTO;
import com.example.bbm.enums.BloodType;
import com.example.bbm.enums.Desize;
import com.example.bbm.enums.DonorStatus;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Arrays;
import java.util.List;
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
        Long Id = Long.valueOf(request.getParameter("id"));
        donorDTO = donorDAO.findById(Id) ;
        request.setAttribute("donor", donorDTO);
        List<BloodType>bloodTypes = Arrays.asList(BloodType.values());
        request.setAttribute("bloodTypes", bloodTypes);
        List<Desize> desizes = Arrays.asList(Desize.values());
        request.setAttribute("desizes", desizes);
        List<DonorStatus> donorStatus = Arrays.asList(DonorStatus.values());
        request.setAttribute("donorStatus", donorStatus);
        RequestDispatcher dispatcher = request.getRequestDispatcher("pages/donorDetails.jsp");
        dispatcher.forward(request, response);
    } catch (Exception e) {
        e.printStackTrace();
    }
    }
public void destroy(){}

}
