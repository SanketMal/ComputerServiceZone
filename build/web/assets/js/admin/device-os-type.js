/* 
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/JavaScript.js to edit this template
 */
$(document).ready(function(){
  $('#formReset').click(function(){
      $('.deviceOS-id').val("0");
      $('.form-action').val("save");
      $('.deviceOSTypeName').val("");
  });
  $('.dataEdit').on('click', function(){
      var deviceOSId = $(this).data("id");
      var deviceOSType = $(this).data("name");
      $('.deviceOS-id').val(deviceOSId);
      $('.form-action').val("edit");
      $('.deviceOSTypeName').val(deviceOSType);
      
  });
  $('#deleteModal').modal();
  $('.dataDelete').on('click', function(){
      var deviceOSId = $(this).data("deleteid");
      $('.delete-device-os-id').val(deviceOSId);
//      $('.form-action').val("delete");
  });
});

function formValidation() {
    var deviceOSType = document.getElementById("deviceOSTypeName").value;
    var messageForDeviceOSType = document.getElementById("messageForDeviceOSType");
    var isValid = true;

    if (deviceOSType === null || deviceOSType === "") {
        messageForDeviceOSType.innerText = "Please enter device type.";
        isValid = false;
    } else {
        messageForDeviceOSType.innerText = "";
    }

    return isValid;
}

function clearErrorMessage(elementId) {
    document.getElementById(elementId).innerText = "";
}

