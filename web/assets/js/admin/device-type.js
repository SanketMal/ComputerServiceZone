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
//document.addEventListener('DOMContentLoaded', function() {
//    var formReset = document.getElementById('formReset');
//    formReset.addEventListener('click', function() {
//        var deviceIds = document.querySelectorAll('.device-id');
//        var formActions = document.querySelectorAll('.form-action');
//        var deviceTypeNames = document.querySelectorAll('.deviceTypeName');
//        
//        deviceIds.forEach(function(deviceId) {
//            deviceId.value = '0';
//        });
//        
//        formActions.forEach(function(formAction) {
//            formAction.value = 'save';
//        });
//        
//        deviceTypeNames.forEach(function(deviceTypeName) {
//            deviceTypeName.value = '';
//        });
//    });
//    
//    var dataEditButtons = document.querySelectorAll('.dataEdit');
//    dataEditButtons.forEach(function(dataEditButton) {
//        dataEditButton.addEventListener('click', function() {
//            var deviceId = dataEditButton.getAttribute('data-id');
//            var deviceName = dataEditButton.getAttribute('data-name');
//            
//            var deviceIds = document.querySelectorAll('.device-id');
//            var formActions = document.querySelectorAll('.form-action');
//            var deviceTypeNames = document.querySelectorAll('.deviceTypeName');
//            
//            deviceIds.forEach(function(deviceIdInput) {
//                deviceIdInput.value = deviceId;
//            });
//            
//            formActions.forEach(function(formAction) {
//                formAction.value = 'edit';
//            });
//            
//            deviceTypeNames.forEach(function(deviceTypeName) {
//                deviceTypeName.value = deviceName;
//            });
//        });
//    });
//    
//    var deleteModal = document.getElementById('deleteModal');
//    deleteModal.modal();
//    
//    var dataDeleteButtons = document.querySelectorAll('.dataDelete');
//    dataDeleteButtons.forEach(function(dataDeleteButton) {
//        dataDeleteButton.addEventListener('click', function() {
//            var deviceId = dataDeleteButton.getAttribute('data-deleteid');
//            var deleteDeviceId = document.querySelector('.delete-device-id');
//            deleteDeviceId.value = deviceId;
//        });
//    });
//});
//

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
