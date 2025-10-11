<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="java.util.*, com.example.bbm.dto.DonorDTO" %>
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
<header class="w-full bg-red-600 text-white py-5 shadow-lg">
    <div class="max-w-6xl mx-auto flex justify-between items-center px-4">
        <h1 class="text-3xl font-bold tracking-wide">❤️ Blood Donation Center</h1>
        <nav class="space-x-4">
            <a href="index.jsp" class="hover:underline">Home</a>
            <a href="registerDonor.jsp" class="hover:underline">Register</a>
            <a href="donors" class="font-semibold underline">View Donors</a>
        </nav>
    </div>
</header>

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
            List<DonorDTO> donors = (List<DonorDTO>) request.getAttribute("donors");
            if (donors != null && !donors.isEmpty()) {
                for (DonorDTO d : donors) {
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
                        <span class="<%= d.getDonorStatus().toString().equals("AVAILABLE") ? "bg-green-100 text-green-700" : "bg-gray-100 text-gray-600" %> px-3 py-1 rounded-full text-xs font-semibold">
                            <%= d.getDonorStatus() %>
                        </span>
            </td>
            <td class="px-6 py-3 font-semibold text-red-700">
                <a href="BBM/donorDetails?id=<%= d.getId() %>" class="hover:underline">View</a>
            </td>
        </tr>
        <%
            }
        } else {
        %>
        <tr>
            <td colspan="6" class="text-center py-6 text-gray-500 italic">No donors found.</td>
        </tr>
        <% } %>
        </tbody>
    </table>
</div>

<%--add person model--%>
<button id="openModalBtn" class="bg-blue-600 text-white px-4 py-2 rounded hover:bg-blue-700">
    Create Person
</button>
<%--model--%>
<div id="personModal" class="fixed inset-0 bg-black bg-opacity-50 flex items-center justify-center hidden ">
    <div class="bg-white rounded-lg shadow-lg w-96 p-6 relative overflow-y-scroll max-h-[85vh]">
        <button id="closeModalBtn" class="absolute top-2 right-2 text-gray-500 hover:text-gray-800">&times;</button>
        <h2 class="text-2xl font-semibold mb-4">Create Person</h2>

        <form id="personForm" class="space-y-4 " action="/BBM/person" method="post">
            <!-- Name -->
            <div>
                <label class="block text-gray-700">First Name</label>
                <input type="text" name="firstName" class="w-full border border-gray-300 rounded px-2 py-1" required>
            </div>
            <div>
                <label class="block text-gray-700">Last Name</label>
                <input type="text" name="lastName" class="w-full border border-gray-300 rounded px-2 py-1" required>
            </div>

            <!-- Email -->
            <div>
                <label class="block text-gray-700">Email</label>
                <input type="email" name="email" class="w-full border border-gray-300 rounded px-2 py-1" required>
            </div>

            <!-- Phone -->
            <div>
                <label class="block text-gray-700">Phone</label>
                <input type="text" name="phone" class="w-full border border-gray-300 rounded px-2 py-1" required>
            </div>
            <%--Gender --%>
            <div>
                <label class="block text-gray-700">Gender</label>
                <select id="gender" class="w-full border border-gray-300 rounded px-2 py-1" name="gender">
                    <option value="MALE" selected>MALE</option>
                    <option value="FEMALE">FEMALE</option>
                </select>
            </div>
            <%--Blood Type --%>
                <label class="block text-gray-700">Blood type</label>
            <select id="Gender" class="w-full border border-gray-300 rounded px-2 py-1" name="bloodType">
            <c:forEach var="bloodType" items="${bloodTypes}">
                <option value="${bloodType}">${bloodType}</option>
            </c:forEach>
            </select>
<%--            desize--%>
            <label class="block text-gray-700">Desize</label>
            <select id="Gender" class="w-full border border-gray-300 rounded px-2 py-1" name="desize" required>
                <c:forEach var="desize" items="${desize}" >
                    <option value="${desize}">${desize}</option>
                </c:forEach>
                <option value="NONE" selected hidden="hidden">other</option>
            </select>

            <%--date of birth --%>
            <label class="block text-gray-700">date of birth</label>
            <input type="date" class="border border-gray-300 p-2 rounded-md focus:outline-none focus:ring-2 focus:ring-blue-500" name="dateOfBirth" required>

            <!-- Person Type Dropdown -->
            <div>
                <label class="block text-gray-700">Person Type</label>
                <select id="personType" class="w-full border border-gray-300 rounded px-2 py-1" name="personType" >
                    <option value="donor" selected >Donor</option>
                    <option value="recipient">Recipient</option>
                </select>
            </div>

            <!-- Additional Fields Placeholder -->
            <div id="additionalFields"></div>

            <!-- Submit Button -->
            <div class="text-right">
                <button type="submit" class="bg-green-600 text-white px-4 py-2 rounded hover:bg-green-700">Create
                </button>
            </div>
        </form>
    </div>
</div>

<!-- Footer -->
<footer class="mt-10 text-center text-gray-600 text-sm">
    <p>© <%= java.time.Year.now() %> Blood Donation Center — Give Blood, Save Lives ❤️</p>
</footer>

<script>
    const openModal = () => document.querySelector('#personModal').classList.remove('hidden');
    const closeModal = () => document.getElementById('personModal').classList.add('hidden');

    const openBtn = document.getElementById('openModalBtn');
    const closeBtn = document.getElementById('closeModalBtn');
    const personTypeSelect = document.getElementById('personType');
    const additionalFieldsDiv = document.getElementById('additionalFields');
    const form = document.getElementById('personForm');
    const gender = document.querySelector('#Gender');


    // Open/close modal events
    openBtn.addEventListener('click', openModal);
    closeBtn.addEventListener('click', closeModal);
    document.addEventListener('keydown', (e) => e.key === 'Escape' && closeModal());

    // Update additional fields based on person type
    const updateAdditionalFields = () => {
        const type = personTypeSelect.value;

        if (type === 'donor') {
            additionalFieldsDiv.innerHTML = `
          <div>
            <label class="block text-gray-700">Weight</label>
            <input type="number" name="weight" class="w-full border border-gray-300 rounded px-2 py-1" required>
          </div>
          <div>
            <label class="block text-gray-700">Donor Status</label>
            <select name="donorStatus" class="w-full border border-gray-300 rounded px-2 py-1">
              <option value="AVAILABLE" selected>Available</option>
              <option value="UNAVAILABLE">Unavailable</option>
            </select>
          </div>
           <div id="woman"></div>

        </div>
        `;
        } else if (type === 'recipient') {
            additionalFieldsDiv.innerHTML = `
          <div>
            <label class="block text-gray-700">Required Blood Bags</label>
            <input type="number" name="requiredBloodBags" class="w-full border border-gray-300 rounded px-2 py-1" required>
          </div>
          <div>
            <label class="block text-gray-700">Hospital</label>
            <input type="text" name="hospital" class="w-full border border-gray-300 rounded px-2 py-1" required>
          </div>
            <div id="woman"></div>

        `;
        }
    };

    // gender options
    gender.addEventListener('change', (e) => {
        const woman  = document.querySelector("#woman");
        if (gender.value === 'FEMALE') {

            woman.innerHTML = `<div>
        <label class="block text-gray-700">Is this person pregnant?</label>
    <div class="flex items-center gap-4 mt-1">
        <label class="flex items-center gap-2">
                <span>Yes</span>
            <input type="radio" name="preg" value="yes" class="accent-blue-500" >
        </label>
        <label class="flex items-center gap-2">
            <input type="radio" name="preg" value="no" class="accent-blue-500" checked>
                <span>No</span>
        </label>
    </div><label class="block text-gray-700">Is this person breast feeding ?</label>
    <div class="flex items-center gap-4 mt-1">
        <label class="flex items-center gap-2">
                <span>Yes</span>
            <input type="radio" name="brestFeeding" value="yes" class="accent-blue-500" >
        </label>
        <label class="flex items-center gap-2">
            <input type="radio" name="brestFeeding" value="no" class="accent-blue-500" checked>
                <span>No</span>
        </label>
    </div>
    </div>`;
        } else {
            woman.innerHTML = '';
        }
    })

    // Initial load
    updateAdditionalFields();

    // Change event for dropdown
    personTypeSelect.addEventListener('change', updateAdditionalFields);

    // Form submission
    form.addEventListener('submit', e => {
        e.preventDefault();
        const formData = new FormData(form);
        const data = Object.fromEntries(formData.entries());
        console.log('Person Created:', data);
        form.submit();
        updateAdditionalFields();
        closeModal();
    });
</script>


</body>
</html>
