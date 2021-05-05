import swal from "sweetalert2";
import Rails from "@rails/ujs";

Rails.confirm = function (message, element) {

    const swalWithBootstrap = swal.mixin({
        customClass: {
            confirmButton: 'btn btn-primary mx-2',
            cancelButton: 'btn btn-danger mx-2'
        },
        buttonsStyling: false
    })

    swalWithBootstrap.fire({
      html: message,
      showCancelButton: true,
      confirmButtonText: "OK",
      cancelButtonText: "Cancel",
    })
    .then((result) => {
      if (result.value) {
        element.removeAttribute("data-confirm");
        console.log(element);
        element.click();
      }
    });
};
