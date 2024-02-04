/* 
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/JavaScript.js to edit this template
 */
$(document).ready(function(){
    $('#formReset').click(function() {
        $('.device-id').val("0");
        $('.form-action').val("save");
        $('.deviceTypeName').val("");
    });
    
    $('.dataEdit').on('click', function() {
        var deviceId = $(this).data("id");
        var deviceName = $(this).data("name");
        $('.device-id').val(deviceId);
        $('.form-action').val("edit");
        $('.deviceTypeName').val(deviceName);
    });
    $("#deleteModal").modal();
    
    $('.dataDelete').on('click', function() {
        var deviceId = $(this).data("deleteid");
        $('.delete-device-id').val(deviceId);
    });
    
});

function formValidation() {
    var deviceType = document.getElementById("deviceTypeName").value;
    var messageForDeviceType = document.getElementById("messageForDeviceType");
    var isValid = true;

    if (deviceType === null || deviceType === "") {
        messageForDeviceType.innerText = "Please enter device type.";
        isValid = false;
    } else {
        messageForDeviceType.innerText = "";
    }

    return isValid;
}

function clearErrorMessage(elementId) {
    document.getElementById(elementId).innerText = "";
}
