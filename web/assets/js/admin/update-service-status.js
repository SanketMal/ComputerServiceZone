///* 
// * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
// * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/JavaScript.js to edit this template
// */
//<script>
    $(document).ready(function () {//
//        $(".editServiceStatus").click(function () {
//            var orderId = $(this).data("id");
//            var currentStatus = $(this).data("status");
//            var newStatus = "Got"; // Change this to the desired new status
//            
//            if (confirm("Are you sure you want to change the status from '" + currentStatus + "' to '" + newStatus + "'?")) {
//                // Send an AJAX request to update the status in the database
//                $.ajax({
//                    url: "UpdateServiceStatus.java", // Replace with the actual URL to your update servlet or JSP
//                    type: "POST",
//                    data: { orderId: orderId, newStatus: newStatus },
//                    success: function () {
//                        // Update the status on the page without reloading
//                        // For example, you can update the status cell in the table
//                        // You may need to add code here to refresh the table or row
//                    },
//                    error: function () {
//                        alert("Error updating the service status.");
//                    }
//                });
//            }
//        });
//    });

//
//

$(document).ready(function () {
    // Handle the change event of the service status dropdown
    $(".service-status-select").change(function () {
        var orderId = $(this).data("order-id");
        var currentStatus = $(this).data("current-status");
        var newStatus = $(this).val();

        if (confirm("Are you sure you want to change the status from '" + currentStatus + "' to '" + newStatus + "'?")) {
            // Send an AJAX request to update the status in the database
            $.ajax({
                url: "UpdateServiceStatus.java", // Replace with the actual URL to your update servlet or JSP
                type: "POST",
                data: { orderId: orderId, newStatus: newStatus },
                success: function () {
                    // Update the status in the dropdown's data attribute
                    $(this).data("current-status", newStatus);
                },
                error: function () {
                    alert("Error updating the service status.");
                }
            });
        } else {
            // Revert the dropdown selection if the user cancels the update
            $(this).val(currentStatus);
        }
    });
});
