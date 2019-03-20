window.EtDropzoneUploader = {};
window.EtDropzoneUploader.init = (formId, uploadKeyId, fileNameId) => {
    Dropzone.autoDiscover = false;

    const uploadForm = $(formId);
    let provider;

    // Source:
    // stackoverflow.com/questions/105034/create-guid-uuid-in-javascript#answer-2117523
    function uuidv4() {
        return ([1e7] + -1e3 + -4e3 + -8e3 + -1e11).replace(/[018]/g, (c) =>
            (c ^ crypto.getRandomValues(new Uint8Array(1))[0] & 15 >> c / 4).toString(16)
        )
    }

    function setUploadUrl(url) {
        dropzoneUploadForm.options.url = url;
    }

    function prepareAwsHiddenInputs(formContainer, fullResponseData) {
        // TODO: RST-1676 Remove this code
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
            - Network issue to/from Azure/S3 (API responds with bad data)
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

    function getFileHash(file, headerCallback) {
        let blobSlice = File.prototype.slice || File.prototype.mozSlice || File.prototype.webkitSlice,
            chunkSize = 2097152,                             // Read in chunks of 2MB
            chunks = Math.ceil(file.size / chunkSize),
            currentChunk = 0,
            spark = new SparkMD5.ArrayBuffer(),
            fileReader = new FileReader();

        fileReader.onload = function (e) {
            spark.append(e.target.result);                   // Append array buffer
            currentChunk++;

            if (currentChunk < chunks) {
                loadNext();
            } else {
                const hash = btoa(spark.end(true));
                headerCallback(hash);
            }
        };

        fileReader.onerror = function () {
            console.warn('oops, something went wrong.');
        };

        function loadNext() {
            let start = currentChunk * chunkSize,
                end = ((start + chunkSize) >= file.size) ? file.size : start + chunkSize;

            fileReader.readAsArrayBuffer(blobSlice.call(file, start, end));
        }

        loadNext();
    }

    let removedButton, uploadKey;

    const DROPZONE_OPTIONS = {
        init: function () {
            this.on("maxfilesexceeded", function (file) {
                // TODO: RST-1220 - Error Handling:
                // Build a proper warning system for "too many files" warning.
                alert("Too many files");
            });
            this.on("removedfile", function () {
                $(fileNameId).val(null);
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
                provider = presignedData.meta.cloud_provider;
                if (presignedData.meta.cloud_provider == 'azure') {
                    dropzoneUploadForm.options.method = 'put';
                    dropzoneUploadForm.options.headers = {"x-ms-blob-type": "BlockBlob"};
                    getFileHash(file, function(hash) {
                        dropzoneUploadForm.options.headers["Content-MD5"] = hash;
                        uploadKey = presignedData.data.fields.key;
                        setUploadUrl(presignedData.data.url);
                        removedButton = removeButtonElement($("#upload-button"));
                        done();
                    })
                } else {
                    // TODO: RST-1676 Remove the 'else' statement
                    prepareAwsHiddenInputs(uploadForm, presignedData);
                    uploadKey = presignedData.data.fields.key;
                    setUploadUrl(presignedData.data.url);
                    removedButton = removeButtonElement($("#upload-button"));
                    done();
                }
            });
        },
        // Use POST by default for AWS
        // TODO: RST-1676 Default this to 'put' and remove the assignment within the buildUpload if statement
        method: "post",
        // Add a link to remove files that were erroneously uploaded
        addRemoveLinks: true,
        success: function (file) {
            appendButtonElement(removedButton);
            // Take upload URL and pass it into the second form
            $(uploadKeyId).val(uploadKey);
            $(fileNameId).val(file.name);
        },
        sending: function(file, xhr) {
            // Source: https://github.com/enyo/dropzone/issues/590#issuecomment-51498225
            if (provider == 'azure') {
                const send = xhr.send;
                xhr.send = function() {
                    send.call(xhr, file);
                    xhr.send = send;
                };
            }
        }
    };
    
    const dropzoneUploadForm = new Dropzone(formId, DROPZONE_OPTIONS);

};
