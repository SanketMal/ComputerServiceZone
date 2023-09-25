/* 
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
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
     var firstName = document.getElementById("firstName").value;
     var lastName = document.getElementById("lastName").value;
     var password = document.getElementById("password").value;
     var cpassword = document.getElementById("cpassword").value;
     var email=document.getElementById("email").value;
     var phone=document.getElementById("phone").value;
     var messageForFirstName=document.getElementById("messageForFirstName");
     var messageForLastName=document.getElementById("messageForLastName");
     var messageForEmail=document.getElementById("messageForEmail");
     var messageForPhone=document.getElementById("messageForPhone");
     var messageForPassword=document.getElementById("messageForPassword");
     var messageForCpassword=document.getElementById("messageForCpassword");
     var isValid = true;
     if (firstName == null || firstName == "") {
//         var str = new String("First name can't be blank........");
//
//         alert(str.fontcolor( "red" ));

//        alert("First name can't be blank.")
        messageForFirstName.innerHTML = "First name can't be blank.";
        isValid= false;
     }
     else{
       messageForFirstName.innerHTML ="";   
     }
     if (lastName == null || lastName== "") {
          
//         alert("Last name can't be blank.");
          messageForLastName.innerHTML = "Last name can't be blank.";
       isValid= false;
     } else {
        messageForLastName.innerHTML = "";
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
     // If password not entered
     if (password === null || password === ""){
//      alert ("Please enter Password");
      messageForPassword.innerHTML="Please enter Password";
      isValid= false;
     }
     // If confirm password not entered
     else if (cpassword ===null || cpassword === ""){
//        alert ("Please enter the same Password again to confirm your password.");
        messageForCpassword.innerHTML="Please enter the same Password again to confirm your password.";
        isValid= false;
     }     
                // If Not same return False.    
     else if (password !== cpassword) {
       messageForCpassword.innerHTML= "Password did not match: Please try again !";
       isValid= false;
    }
  
                // If same return True.
    else{
        alert("Please rember your password for further log in !")
        isValid= true;
    }
    if(password.value.length < 8) {  
     messageForPassword.innerHTML = "Password length must be atleast 8 characters";  
     isValid= false;  
    }  
    return isValid;
}
// for remove the inner html message after giving proper input
function clearErrorMessage(elementId) {
    document.getElementById(elementId).innerHTML = "";
}