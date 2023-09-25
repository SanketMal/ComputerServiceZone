/* 
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/JavaScript.js to edit this template
 */
    const confirmationForm = document.getElementById('confirmationForm');
    const thanksMessage = document.getElementById('thanksMessage');
    const confirmationYes = document.getElementById('confirmationYes');

    confirmationForm.addEventListener('submit', function (event) {
        event.preventDefault();

        // Check if the "Yes" radio button is selected
        if (confirmationYes.checked) {
            // Show the "Thanks" message
            thanksMessage.style.display = 'block';
        }

        // Submit the form (you can modify this part if needed)
        confirmationForm.submit();
    });
