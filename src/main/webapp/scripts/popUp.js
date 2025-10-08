const openModal = () => console.log("rah t7alitt a zabi"); document.querySelector('#openModalBtn').classList.remove('hidden');
const closeModal = () => document.getElementById('personModal').classList.add('hidden');

const openBtn = document.getElementById('openModalBtn');
const closeBtn = document.getElementById('closeModalBtn');
const personTypeSelect = document.getElementById('personType');
const additionalFieldsDiv = document.getElementById('additionalFields');
const form = document.getElementById('personForm');

// Open/close modal events
openBtn.addEventListener('click', openModal);
closeBtn.addEventListener('click', closeModal);
document.addEventListener('keydown', (e) => e.key === 'Escape' && closeModal());

// Update additional fields based on person type
const updateAdditionalFields = () => {
    const type = personTypeSelect.value;
    if(type === 'donor') {
        additionalFieldsDiv.innerHTML = `
          <div>
            <label class="block text-gray-700">Weight</label>
            <input type="number" name="weight" class="w-full border border-gray-300 rounded px-2 py-1" required>
          </div>
          <div>
            <label class="block text-gray-700">Donor Status</label>
            <select name="donorStatus" class="w-full border border-gray-300 rounded px-2 py-1">
              <option value="AVAILABLE">Available</option>
              <option value="UNAVAILABLE">Unavailable</option>
            </select>
          </div>
        `;
    } else if(type === 'recipient') {
        additionalFieldsDiv.innerHTML = `
          <div>
            <label class="block text-gray-700">Required Blood Bags</label>
            <input type="number" name="requiredBloodBags" class="w-full border border-gray-300 rounded px-2 py-1" required>
          </div>
          <div>
            <label class="block text-gray-700">Hospital</label>
            <input type="text" name="hospital" class="w-full border border-gray-300 rounded px-2 py-1" required>
          </div>
        `;
    }
};

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
    alert('Person created! Check console for data.');
    form.reset();
    updateAdditionalFields();
    closeModal();
});