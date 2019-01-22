$(document).ready(function(){
    Dropzone.autoDiscover = false;

    if ($("#upload-additional-file").length) {
        // Source:
        // stackoverflow.com/questions/105034/create-guid-uuid-in-javascript#answer-2117523
        function uuidv4() {
            return ([1e7] + -1e3 + -4e3 + -8e3 + -1e11).replace(/[018]/g, (c) =>
                (c ^ crypto.getRandomValues(new Uint8Array(1))[0] & 15 >> c / 4).toString(16)
            )
        }

        function setUploadUrl(url) {
            uploadAdditionalInfoDropzone.options.url = url;
        }

        function prepareAwsHiddenInputs(responseData) {
            $("#aws_key").attr("name", "key").val(responseData.fields["key"]);
            $("#aws_policy").attr("name", "policy").val(responseData.fields["policy"]);
            $("#aws_x-amz-algorithm").attr("name", "x-amz-algorithm").val(responseData.fields["x-amz-algorithm"]);
            $("#aws_x-amz-credential").attr("name", "x-amz-credential").val(responseData.fields["x-amz-credential"]);
            $("#aws_x-amz-date").attr("name", "x-amz-date").val(responseData.fields["x-amz-date"]);
            $("#aws_x-amz-signature").attr("name", "x-amz-signature").val(responseData.fields["x-amz-signature"]);
            $("#aws_success_action_status").attr("name", "success_action_status").val(responseData.fields["success_action_status"]);
        }

        function getPresignedS3Url(cb) {
            $.ajax({
                url: "/api/s3/create_signed_url",
                dataType: "json",
                data: {
                    uuid: uuidv4(),
                    command: "CreateSignedS3FormData",
                    async: false,
                    data: {
                        preventEmptyData: true
                    }
                },
                error: onGetPresignedError,
                method: "post",
                success: function (data, status, xhr) {
                    cb.apply(this, [data.data]);
                }
            });
        }

        function onGetPresignedError(xhr, status, error) {
            /* TODO: RST-1220:
                Anticipate and handle errors:
                - Network issue to API (no response)
                - Network issue to/from S3 (API responds with bad data)
            */
        }

        function removeButtonElement(button) {
            return button.detach();
        }

        function appendButtonElement(button) {
            $(".dz-default.dz-message.grid-row .column-one-half").append(button);
        }

        function localisedRemoveFileString() {
            let currentLocale = $('html').attr('lang');
            if (currentLocale === 'cy') {
                return "Dileu ffeil";
            } else {
                return "Remove file";
            }
        }

        var removedButton;

        let uploadAdditionalInfoDropzone = new Dropzone("#upload-additional-file",
            {
                // Set "Remove File" string by locale
                dictRemoveFile: localisedRemoveFileString(),
                // Only one file goes to the bucket via the URL
                parallelUploads: 1,
                uploadMultiple: false,
                // Set acceptance criteria, one .rtf file
                maxFiles: 1,
                acceptedFiles: ".rtf",
                // If file passes the accept check, call the API and use the returned values for the upload process
                accept: function (file, done) {
                    getPresignedS3Url(function (presignedData) {
                        prepareAwsHiddenInputs(presignedData);
                        setUploadUrl(presignedData.url);
                        removedButton = removeButtonElement($("#upload-button"));
                        done();
                    });
                },
                // Use POST
                method: "post",
                // Add a link to remove files that were erroneously uploaded
                addRemoveLinks: true,
                success: function (file, response) {
                    appendButtonElement(removedButton);
                    // Take upload URL and pass it into the second form
                    $("#additional_information_upload_additional_information").val($.parseXML(response).getElementsByTagName("Key")[0].childNodes[0].nodeValue);
                    $("#additional_information_upload_file_name").val(file.name);
                }
            }
        );

        uploadAdditionalInfoDropzone.on("maxfilesexceeded", function (file) {
            // TODO: RST-1220 - Error Handling:
            // Build a proper warning system for "too many files" warning.
            alert("too many files");
        });

        uploadAdditionalInfoDropzone.on("removedfile", function () {
            $("#additional_information_upload_file_name").val(null);
        });
    }
});
