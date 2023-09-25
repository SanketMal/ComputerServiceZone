/* 
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/JavaScript.js to edit this template
 */
$(document).ready(function(){
  $('#formReset').click(function(){
      $('.subDevice-id').val("0");
      $('.form-action').val("save");
      $('.subDeviceTypeName').val("");
  });
  $('.dataEdit').on('click', function(){
      var subDeviceId = $(this).data("id");
      var subDeviceType = $(this).data("name");
      $('.subDevice-id').val(subDeviceId);
      $('.form-action').val("edit");
      $('.subDeviceTypeName').val(subDeviceType);
      
  });
//  $('#deleteModal').modal();
  
  $('.dataDelete').on('click', function(){
      var subDeviceId = $(this).data("deleteid");
      $('.delete-sub-device-id').val(subDeviceId);
//      $('.form-action').val("delete");
  });
});

function formValidation() {
    var subDeviceType = document.getElementById("subDeviceTypeName").value;
    var messageForSubDeviceType = document.getElementById("messageForSubDeviceType");
    var isValid = true;

    if (subDeviceType === null || subDeviceType === "") {
        messageForSubDeviceType.innerText = "Please enter device type.";
        isValid = false;
    } else {
        messageForSubDeviceType.innerText = "";
    }

    return isValid;
}

function clearErrorMessage(elementId) {
    document.getElementById(elementId).innerText = "";
}

