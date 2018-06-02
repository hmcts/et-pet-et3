$(document).ready(function(){
	Dropzone.autoDiscover = false;

  uploadAdditionalInfoDropzone = new Dropzone("#upload-additional-file");
  
  Dropzone.options.uploadAdditionalFile = {
    init: function() {
      this.on("addedfile", function(file) { alert("Added file."); });
		},
		// TODO: Use this function to intercept the upload and inject the correct URL
		accept: function(file, done) {
			console.log("accept");
		},
    maxFiles: 1,
    acceptedFiles: ".rtf",
    // FIXME: This URL should be the pre-signed URL from S3.
    url: "/respond/additional_information",
		addRemoveLinks: true,
		success: function(file, response){
			// TODO: Build succeess function
		},
		removedfile: function(file){
			var id = $(file.previewTemplate).find('.dz-remove').attr('id'); 

			$.ajax({
				// TODO: Remove file from S3 bucket
				type: 'DELETE',
				url: 'SOME_URL' + id,
				success: function(data){
					console.log(data.message);
				}
			});
		}
  };	
});