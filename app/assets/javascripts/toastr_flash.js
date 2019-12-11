
$(document).ready(function () {
  flash_toastr();
})

function flash_toastr(){
   toastr.options = {
  "closeButton": false,
  "debug": false,
  "positionClass": "toast-bottom-right",
  "onclick": null,
  "showDuration": "300",
  "hideDuration": "1000",
  "timeOut": "5000",
  "extendedTimeOut": "1000",
  "showEasing": "swing",
  "hideEasing": "linear",
  "showMethod": "fadeIn",
  "hideMethod": "fadeOut"
  }
  
  $flash = $(".flash_msg");
  $i=0;
  for($i = 0; $i < $flash.length; $i++)
  {
    $f = $flash.eq($i);
    if ($f.hasClass("notice") || $f.hasClass("success"))
      toastr.success($f.val());
    else if($f.hasClass("alert") || $f.hasClass("danger"))
      toastr.error($f.val());
  }
}
