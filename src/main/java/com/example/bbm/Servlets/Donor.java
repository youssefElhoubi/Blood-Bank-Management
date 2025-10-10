package com.example.bbm.Servlets;

import com.example.bbm.dao.DonorDAO;
import com.example.bbm.dto.DonorDTO;
import com.example.bbm.enums.BloodType;
import com.example.bbm.enums.Desize;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


public class Donor extends HttpServlet {
    private DonorDTO donerDTO;

public void init() {
    donerDTO = new DonorDTO();
}

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html");
        try {
            List<DonorDTO> donors = new DonorDAO().findAll();
            List<BloodType> bloodTypes = Arrays.asList(BloodType.values());
            List<Desize> desize = Arrays.asList(Desize.values());
            request.setAttribute("bloodTypes", bloodTypes);
            request.setAttribute("donors", donors);
            request.setAttribute("desize", desize);
            RequestDispatcher despatch = request.getRequestDispatcher("pages/donor.jsp");
            despatch.forward(request, response);

        } catch (Exception e) {
            e.printStackTrace();
        }
    }
public void destroy(){}

}
