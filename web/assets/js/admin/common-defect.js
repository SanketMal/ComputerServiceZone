/* 
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/JavaScript.js to edit this template
 */
$(document).ready(function(){
    $('#formReset').click(function(){
        $('.defect-id').val("0");
        $('.form-action').val("save");
        $('.defectName').val("");
    });
    $('.dataEdit').on('click',function(){
        var defectId = $(this).data("id");
        var defectName = $(this).data("name");
        var deviceName = $(this).data("device-name");
        var subDeviceName = $(this).data("subdevice-name");
        var deviceOSName = $(this).data("device-os-name");
        var minAmount =$(this).data("min-amount");
        var maxAmount =$(this).data("max-amount");
        
//        $('defect-id').val(defectId);
        $('input.defect-id').val(defectId);
        $('.form-action').val("edit");
        $('.defectName').val(defectName);
        $('#deviceTypeName').val(deviceName);
        $('#subDeviceTypeName').val(subDeviceName);
        $('#deviceOSTypeName').val(deviceOSName);
        $('#minAmount').val(minAmount);
        $('#maxAmount').val(maxAmount);
    });
    $("#deleteModal").modal();
    
    $('.dataDelete').on('click', function() {
        var defectId = $(this).data("deleteid");
        $('.delete-defect-id').val(defectId);
        
    });
    
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
    var minAmount = document.getElementById("minAmount").value;
    var messageForMinAmount = document.getElementById("messageForMinAmount");
    var maxAmount = document.getElementById("maxAmount").value;
    var messageForMaxAmount = document.getElementById("messageForMaxAmount");
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
    if (defectName === null || defectName === ""){
            
            messageForDefectName.innerHTML="Please enter defect details ";
            isValid= false;
     }
    if (minAmount=== null || minAmount === ""){
            
           messageForMinAmount.innerHTML="Please enter expected min amount ";
            isValid= false;
     }
     if (maxAmount === null || maxAmount === ""){
            
            messageForMaxAmount.innerHTML="Please enter expected max amount ";
            isValid= false;
     }
     return isValid;
}

function clearErrorMessage(elementId) {
    document.getElementById(elementId).innerHTML = "";
}


