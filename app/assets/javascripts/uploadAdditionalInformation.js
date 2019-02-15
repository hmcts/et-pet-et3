// Turbolinks ready?
$(document).ready(function () {
    // Is this config and can I get rid?
    Dropzone.autoDiscover = false;

    // 1. Extract below function into another file
    // 2. Use if statement below to call config with either aws or azure (from env var)
    // 3. Have separate config function for aws and azure
    //   a) Azure config function can be empty
    // 4. Ensure AWS is working once refactored
    // 5. Once all working, package into a gem
    // 6. Prepare for Azure to work
    // 7. Get Azure working in development environments
    // 8. Implement gem into ET1

    const checkIfUploadPage = () => {
        return $("#upload-additional-file").length;
    };

    if (checkIfUploadPage()) {

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

        function prepareAwsHiddenInputs(fullResponseData) {
            const responseData = fullResponseData.data;

            $("#aws_key").attr("name", "key").val(responseData.fields["key"]);
            $("#aws_policy").attr("name", "policy").val(responseData.fields["policy"]);
            $("#aws_x-amz-algorithm").attr("name", "x-amz-algorithm").val(responseData.fields["x-amz-algorithm"]);
            $("#aws_x-amz-credential").attr("name", "x-amz-credential").val(responseData.fields["x-amz-credential"]);
            $("#aws_x-amz-date").attr("name", "x-amz-date").val(responseData.fields["x-amz-date"]);
            $("#aws_x-amz-signature").attr("name", "x-amz-signature").val(responseData.fields["x-amz-signature"]);
            $("#aws_success_action_status").attr("name", "success_action_status").val(responseData.fields["success_action_status"]);
        }

        function removeAwsHiddenInputs() {
            $("#aws_key").attr("name", "key").remove();
            $("#aws_policy").attr("name", "policy").remove();
            $("#aws_x-amz-algorithm").attr("name", "x-amz-algorithm").remove();
            $("#aws_x-amz-credential").attr("name", "x-amz-credential").remove();
            $("#aws_x-amz-date").attr("name", "x-amz-date").remove();
            $("#aws_x-amz-signature").attr("name", "x-amz-signature").remove();
            $("#aws_success_action_status").attr("name", "success_action_status").remove();
        }

        function buildUpload(cb) {
            $.ajax({
                url: "/api/v2/build_blob",
                dataType: "json",
                data: {
                    uuid: uuidv4(),
                    command: "BuildBlob",
                    async: false,
                    data: {
                        preventEmptyData: true
                    }
                },
                error: onGetPresignedError,
                method: "post",
                success: function (data, status, xhr) {
                    cb.apply(this, [data]);
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

        const DROPZONE_OPTIONS = {
            init: function () {
                this.on("maxfilesexceeded", function (file) {
                    // TODO: RST-1220 - Error Handling:
                    // Build a proper warning system for "too many files" warning.
                    alert("too many files");
                });
                this.on("removedfile", function () {
                    $("#additional_information_upload_file_name").val(null);
                });
            },
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

                // check cloud provider in this section
                buildUpload(function (presignedData) {
                    if (presignedData.meta.cloud_provider == 'amazon') {
                        prepareAwsHiddenInputs(presignedData);
                        setUploadUrl(presignedData.data.url);
                        removedButton = removeButtonElement($("#upload-button"));
                        done();
                    } else if (presignedData.meta.cloud_provider == 'azure') {
                        // TODO: Can this just be ...options.method = 'put'?
                        Object.defineProperties(uploadAdditionalInfoDropzone.options, {
                            method: {
                                value: 'put'
                            },
                            headers: {
                                value: {"x-ms-blob-type": "BlockBlob"}
                            }
                        });
                        removeAwsHiddenInputs();
                        setUploadUrl(presignedData.data.url);
                        removedButton = removeButtonElement($("#upload-button"));
                        done();
                    }
                });
            },
            // Use POST
            method: "post",
            // Add a link to remove files that were erroneously uploaded
            addRemoveLinks: true,
            success: function (file, response) {
                console.log("Success", file, response);
                appendButtonElement(removedButton);
                // Take upload URL and pass it into the second form
                // $("#additional_information_upload_additional_information").val($.parseXML(response).getElementsByTagName("Key")[0].childNodes[0].nodeValue);
                // $("#additional_information_upload_file_name").val(file.name);
            }
        };


        let uploadAdditionalInfoDropzone = new Dropzone("#upload-additional-file", DROPZONE_OPTIONS);

    }

});
