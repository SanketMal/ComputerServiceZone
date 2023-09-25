
//function formValidation() {
//    var email=document.getElementById("email").value;
//    var password = document.getElementById("password").value;
//    alert("dyuaduguadguu");
//     if(!validateEmail(email)) {
//           alert("Invalid email.");
//           //messageForEmail.innerHTML = "Invalid email";      
//           return false;
//        }
//        else{
//            return true;
//        }
//        if (password === null || password === ""){
//            alert ("Please enter Password");
//            //messageForPassword.innerHTML="Please enter Password";
//            return false;
//        }
//  }
//
//function validateEmail(email) { //Validates the email address
//    var emailRegex = /^([a-zA-Z0-9_\.\-])+\@(([a-zA-Z0-9\-])+\.)+([a-zA-Z0-9]{2,4})+$/;
//    return emailRegex.test(email);
//}
function validateEmail(email) { //Validates the email address
    var emailRegex = /^([a-zA-Z0-9_\.\-])+\@(([a-zA-Z0-9\-])+\.)+([a-zA-Z0-9]{2,4})+$/;
    return emailRegex.test(email);
}
function formValidation() {
    var email = document.getElementById("email").value;
    var password = document.getElementById("password").value;
    var messageForEmail = document.getElementById("messageForEmail");
    var messageForPassword = document.getElementById("messsageForPassword");
    var isValid= true;
    
     if(!validateEmail(email)) {
//           alert("Invalid email.");
           messageForEmail.innerHTML = "Invalid email";      
           isValid= false;
        }
     else{
            messageForEmail.innerHTML ="";
        }
     if (password === null || password === ""){
            //alert ("Please enter Password");
            messageForPassword.innerHTML="Please enter your Password";
            isValid= false;
     }
     else{
         messageForPassword.innerHTML ="";
   
     }
     return isValid;
 }

 function clearErrorMessage(elementId) {
    document.getElementById(elementId).innerHTML = "";
}



