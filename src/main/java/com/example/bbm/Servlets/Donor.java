package com.example.bbm.Servlets;

import com.example.bbm.dao.DonorDAO;
import com.example.bbm.dto.DonorDTO;

import java.io.IOException;
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

            donors.stream().forEach(d -> {
                System.out.println(d.getFirstName());
            });
            request.setAttribute("donors", donors);
            RequestDispatcher despatch = request.getRequestDispatcher("pages/donor.jsp");
            despatch.forward(request, response);

        } catch (Exception e) {
            e.printStackTrace();
        }
    }
public void destroy(){}

}
