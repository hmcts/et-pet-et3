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

    const uploadAdditionalFileForm = $("#upload-additional-file");

    const checkIfUploadPage = () => {
        return uploadAdditionalFileForm.length;
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

        function prepareAwsHiddenInputs(formContainer, fullResponseData) {
            const responseData = fullResponseData.data;

            formContainer.append(
                `<input type='hidden' name='key' id='aws_key' value='${responseData.fields["key"]}'>`,
                `<input type='hidden' name='policy' id='aws_policy' value='${responseData.fields["policy"]}'>`,
                `<input type='hidden' name='x-amz-algorithm' id='aws_x-amz-algorithm' value='${responseData.fields["x-amz-algorithm"]}'>`,
                `<input type='hidden' name='x-amz-credential' id='aws_x-amz-credential' value='${responseData.fields["x-amz-credential"]}'>`,
                `<input type='hidden' name='x-amz-date' id='aws_x-amz-date' value='${responseData.fields["x-amz-date"]}'>`,
                `<input type='hidden' name='x-amz-signature' id='aws_x-amz-signature' value='${responseData.fields["x-amz-signature"]}'>`,
                `<input type='hidden' name='success_action_status' id='success_action_status' value='${responseData.fields["success_action_status"]}'>`
            );
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
                success: function (data) {
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

        let removedButton, uploadKey;

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
                    console.log(presignedData);
                    if (presignedData.meta.cloud_provider == 'azure') {
                        uploadAdditionalInfoDropzone.options.method = 'put';
                        uploadAdditionalInfoDropzone.options.headers = {"x-ms-blob-type": "BlockBlob"};
                    } else {
                        console.log("Not azure");
                        prepareAwsHiddenInputs(uploadAdditionalFileForm, presignedData);
                    }
                    uploadKey = presignedData.data.fields.key;
                    setUploadUrl(presignedData.data.url);
                    removedButton = removeButtonElement($("#upload-button"));
                    done();
                });
            },
            // Use POST
            method: "post",
            // Add a link to remove files that were erroneously uploaded
            addRemoveLinks: true,
            success: function (file) {
                appendButtonElement(removedButton);
                // Take upload URL and pass it into the second form
                $("#additional_information_upload_additional_information").val(uploadKey);
                $("#additional_information_upload_file_name").val(file.name);
            }
        };

        // TODO: Can I do this with jquery programmatically?
        let uploadAdditionalInfoDropzone = new Dropzone("#upload-additional-file", DROPZONE_OPTIONS);
    }

});
