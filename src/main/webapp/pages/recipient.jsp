<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="java.util.*, com.example.bbm.dto.RecipientDTO" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Donor List | Blood Donation Center</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <style>
        body {
            background-color: #fff5f5;
        }
    </style>
</head>
<body class="min-h-screen flex flex-col items-center">
<!-- Header -->
<%@ include file="../components/nav.jsp" %>

<!-- Page Title -->
<div class="text-center mt-10">
    <h2 class="text-4xl font-extrabold text-red-700">List of Donors</h2>
    <p class="text-gray-600 mt-2">Together, we save lives 🩸</p>
</div>

<!-- Donor Table -->
<div class="w-full max-w-6xl mt-8 bg-white shadow-lg rounded-2xl overflow-hidden">
    <table class="min-w-full text-sm text-left border-collapse">
        <thead class="bg-red-600 text-white uppercase text-sm">
        <tr>
            <th class="px-6 py-3">First Name</th>
            <th class="px-6 py-3">Last Name</th>
            <th class="px-6 py-3">Email</th>
            <th class="px-6 py-3">Phone</th>
            <th class="px-6 py-3">Blood Type</th>
            <th class="px-6 py-3">Status</th>
            <th class="px-6 py-3">action</th>
        </tr>
        </thead>
        <tbody class="divide-y divide-gray-200">
        <%
            List<RecipientDTO> recipient = (List<RecipientDTO>) request.getAttribute("RecipientDTO");
            if (recipient != null && !recipient.isEmpty()) {
                for (RecipientDTO d : recipient) {
        %>
        <tr class="hover:bg-red-50 transition">
            <td class="px-6 py-3 font-medium text-gray-800"><%= d.getFirstName() %>
            </td>
            <td class="px-6 py-3 text-gray-800"><%= d.getLastName() %>
            </td>
            <td class="px-6 py-3 text-gray-700"><%= d.getEmail() %>
            </td>
            <td class="px-6 py-3 text-gray-700"><%= d.getPhoneNumber() %>
            </td>
            <td class="px-6 py-3 font-semibold text-red-700"><%= d.getBloodType() %>
            </td>
            <td class="px-6 py-3">
                        <span class=" bg-gray-100 text-gray-600 px-3 py-1 rounded-full text-xs font-semibold">
                            <%= d.getMedicalCase() %>
                        </span>
            </td>
            <td class="px-6 py-3 font-semibold text-red-700">
                <a href=/"BBM/RecipientDetails?id=<%= d.getId() %>" class="hover:underline">View</a>
            </td>
        </tr>
        <%
            }
        } else {
        %>
        <tr>
            <td colspan="7" class="text-center py-6 text-gray-500 italic">No recipient found.</td>
        </tr>
        <% } %>
        </tbody>
    </table>
</div>


<!-- Footer -->
<footer class="mt-10 text-center text-gray-600 text-sm">
    <p>© <%= java.time.Year.now() %> Blood Donation Center — Give Blood, Save Lives ❤️</p>
</footer>



</body>
</html>
