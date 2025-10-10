<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="com.example.bbm.dto.DonorDTO" %>
<% DonorDTO donor = (DonorDTO) request.getAttribute("donors");  %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Blood Donor Information</title>
    <script src="https://cdn.tailwindcss.com"></script>
</head>
<body class="bg-gray-50 min-h-screen py-8 px-4">
<div class="max-w-3xl mx-auto">
    <div class="bg-white rounded-lg shadow-md p-6">
        <h1 class="text-3xl font-bold text-gray-900 mb-6">Blood Donor Information</h1>

        <form id="donorForm" class="space-y-4">
            FullName
            <div class="flex items-center justify-between p-4 bg-gray-50 rounded-lg hover:bg-gray-100 transition-colors">
                <div class="flex-1">
                    
                    <label class="block text-sm font-medium text-gray-700 mb-1">Weight (kg)</label>
                    <div id="weight-display" class="text-lg text-gray-900">
                    </div>
                    <input
                            type="text"
                            id="weight-input"
                            step="0.1"
                            value=<%=donor.getFirstName() + donor.getLastName()%>
                                    class="hidden w-full px-3 py-2 border border-gray-300 rounded-md focus:outline-none focus:ring-2 focus:ring-red-500"
                    />
                </div>
            Weight
            <div class="flex items-center justify-between p-4 bg-gray-50 rounded-lg hover:bg-gray-100 transition-colors">
                <div class="flex-1">
                    <label class="block text-sm font-medium text-gray-700 mb-1">Weight (kg)</label>
                    <div id="weight-display" class="text-lg text-gray-900">
                    </div>
                    <input
                            type="number"
                            id="weight-input"
                            step="0.1"
                            value=<%=donor.getWeight()%>
                            class="hidden w-full px-3 py-2 border border-gray-300 rounded-md focus:outline-none focus:ring-2 focus:ring-red-500"
                    />
                </div>
                <button
                        type="button"
                        onclick="toggleEdit('weight')"
                        class="ml-4 px-4 py-2 text-sm font-medium text-white bg-red-600 rounded-md hover:bg-red-700 focus:outline-none focus:ring-2 focus:ring-red-500"
                >
                    Edit
                </button>
            </div>

            Donor Status
            <div class="flex items-center justify-between p-4 bg-gray-50 rounded-lg hover:bg-gray-100 transition-colors">
                <div class="flex-1">
                    <label class="block text-sm font-medium text-gray-700 mb-1">Donor Status</label>
                    <div id="donorStatus-display" class="text-lg text-gray-900">
              <span class="inline-flex items-center px-3 py-1 rounded-full text-sm font-medium bg-yellow-100 text-yellow-800">
                UNAVAILABLE
              </span>
                    </div>
                    <select
                            id="donorStatus-input"
                            class="hidden w-full px-3 py-2 border border-gray-300 rounded-md focus:outline-none focus:ring-2 focus:ring-red-500"
                    >
                        <option value="AVAILABLE">AVAILABLE</option>
                        <option value="UNAVAILABLE" selected>UNAVAILABLE</option>
                        <option value="TEMPORARILY_DEFERRED">TEMPORARILY DEFERRED</option>
                        <option value="PERMANENTLY_DEFERRED">PERMANENTLY DEFERRED</option>
                    </select>
                </div>
                <button
                        type="button"
                        onclick="toggleEdit('donorStatus')"
                        class="ml-4 px-4 py-2 text-sm font-medium text-white bg-red-600 rounded-md hover:bg-red-700 focus:outline-none focus:ring-2 focus:ring-red-500"
                >
                    Edit
                </button>
            </div>

            Last Donation Date
            <div class="flex items-center justify-between p-4 bg-gray-50 rounded-lg hover:bg-gray-100 transition-colors">
                <div class="flex-1">
                    <label class="block text-sm font-medium text-gray-700 mb-1">Last Donation Date</label>
                    <div id="lastDonationDate-display" class="text-lg text-gray-900">2024-03-15 10:30 AM</div>
                    <input
                            type="datetime-local"
                            id="lastDonationDate-input"
                            value="2024-03-15T10:30"
                            class="hidden w-full px-3 py-2 border border-gray-300 rounded-md focus:outline-none focus:ring-2 focus:ring-red-500"
                    />
                </div>
                <button
                        type="button"
                        onclick="toggleEdit('lastDonationDate')"
                        class="ml-4 px-4 py-2 text-sm font-medium text-white bg-red-600 rounded-md hover:bg-red-700 focus:outline-none focus:ring-2 focus:ring-red-500"
                >
                    Edit
                </button>
            </div>

            Is Pregnant
            <div class="flex items-center justify-between p-4 bg-gray-50 rounded-lg hover:bg-gray-100 transition-colors">
                <div class="flex-1">
                    <label class="block text-sm font-medium text-gray-700 mb-1">Is Pregnant</label>
                    <div id="isPregnant-display" class="text-lg text-gray-900">
              <span class="inline-flex items-center px-3 py-1 rounded-full text-sm font-medium bg-gray-100 text-gray-800">
                No
              </span>
                    </div>
                    <select
                            id="isPregnant-input"
                            class="hidden w-full px-3 py-2 border border-gray-300 rounded-md focus:outline-none focus:ring-2 focus:ring-red-500"
                    >
                        <option value="false" selected>No</option>
                        <option value="true">Yes</option>
                    </select>
                </div>
                <button
                        type="button"
                        onclick="toggleEdit('isPregnant')"
                        class="ml-4 px-4 py-2 text-sm font-medium text-white bg-red-600 rounded-md hover:bg-red-700 focus:outline-none focus:ring-2 focus:ring-red-500"
                >
                    Edit
                </button>
            </div>

            Is Breastfeeding
            <div class="flex items-center justify-between p-4 bg-gray-50 rounded-lg hover:bg-gray-100 transition-colors">
                <div class="flex-1">
                    <label class="block text-sm font-medium text-gray-700 mb-1">Is Breastfeeding</label>
                    <div id="isBreastfeeding-display" class="text-lg text-gray-900">
              <span class="inline-flex items-center px-3 py-1 rounded-full text-sm font-medium bg-gray-100 text-gray-800">
                No
              </span>
                    </div>
                    <select
                            id="isBreastfeeding-input"
                            class="hidden w-full px-3 py-2 border border-gray-300 rounded-md focus:outline-none focus:ring-2 focus:ring-red-500"
                    >
                        <option value="false" selected>No</option>
                        <option value="true">Yes</option>
                    </select>
                </div>
                <button
                        type="button"
                        onclick="toggleEdit('isBreastfeeding')"
                        class="ml-4 px-4 py-2 text-sm font-medium text-white bg-red-600 rounded-md hover:bg-red-700 focus:outline-none focus:ring-2 focus:ring-red-500"
                >
                    Edit
                </button>
            </div>

            Medical Notes
            <div class="flex items-start justify-between p-4 bg-gray-50 rounded-lg hover:bg-gray-100 transition-colors">
                <div class="flex-1">
                    <label class="block text-sm font-medium text-gray-700 mb-1">Medical Notes</label>
                    <div id="medicalNotes-display" class="text-lg text-gray-900">No allergies reported. Regular donor.</div>
                    <textarea
                            id="medicalNotes-input"
                            maxlength="500"
                            rows="3"
                            class="hidden w-full px-3 py-2 border border-gray-300 rounded-md focus:outline-none focus:ring-2 focus:ring-red-500"
                    >No allergies reported. Regular donor.</textarea>
                    <div id="medicalNotes-counter" class="hidden text-sm text-gray-500 mt-1">0/500 characters</div>
                </div>
                <button
                        type="button"
                        onclick="toggleEdit('medicalNotes')"
                        class="ml-4 px-4 py-2 text-sm font-medium text-white bg-red-600 rounded-md hover:bg-red-700 focus:outline-none focus:ring-2 focus:ring-red-500"
                >
                    Edit
                </button>
            </div>

            Desize
            <div class="flex items-center justify-between p-4 bg-gray-50 rounded-lg hover:bg-gray-100 transition-colors">
                <div class="flex-1">
                    <label class="block text-sm font-medium text-gray-700 mb-1">Desize</label>
                    <div id="desize-display" class="text-lg text-gray-900">MEDIUM</div>
                    <select
                            id="desize-input"
                            class="hidden w-full px-3 py-2 border border-gray-300 rounded-md focus:outline-none focus:ring-2 focus:ring-red-500"
                    >
                        <option value="SMALL">SMALL</option>
                        <option value="MEDIUM" selected>MEDIUM</option>
                        <option value="LARGE">LARGE</option>
                        <option value="EXTRA_LARGE">EXTRA LARGE</option>
                    </select>
                </div>
                <button
                        type="button"
                        onclick="toggleEdit('desize')"
                        class="ml-4 px-4 py-2 text-sm font-medium text-white bg-red-600 rounded-md hover:bg-red-700 focus:outline-none focus:ring-2 focus:ring-red-500"
                >
                    Edit
                </button>
            </div>

            Submit Button (Hidden by default)
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

    // Store original values
    document.querySelectorAll('input, select, textarea').forEach(input => {
        originalValues[input.id] = input.value;
    });

    function toggleEdit(fieldName) {
        const display = document.getElementById(`${fieldName}-display`);
        const input = document.getElementById(`${fieldName}-input`);
        const button = event.target;

        if (display.classList.contains('hidden')) {
            // Save mode
            const newValue = input.value;

            // Update display based on field type
            if (fieldName === 'donorStatus') {
                const statusColors = {
                    'AVAILABLE': 'bg-green-100 text-green-800',
                    'UNAVAILABLE': 'bg-yellow-100 text-yellow-800',
                    'TEMPORARILY_DEFERRED': 'bg-orange-100 text-orange-800',
                    'PERMANENTLY_DEFERRED': 'bg-red-100 text-red-800'
                };
                display.innerHTML = `<span class="inline-flex items-center px-3 py-1 rounded-full text-sm font-medium ${statusColors[newValue]}">${newValue.replace('_', ' ')}</span>`;
            } else if (fieldName === 'isPregnant' || fieldName === 'isBreastfeeding') {
                const yesNo = newValue === 'true' ? 'Yes' : 'No';
                const colorClass = newValue === 'true' ? 'bg-red-100 text-red-800' : 'bg-gray-100 text-gray-800';
                display.innerHTML = `<span class="inline-flex items-center px-3 py-1 rounded-full text-sm font-medium ${colorClass}">${yesNo}</span>`;
            } else if (fieldName === 'lastDonationDate') {
                const date = new Date(newValue);
                display.textContent = date.toLocaleString('en-US', {
                    year: 'numeric',
                    month: '2-digit',
                    day: '2-digit',
                    hour: '2-digit',
                    minute: '2-digit'
                });
            } else {
                display.textContent = newValue;
            }

            display.classList.remove('hidden');
            input.classList.add('hidden');
            if (fieldName === 'medicalNotes') {
                document.getElementById('medicalNotes-counter').classList.add('hidden');
            }
            button.textContent = 'Edit';

            // Check if value changed
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

    document.getElementById('donorForm').addEventListener('submit', function(e) {
        e.preventDefault();

        // Collect all form data
        const formData = {
            weight: parseFloat(document.getElementById('weight-input').value),
            donorStatus: document.getElementById('donorStatus-input').value,
            lastDonationDate: document.getElementById('lastDonationDate-input').value,
            isPregnant: document.getElementById('isPregnant-input').value === 'true',
            isBreastfeeding: document.getElementById('isBreastfeeding-input').value === 'true',
            medicalNotes: document.getElementById('medicalNotes-input').value,
            desize: document.getElementById('desize-input').value
        };

        console.log('Form submitted with data:', formData);
        alert('Changes saved successfully!');

        // Reset change tracking
        hasChanges = false;
        document.getElementById('submitContainer').classList.add('hidden');

        // Update original values
        document.querySelectorAll('input, select, textarea').forEach(input => {
            originalValues[input.id] = input.value;
        });
    });
</script>
</body>
</html>
