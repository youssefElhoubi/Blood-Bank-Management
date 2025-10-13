<%@ page import="java.util.List" %>
<%@ page import="com.example.bbm.dto.RecipientDTO" %>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Recipients List</title>
    <script src="https://cdn.tailwindcss.com"></script>
</head>
<body class="bg-gray-50 text-gray-800">

<!-- Header -->
<%@include file="../components/nav.jsp" %>

<main class="max-w-6xl mx-auto mt-10 px-4 space-y-10">

    <!-- Pending Recipients -->
    <section class="bg-white rounded-2xl shadow p-6">
        <h2 class="text-xl font-semibold mb-4 text-red-600">Pending Recipients</h2>
        <div class="overflow-x-auto">
            <table class="min-w-full text-sm border border-gray-200">
                <thead class="bg-gray-100">
                <tr>
                    <th class="px-4 py-2 text-left border-b">#</th>
                    <th class="px-4 py-2 text-left border-b">Recipient Name</th>
                    <th class="px-4 py-2 text-left border-b">Blood Type</th>
                    <th class="px-4 py-2 text-left border-b">Hospital</th>
                    <th class="px-4 py-2 text-left border-b">Required Bags</th>
                    <th class="px-4 py-2 text-left border-b">Collected</th>
                    <th class="px-4 py-2 text-left border-b">Status</th>
                    <th class="px-4 py-2 text-center border-b">Action</th>
                </tr>
                </thead>
                <tbody>
                <% List<RecipientDTO> pendingRecipients = (List<RecipientDTO>) request.getAttribute("PendingRecipients");
                    if (pendingRecipients != null || !pendingRecipients.isEmpty()) {
                        for (RecipientDTO r : pendingRecipients) {
                %>
                <tr class="hover:bg-gray-50">
                    <td class="px-4 py-2 border-b"><%=r.getId()%>
                    </td>
                    <td class="px-4 py-2 border-b"><%=r.getFirstName()%> <%=r.getLastName()%>
                    </td>
                    <td class="px-4 py-2 border-b"><%=r.getBloodType()%>
                    </td>
                    <td class="px-4 py-2 border-b"><%=r.getHospital()%>
                    </td>
                    <td class="px-4 py-2 border-b"><%=r.getRequiredBloodBags()%>
                    </td>
                    <td class="px-4 py-2 border-b"><%=r.getCurrentBloodBags()%>
                    </td>
                    <td class="px-4 py-2 border-b text-yellow-600 font-semibold"><%=r.getState()%>
                    </td>
                    <td class="px-4 py-2 border-b text-center">
                        <a href="/BBM/makeonation?id=<%r.getId()%>"
                           class="bg-red-600 text-white px-3 py-1 rounded-lg hover:bg-red-700">
                            make donation
                        </a>
                    </td>
                </tr>
                <%
                    }
                } else {
                %>
                <tr>
                    <td colspan="6" class="text-center py-6 text-gray-500 italic">no pending recipient.</td>
                </tr>
                <%}%>
                </tbody>
            </table>
        </div>
    </section>

    <!-- Satisfied Recipients -->
    <section class="bg-white rounded-2xl shadow p-6">
        <h2 class="text-xl font-semibold mb-4 text-green-600">Satisfied Recipients</h2>
        <div class="overflow-x-auto">
            <table class="min-w-full text-sm border border-gray-200">
                <thead class="bg-gray-100">
                </thead>
                <tbody>
                <% List<RecipientDTO> SatisfiedRecipients = (List<RecipientDTO>) request.getAttribute("satisfiedRecipients");
                    if (SatisfiedRecipients != null || !SatisfiedRecipients.isEmpty()) {
                        for (RecipientDTO r: pendingRecipients) {
                %>
                <tr class="hover:bg-gray-50">
                    <td class="px-4 py-2 border-b"><%=r.getId()%>
                    </td>
                    <td class="px-4 py-2 border-b"><%=r.getFirstName()%> <%=r.getLastName()%>
                    </td>
                    <td class="px-4 py-2 border-b"><%=r.getBloodType()%>
                    </td>
                    <td class="px-4 py-2 border-b"><%=r.getHospital()%>
                    </td>
                    <td class="px-4 py-2 border-b"><%=r.getRequiredBloodBags()%>
                    </td>
                    <td class="px-4 py-2 border-b"><%=r.getCurrentBloodBags()%>
                    </td>
                    <td class="px-4 py-2 border-b text-yellow-600 font-semibold"><%=r.getState()%>
                    </td>
                </tr>
                <%
                    }
                } else {
                %>
                <tr>
                    <td colspan="6" class="text-center py-6 text-gray-500 italic">no pending recipient.</td>
                </tr>
                <%}%>
                </tbody>
            </table>
        </div>
    </section>

</main>

<!-- Footer -->
<footer class="text-center text-sm text-gray-500 py-6 mt-10">
    © 2025 Blood Bank Management — All Rights Reserved
</footer>

</body>
<body>

</body>
</html>
