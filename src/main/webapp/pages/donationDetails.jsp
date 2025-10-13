<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Blood Donation Details</title>
    <script src="https://cdn.tailwindcss.com"></script>
</head>
<body class="bg-gray-50 text-gray-800">

<!-- Header -->
<%@include file="../components/nav.jsp" %>

<!-- Main Content -->
<main class="max-w-6xl mx-auto mt-10 px-4">

    <!-- Recipient Details Card -->
    <section class="bg-white rounded-2xl shadow p-6 mb-8">
        <h2 class="text-xl font-semibold mb-4 text-red-600">Recipient Details</h2>
        <div class="grid grid-cols-1 sm:grid-cols-2 md:grid-cols-3 gap-4 text-sm">
            <div>
                <span class="font-semibold">Name:</span> John Doe
            </div>
            <div>
                <span class="font-semibold">Blood Type:</span> A+
            </div>
            <div>
                <span class="font-semibold">Hospital:</span> City General Hospital
            </div>
            <div>
                <span class="font-semibold">Required Blood Bags:</span> 8
            </div>
            <div>
                <span class="font-semibold">Bags Collected:</span> 5
            </div>
            <div>
                <span class="font-semibold">Status:</span>
                <span class="text-yellow-600 font-semibold">In Progress</span>
            </div>
        </div>
    </section>

    <!-- Donors List Table -->
    <section class="bg-white rounded-2xl shadow p-6">
        <h2 class="text-xl font-semibold mb-4 text-red-600">Donors List</h2>
        <div class="overflow-x-auto">
            <table class="min-w-full text-sm border border-gray-200">
                <thead class="bg-gray-100">
                <tr>
                    <th class="px-4 py-2 text-left border-b">#</th>
                    <th class="px-4 py-2 text-left border-b">Donor Name</th>
                    <th class="px-4 py-2 text-left border-b">Blood Type</th>
                    <th class="px-4 py-2 text-left border-b">Bags Donated</th>
                    <th class="px-4 py-2 text-left border-b">Date</th>
                </tr>
                </thead>
                <tbody>
                <tr class="hover:bg-gray-50">
                    <td class="px-4 py-2 border-b">1</td>
                    <td class="px-4 py-2 border-b">Sarah Johnson</td>
                    <td class="px-4 py-2 border-b">A+</td>
                    <td class="px-4 py-2 border-b">2</td>
                    <td class="px-4 py-2 border-b">2025-10-11</td>
                </tr>
                <tr class="hover:bg-gray-50">
                    <td class="px-4 py-2 border-b">2</td>
                    <td class="px-4 py-2 border-b">Ahmed Ali</td>
                    <td class="px-4 py-2 border-b">A+</td>
                    <td class="px-4 py-2 border-b">1</td>
                    <td class="px-4 py-2 border-b">2025-10-12</td>
                </tr>
                <tr class="hover:bg-gray-50">
                    <td class="px-4 py-2 border-b">3</td>
                    <td class="px-4 py-2 border-b">Lisa White</td>
                    <td class="px-4 py-2 border-b">A+</td>
                    <td class="px-4 py-2 border-b">2</td>
                    <td class="px-4 py-2 border-b">2025-10-13</td>
                </tr>
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
</html>
