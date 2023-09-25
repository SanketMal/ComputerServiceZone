/* 
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/JavaScript.js to edit this template
 */
document.getElementById("customerIssue").addEventListener("submit", function() {
        // Get the current date and format it as yyyy-mm-dd (or yyyy-mm-dd HH:MM:SS for TIMESTAMP)
        var currentDate = new Date().toISOString().slice(0, 10); // Change the format if needed
       
        // Set the current date in the hidden input field
        document.getElementById("submissionDate").value = currentDate;
        console.log(document.getElementById("submissionDate").value);
        
    });
    
   
function formValidation(){
    var defectName = document.getElementById("defectName").value;
    var messageForDefectName = document.getElementById("messageForDefectName");
   
    var deviceTypeName = document.getElementById("deviceTypeName").value;
    var messageForDeviceType = document.getElementById("messageForDeviceType");
    var subDeviceTypeName = document.getElementById("subDeviceTypeName").value;
    var messageForSubDeviceType = document.getElementById("messageForSubDeviceType");
    var deviceOSTypeName = document.getElementById("deviceOSTypeName").value;
    var messageForDeviceOSType = document.getElementById("messageForDeviceOSType");
//    var defectDetails = document.getElementById("defectDetails").value;
    var defectDetails = document.getElementById("defectDetails").value.trim();
    var messageForDefectDetails = document.getElementById("messageForDefectDetails");
    var address = document.getElementById("address").value;
    var messageForAddress = document.getElementById("messageForAddress");
     var isValid= true;
    if (deviceTypeName === "") {
        messageForDeviceType.textContent = "Please select device type";
        isValid= false; // Prevent form submission
    }
    if (subDeviceTypeName === "") {
        messageForSubDeviceType.textContent = "Please select sub device type";
        isValid= false; // Prevent form submission
    }
    if (deviceOSTypeName === "") {
        messageForDeviceOSType.textContent = "Please select device OS type";
        isValid= false; // Prevent form submission
    }
    if (defectName === ""||defectName===null){
            
            messageForDefectName.innerHTML="Please select defect part ";
            isValid= false;
     }
//    if(defectDetails=== null || defectDetails === ""){
//        messageForDefectDetails.innerHTML="Please enter defect details ";
//        isValid=false;
//    }
    

        if (defectDetails === "") {
            // Display an error message
            document.getElementById("messageForDefectDetails").textContent = "Please provide a brief description of the defect.";
            return false; // Prevent form submission
        }
    if(address=== null || address === ""){
        document.getElementById("messageForAddress").textContent="Please enter the address ";
        isValid=false;
    }
     return isValid;
}

function clearErrorMessage(elementId) {
    document.getElementById(elementId).innerHTML = "";
}
jQuery(document).ready(function($) {
    $('#deviceOSTypeName').on('change', function() {
        if (this.value !== "") {
            var deviceTypeIdVal = $('#deviceTypeName').val();
            var subDeviceId = $('#subDeviceTypeName').val();
            var deviceOSTypeNameId = this.value;
            
            $.ajax({
                type: 'GET',
                url: 'CustomerIssue',
                dataType: 'JSON',
                data: {
                    deviceTypeId: deviceTypeIdVal,
                    subDeviceId: subDeviceId,
                    deviceOSTypeNameId: deviceOSTypeNameId
                },
                success : function(response) {
                    console.log(response);
                    if (response.length > 0) {
                        for (var i = 0; i < response.length; i++) {
                            var defectId = response[i]['defectId'];
                            var defectName = response[i]['defectName'];
                            $('#defectName').append($('<option>').val(defectId).text(defectName));
                        }
                    }
                    
                }
            });
        }
    });
});

