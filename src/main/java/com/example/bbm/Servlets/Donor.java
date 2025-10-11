package com.example.bbm.Servlets;

import com.example.bbm.dao.DonorDAO;
import com.example.bbm.dto.DonorDTO;
import com.example.bbm.enums.BloodType;
import com.example.bbm.enums.Desize;
import com.example.bbm.enums.DonorStatus;

import java.io.IOException;
import java.time.LocalDateTime;
import java.time.LocalTime;
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

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {

            String weightParam = request.getParameter("weight");
            BloodType bloodTypeParam = BloodType.valueOf(request.getParameter("bloodType"));
            DonorStatus donorStatus = DonorStatus.valueOf(request.getParameter("donorStatus"));
            String lastDonationDate = request.getParameter("lastDonationDate");
            Boolean isPregnant = request.getParameter("isPregnant").equals("yes") ? true : false;
            Boolean isBreastFeeding = request.getParameter("isBreastfeeding").equals("yes") ? true : false;
            String medicalNotes = request.getParameter("medicalNotes");

            // Convert numeric values
            Double weight = null;
            if (weightParam != null && !weightParam.isEmpty()) {
                weight = Double.parseDouble(weightParam);
            }

            // Convert boolean values


            // Convert date
            LocalDateTime date = null;
            if (lastDonationDate != null && !lastDonationDate.isEmpty()) {
                date = LocalDateTime.parse(lastDonationDate);
            }

            // Example: You can now use these values to update your donor in DB
            // (Assuming you have a donor ID in session or request)
            Long donorId = Long.parseLong( request.getParameter("id")); // if exists

            // Example object population (adjust to your structure)
            DonorDTO donor = new DonorDTO();
            donor.setWeight(weight);
            donor.setDonorStatus(donorStatus);
            donor.setLastDonationDate(date);
            donor.setMedicalNotes(medicalNotes);
            donor.setIsPregnant(isPregnant);
            donor.setIsBreastfeeding(isBreastFeeding);
            donor.setBloodType(bloodTypeParam);
            donor.setId(donorId);
            new DonorDAO().update(donor);
            response.sendRedirect("/BBM/donorDetails?id="+donorId);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    public void destroy() {
    }

}
