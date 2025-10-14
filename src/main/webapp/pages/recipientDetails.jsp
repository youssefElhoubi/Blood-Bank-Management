<%@ page import="com.example.bbm.dto.RecipientDTO" %>
<%@ page import="com.example.bbm.enums.RecipientState" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.Arrays" %>
<%@ page import="com.example.bbm.enums.BloodType" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<% RecipientDTO recipient = (RecipientDTO) request.getAttribute("recipient"); %>
<% List<RecipientState> States = Arrays.asList(RecipientState.values()); %>
<% List<BloodType> BloodTypes = Arrays.asList(BloodType.values()); %>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Blood Recipient Information</title>
    <script src="https://cdn.tailwindcss.com"></script>
</head>
<body>
<%@include file="../components/nav.jsp" %>
<div class="max-w-3xl mx-auto">
    <div class="bg-white rounded-lg shadow-md p-6">
        <h1 class="text-3xl font-bold text-gray-900 mb-6">Blood Donor Information</h1>

        <form id="donorForm" class="space-y-4" method="post" action="/BBM/donor">
            <input hidden="hidden" name="id" value="<%=request.getParameter("id")%>">
            <!-- Full name -->
            <div class="flex items-center flex-col items-stretch justify-between p-4 bg-gray-50 rounded-lg hover:bg-gray-100 transition-colors">
                <div class="flex-1">
                    <label class="block text-sm font-medium text-gray-700 mb-1">Full Name</label>
                    <div id="fullName-display" class="text-lg text-gray-900">
                        <%= recipient.getFirstName() + " " + recipient.getLastName() %>
                    </div>
                    <input
                            type="text"
                            id="fullName-input"
                            value="<%= recipient.getFirstName() + ' ' + recipient.getLastName() %>"
                            class="hidden w-full px-3 py-2 border border-gray-300 rounded-md focus:outline-none focus:ring-2 focus:ring-red-500"
                    />
                </div>
            </div>

            <!-- State -->
            <div class="flex items-center justify-between p-4 bg-gray-50 rounded-lg hover:bg-gray-100 transition-colors">
                <div class="flex-1">
                    <label class="block text-sm font-medium text-gray-700 mb-1">Recipient Status</label>
                    <div id="state-display" class="text-lg text-gray-900">
                        <%= recipient.getState().toString() %>
                    </div>

                    <select
                            name="State"
                            id="state-input"
                            class="hidden w-full px-3 py-2 border border-gray-300 rounded-md focus:outline-none focus:ring-2 focus:ring-red-500"
                    >
                        <c:forEach var="State" items="<%=States%>">
                            <option value="${State}" >${State}</option>
                        </c:forEach>
                    </select>
                </div>
                <button
                        type="button"
                        onclick="toggleEdit('state', event)"
                        class="ml-4 px-4 py-2 text-sm font-medium text-white bg-red-600 rounded-md hover:bg-red-700 focus:outline-none focus:ring-2 focus:ring-red-500"
                >
                    Edit
                </button>
            </div>

            <!-- Donor Status -->
            <div class="flex items-center justify-between p-4 bg-gray-50 rounded-lg hover:bg-gray-100 transition-colors">
                <div class="flex-1">
                    <label class="block text-sm font-medium text-gray-700 mb-1">Blood Type</label>
                    <div id="BloodType-display" class="text-lg text-gray-900">
                        <span class="inline-flex items-center px-3 py-1 rounded-full text-sm font-medium bg-yellow-100 text-yellow-800">
                            <%= recipient.getBloodType().toString()  %>
                        </span>
                    </div>
                    <select
                            name="bloodType"
                            id="BloodType-input"
                            class="hidden w-full px-3 py-2 border border-gray-300 rounded-md focus:outline-none focus:ring-2 focus:ring-red-500"
                    >
                        <c:forEach var="bloodType" items="<%=BloodTypes%>">
                            <option value="${bloodType}" >${bloodType}</option>
                        </c:forEach>
                    </select>
                </div>
                <button
                        type="button"
                        onclick="toggleEdit('BloodType', event)"
                        class="ml-4 px-4 py-2 text-sm font-medium text-white bg-red-600 rounded-md hover:bg-red-700 focus:outline-none focus:ring-2 focus:ring-red-500"
                >
                    Edit
                </button>
            </div>
            <div class="flex items-center justify-between p-4 bg-gray-50 rounded-lg hover:bg-gray-100 transition-colors">
                <div class="flex-1">
                    <label class="block text-sm font-medium text-gray-700 mb-1">required blood bags</label>
                    <div id="BloodBags-display" class="text-lg text-gray-900">
                        <span class="inline-flex items-center px-3 py-1 rounded-full text-sm font-medium bg-yellow-100 text-yellow-800">
                            <%= recipient.getRequiredBloodBags()%>
                        </span>
                    </div>
                    <input
                            type="number"
                            id="BloodBags-input"
                            name="BloodBags"
                            value="<%= recipient.getRequiredBloodBags()%>"
                            class="hidden w-full px-3 py-2 border border-gray-300 rounded-md focus:outline-none focus:ring-2 focus:ring-red-500"
                    />
                </div>
                <button
                        type="button"
                        onclick="toggleEdit('BloodBags', event)"
                        class="ml-4 px-4 py-2 text-sm font-medium text-white bg-red-600 rounded-md hover:bg-red-700 focus:outline-none focus:ring-2 focus:ring-red-500"
                >
                    Edit
                </button>
            </div>

            <!-- Last Donation Date -->
            <div class="flex items-center justify-between p-4 bg-gray-50 rounded-lg hover:bg-gray-100 transition-colors">
                <div class="flex-1">
                    <label class="block text-sm font-medium text-gray-700 mb-1">Last Donation Date</label>
                    <div id="SatisfiedDate-display" class="text-lg text-gray-900">
                        <%= recipient.getSatisfiedDate() != null ? recipient.getSatisfiedDate() : "No donation yet" %>
                    </div>
                    <input
                            type="date"
                            id="SatisfiedDate-input"
                            name="SatisfiedDate"
                            value="<%= recipient.getSatisfiedDate() != null ? recipient.getSatisfiedDate() : "" %>"
                            class="hidden w-full px-3 py-2 border border-gray-300 rounded-md focus:outline-none focus:ring-2 focus:ring-red-500"
                    />
                </div>
                <button
                        type="button"
                        onclick="toggleEdit('SatisfiedDate', event)"
                        class="ml-4 px-4 py-2 text-sm font-medium text-white bg-red-600 rounded-md hover:bg-red-700 focus:outline-none focus:ring-2 focus:ring-red-500"
                >
                    Edit
                </button>
            </div>

            <!-- Medical Notes -->
            <div class="flex items-start justify-between p-4 bg-gray-50 rounded-lg hover:bg-gray-100 transition-colors">
                <div class="flex-1">
                    <label class="block text-sm font-medium text-gray-700 mb-1">Medical Notes</label>
                    <div id="MedicalCase-display" class="text-lg text-gray-900">
                        <%= recipient.getMedicalCondition() != null ? recipient.getMedicalCondition() : "There are no medical notes yet" %>
                    </div>
                    <textarea
                            id="MedicalCase-input"
                            maxlength="500"
                            rows="3"
                            class="hidden w-full px-3 py-2 border border-gray-300 rounded-md focus:outline-none focus:ring-2 focus:ring-red-500"
                    ><%= recipient.getMedicalCondition() != null ? recipient.getMedicalCondition() : "" %></textarea>
                    <div id="MedicalCase-counter" class="hidden text-sm text-gray-500 mt-1">0/500 characters</div>
                </div>
                <button
                        type="button"
                        onclick="toggleEdit('MedicalCase', event)"
                        class="ml-4 px-4 py-2 text-sm font-medium text-white bg-red-600 rounded-md hover:bg-red-700 focus:outline-none focus:ring-2 focus:ring-red-500"
                >
                    Edit
                </button>
            </div>

            <!-- Submit Button -->
            <div id="submitContainer" class="hidden pt-6 border-t border-gray-200">
                <button
                        type="submit"
                        class="w-full px-6 py-3 text-base font-medium text-white bg-green-600 rounded-md hover:bg-green-700 focus:outline-none focus:ring-2 focus:ring-green-500 focus:ring-offset-2 transition-colors"
                >
                    Save Changes
                </button>
            </div>
        </form>
    </div>
</div>
<script>
    let hasChanges = false;
    const originalValues = {};

    document.querySelectorAll('input, select, textarea').forEach(input => {
        originalValues[input.id] = input.value;
    });

    function toggleEdit(fieldName, event) {
        event.preventDefault(); // prevent accidental form submission
        const display = document.getElementById(fieldName + "-display");
        const input = document.getElementById(fieldName + "-input");
        const button = event.target;

        if (display.classList.contains('hidden')) {
            // Save mode
            const newValue = input.value;

            if (fieldName === 'isPregnant' || fieldName === 'isBreastfeeding') {
                const yesNo = newValue === 'true' ? 'Yes' : 'No';
                const colorClass = newValue === 'true' ? 'bg-red-100 text-red-800' : 'bg-gray-100 text-gray-800';
                display.innerHTML = `<span class="inline-flex items-center px-3 py-1 rounded-full text-sm font-medium ${colorClass}">${yesNo}</span>`;
            } else if (fieldName === 'lastDonationDate') {
                display.textContent = newValue ? new Date(newValue).toLocaleDateString() : "No donation yet";
            } else {
                display.textContent = newValue;
            }

            display.classList.remove('hidden');
            input.classList.add('hidden');
            if (fieldName === 'medicalNotes') {
                document.getElementById('medicalNotes-counter').classList.add('hidden');
            }
            button.textContent = 'Edit';

            if (originalValues[input.id] !== newValue) {
                hasChanges = true;
                document.getElementById('submitContainer').classList.remove('hidden');
            }
        } else {
            // Edit mode
            display.classList.add('hidden');
            input.classList.remove('hidden');
            if (fieldName === 'medicalNotes') {
                const counter = document.getElementById('medicalNotes-counter');
                counter.classList.remove('hidden');
                updateCharCounter();
            }
            button.textContent = 'Save';
            input.focus();
        }
    }

    function updateCharCounter() {
        const textarea = document.getElementById('medicalNotes-input');
        const counter = document.getElementById('medicalNotes-counter');
        counter.textContent = `${textarea.value.length}/500 characters`;
    }

    document.getElementById('medicalNotes-input').addEventListener('input', updateCharCounter);
</script>
</body>
</html>
