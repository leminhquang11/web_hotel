$(document).ready(function() {
  // Multiple images preview in browser
  var imagesPreview = function(input, placeToInsertImagePreview) {
    if (input.files) {
      var filesAmount = input.files.length;
      for (i = 0; i < filesAmount; i++) {
        var reader = new FileReader();
        reader.onload = function(event) {
          $($.parseHTML("<img>")).attr({
            src: event.target.result,
            height: 100
          }).appendTo(placeToInsertImagePreview);
        }
        reader.readAsDataURL(input.files[i]);
      }
    }
  };
 
  $("#file-field").on("change", ".hotel-image", function() {
    imagesPreview(this, $(this).parents(".nested-fields").find(".preview-image"));
  });
});
