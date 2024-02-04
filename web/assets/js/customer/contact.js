/* 
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/JavaScript.js to edit this template
 */


function validateEmail(email) { //Validates the email address
    var emailRegex = /^([a-zA-Z0-9_\.\-])+\@(([a-zA-Z0-9\-])+\.)+([a-zA-Z0-9]{2,4})+$/;
    return emailRegex.test(email);
}

function validatePhone(phone) { //Validates the phone number
  var phoneRegex = /^(\+91-|\+91|0)?\d{10}$/; // Change this regex based on requirement
  return phoneRegex.test(phone);
}
function formValidation() {
     var name = document.getElementById("name").value;
     var phone = document.getElementById("phone").value;
     var email = document.getElementById("email").value;
     var message = document.getElementById("message").value;
     var messageForName=document.getElementById("messageForName");
     var messageForEmail=document.getElementById("messageForEmail");
     var messageForPhone=document.getElementById("messageForPhone");
     var messageForMessage = document.getElementById("messageForMessage");
     console.log("namaddcacacacacacace");
      var isValid = true;
     if (name === null || name=== "") {
          
//         alert("Last name can't be blank.");
       messageForName.innerHTML = "Name can't be blank.";
       isValid= false;
     } else {
        messageForName.innerHTML = "";
     }

    if(!validateEmail(email)) {
//       alert("Invalid email.");
       messageForEmail.innerHTML = "Invalid email";      
       isValid= false;
    }
    else {
        document.getElementById("messageForEmail").innerHTML = "";
    }
     
     if(!validatePhone(phone)) {
//        alert("Invalid Phone number.");
        messageForPhone.innerHTML="Invalid phone Number.";
        isValid= false;
     }
      else {
        document.getElementById("messageForPhone").innerHTML = "";
    }
    if (message === null || message=== "") {
          
//         alert("Last name can't be blank.");
       messageForMessage.innerHTML = "Name can't be blank.";
       isValid= false;
     } else {
        messageForMessage.innerHTML = "";
     }
  return isValid;
}
// for remove the inner html message after giving proper input
function clearErrorMessage(elementId) {
    document.getElementById(elementId).innerHTML = "";
}