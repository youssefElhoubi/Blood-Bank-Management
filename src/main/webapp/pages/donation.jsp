<%--
  Created by IntelliJ IDEA.
  User: elhou
  Date: 10/13/2025
  Time: 4:02 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Recipients List</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <title>Title</title>
</head>
<body class="bg-gray-50 text-gray-800">

<!-- Header -->
<header class="bg-red-600 text-white py-4 shadow-md">
    <div class="max-w-6xl mx-auto px-4 flex justify-between items-center">
        <h1 class="text-2xl font-bold">Recipients Management</h1>
        <a href="#" class="bg-white text-red-600 px-4 py-2 rounded-lg font-semibold hover:bg-gray-100">
            Home
        </a>
    </div>
</header>

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
                <tr class="hover:bg-gray-50">
                    <td class="px-4 py-2 border-b">1</td>
                    <td class="px-4 py-2 border-b">John Doe</td>
                    <td class="px-4 py-2 border-b">A+</td>
                    <td class="px-4 py-2 border-b">City General</td>
                    <td class="px-4 py-2 border-b">8</td>
                    <td class="px-4 py-2 border-b">5</td>
                    <td class="px-4 py-2 border-b text-yellow-600 font-semibold">In Progress</td>
                    <td class="px-4 py-2 border-b text-center">
                        <a href="donation.html" class="bg-red-600 text-white px-3 py-1 rounded-lg hover:bg-red-700">
                            View Details
                        </a>
                    </td>
                </tr>
                <tr class="hover:bg-gray-50">
                    <td class="px-4 py-2 border-b">2</td>
                    <td class="px-4 py-2 border-b">Fatima Zahra</td>
                    <td class="px-4 py-2 border-b">O-</td>
                    <td class="px-4 py-2 border-b">Al Amal Hospital</td>
                    <td class="px-4 py-2 border-b">6</td>
                    <td class="px-4 py-2 border-b">2</td>
                    <td class="px-4 py-2 border-b text-yellow-600 font-semibold">In Progress</td>
                    <td class="px-4 py-2 border-b text-center">
                        <a href="donation.html" class="bg-red-600 text-white px-3 py-1 rounded-lg hover:bg-red-700">
                            View Details
                        </a>
                    </td>
                </tr>
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
                <tr>
                    <th class="px-4 py-2 text-left border-b">#</th>
                    <th class="px-4 py-2 text-left border-b">Recipient Name</th>
                    <th class="px-4 py-2 text-left border-b">Blood Type</th>
                    <th class="px-4 py-2 text-left border-b">Hospital</th>
                    <th class="px-4 py-2 text-left border-b">Required Bags</th>
                    <th class="px-4 py-2 text-left border-b">Collected</th>
                    <th class="px-4 py-2 text-left border-b">Status</th>
                </tr>
                </thead>
                <tbody>
                <tr class="hover:bg-gray-50">
                    <td class="px-4 py-2 border-b">1</td>
                    <td class="px-4 py-2 border-b">Ali Hassan</td>
                    <td class="px-4 py-2 border-b">B+</td>
                    <td class="px-4 py-2 border-b">Ibn Sina Hospital</td>
                    <td class="px-4 py-2 border-b">4</td>
                    <td class="px-4 py-2 border-b">4</td>
                    <td class="px-4 py-2 border-b text-green-600 font-semibold">Satisfied</td>
                </tr>
                <tr class="hover:bg-gray-50">
                    <td class="px-4 py-2 border-b">2</td>
                    <td class="px-4 py-2 border-b">Maria Lopez</td>
                    <td class="px-4 py-2 border-b">AB-</td>
                    <td class="px-4 py-2 border-b">Central Hospital</td>
                    <td class="px-4 py-2 border-b">5</td>
                    <td class="px-4 py-2 border-b">5</td>
                    <td class="px-4 py-2 border-b text-green-600 font-semibold">Satisfied</td>
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
<body>

</body>
</html>
