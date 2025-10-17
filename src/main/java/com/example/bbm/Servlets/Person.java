package com.example.bbm.Servlets;

import com.example.bbm.dao.DonorDAO;
import com.example.bbm.dao.PersonDAO;
import com.example.bbm.dao.RecipientDAO;
import com.example.bbm.dto.DonorDTO;
import com.example.bbm.dto.PersonDTO;
import com.example.bbm.dto.RecipientDTO;
import com.example.bbm.enums.*;

import java.io.IOException;
import java.io.PrintWriter;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet(name = "Person", value = "/Person")
public class Person extends HttpServlet {
    private DonorDTO donorDTO;
    private RecipientDTO recipientDTO;
    private DonorDAO donorDAO;
    private RecipientDAO recipientDAO;

public void init() {
    donorDTO = new DonorDTO();
    recipientDTO = new RecipientDTO();
    donorDAO = new DonorDAO();
    recipientDAO = new RecipientDAO();
}

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html");
        try {
            String firstName = request.getParameter("firstName");
            String lastName = request.getParameter("lastName");
            String email = request.getParameter("email");
            String phoneNumber = request.getParameter("phone");
            String dateOfBirth = request.getParameter("dateOfBirth");
            DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
            LocalDateTime date = LocalDate.parse(dateOfBirth, formatter).atStartOfDay();
            LocalDateTime eighteenYearsAgo = LocalDateTime.now().minusYears(18);
            if(!date.isBefore(eighteenYearsAgo)) {
                HttpSession session = request.getSession();
                session.setAttribute("age error", "user must be at least 18 years ago.");
                response.sendRedirect("BBM/donor");
            }
            Gender gender = Gender.valueOf(request.getParameter("gender"));
            BloodType bloodType = BloodType.valueOf(request.getParameter("bloodType"));
            Desize desize = Desize.valueOf( request.getParameter("desize"));
            Double weight = request.getParameter("weight")!=null ? Double.parseDouble(request.getParameter("weight")): 0  ;
            String persontype = request.getParameter("personType");
            DonorStatus donorStatus = DonorStatus.valueOf(request.getParameter("donorStatus")!=null ? request.getParameter("donorStatus") : DonorStatus.UNAVAILABLE.toString());
            String requiredBloodBags = request.getParameter("requiredBloodBags");
            String hospital = request.getParameter("hospital");
            boolean pregnant = "yes".equalsIgnoreCase(request.getParameter("preg"));
            boolean breastfeeding = "yes".equalsIgnoreCase(request.getParameter("brestFeeding"));
            if (persontype.equals("donor")){
                donorDTO.setFirstName(firstName);
                donorDTO.setLastName(lastName);
                donorDTO.setEmail(email);
                donorDTO.setPhoneNumber(phoneNumber);
                donorDTO.setDateOfBirth(date);
                donorDTO.setGender(gender);
                donorDTO.setBloodType(bloodType);
                donorDTO.setRegistrationDate(LocalDateTime.now());
                donorDTO.setDesize(desize);
                donorDTO.setWeight(weight);
                donorDTO.setDonorStatus(donorStatus);
                if (gender == Gender.FEMALE){
                    donorDTO.setIsPregnant(pregnant);
                    donorDTO.setIsBreastfeeding(breastfeeding);
                }
                donorDAO.create(donorDTO);
            }
            else {
                recipientDTO.setFirstName(firstName);
                recipientDTO.setLastName(lastName);
                recipientDTO.setEmail(email);
                recipientDTO.setPhoneNumber(phoneNumber);
                recipientDTO.setDateOfBirth(date);
                recipientDTO.setGender(gender);
                recipientDTO.setBloodType(bloodType);
                recipientDTO.setRegistrationDate(LocalDateTime.now());
                recipientDTO.setRequiredBloodBags(Integer.parseInt(requiredBloodBags));
                recipientDTO.setHospital(hospital);
                recipientDTO.setDoctorName(request.getParameter("doctor"));
                recipientDTO.setMedicalCase("medical");
                recipientDTO.setMedicalCondition(MedicalCondition.valueOf(request.getParameter("medicalCondition")));
                recipientDAO.create(recipientDTO);
            }
            response.sendRedirect("/BBM/donor");
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
public void destroy(){}

}
