<%@ page import="com.example.bbm.dto.RecipientDTO" %>
<%@ page import="java.util.List" %>
<%@ page import="com.example.bbm.dto.DonorDTO" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    RecipientDTO recipient = (RecipientDTO) request.getAttribute("recipient");
    List<DonorDTO> donor = (List<DonorDTO>) request.getAttribute("donors");
%>
<html>
<head>
    <meta charset="UTF-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <title>Blood Donation</title>
    <script src="https://cdn.tailwindcss.com"></script>
</head>
<body class="bg-gray-100 min-h-screen flex flex-col items-center py-10">

<h1 class="text-3xl font-bold text-red-600 mb-8">🩸 Blood Donation Center</h1>

<div class="w-full max-w-5xl bg-white shadow-xl rounded-2xl p-8 space-y-10">

    <!-- Recipient Info Section -->
    <section class="border border-red-200 rounded-xl p-6 bg-red-50">
        <h2 class="text-xl font-semibold text-red-700 mb-4">Recipient Information</h2>
        <div class="grid grid-cols-1 md:grid-cols-3 gap-4 text-gray-800">
            <div>
                <p class="text-sm font-medium text-gray-500">Name</p>
                <p class="font-semibold"><%= recipient.getFirstName() + " " + recipient.getLastName() %>
                </p>
            </div>
            <div>
                <p class="text-sm font-medium text-gray-500">Blood Type</p>
                <p class="font-semibold">
                    <%=recipient.getBloodType()%>
                </p>
            </div>
            <div>
                <p class="text-sm font-medium text-gray-500">Needed Bags</p>
                <p class="font-semibold"><%= recipient.getRequiredBloodBags()%></p>
            </div>
        </div>
    </section>

    <!-- Donors List Section -->
    <section>
        <h2 class="text-xl font-semibold text-green-700 mb-4">Available Donors</h2>

        <div class="overflow-x-auto">
            <form method="post" action="/BBM/donation">
                <input hidden="hidden" name="id" value="<%= recipient.getId() %>">
                <table class="min-w-full border border-gray-200 rounded-lg overflow-hidden">
                    <thead class="bg-green-600 text-white">
                    <tr>
                        <th class="py-3 px-4 text-left">Select</th>
                        <th class="py-3 px-4 text-left">Name</th>
                        <th class="py-3 px-4 text-left">Blood Type</th>
                        <th class="py-3 px-4 text-left">Weight (kg)</th>
                        <th class="py-3 px-4 text-left">Status</th>
                    </tr>
                    </thead>
                    <tbody class="bg-white divide-y divide-gray-200">
                    <%
                        if (donor != null && !donor.isEmpty()) {
                            for (DonorDTO d : donor) {
                    %>
                    <tr class="hover:bg-gray-50 transition">
                        <td class="py-3 px-4"><input type="checkbox" value="<%=d.getId()%>" class="w-4 h-4 text-red-600 rounded" name="donor"/>

                        </td>

                        <td class="py-3 px-4"><%=d.getFirstName() + " " + d.getLastName()%>
                        </td>
                        <td class="py-3 px-4"><%=d.getBloodType()%>
                        </td>
                        <td class="py-3 px-4"><%=d.getWeight()%>
                        </td>
                        <td class="py-3 px-4 text-green-600 font-medium"><%=d.getDonorStatus().toString()%></td>
                    </tr>
                    <%
                        }
                    } else {
                    %>
                    <tr>
                        <td colspan="5" class="text-center py-6 text-gray-500 italic">No donors found.</td>
                    </tr>
                    <%}%>
                    </tbody>
                </table>


        </div>
    </section>

    <!-- Confirm Button -->
    <div class="text-right">
        <button class="bg-red-600 hover:bg-red-700 text-white font-semibold px-6 py-3 rounded-lg shadow-md transition" type="submit" >
            Confirm Donation
        </button>
    </div>
    </form>
</div>
</body>
</html>
