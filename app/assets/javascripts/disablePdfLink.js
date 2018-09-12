$( document ).on('turbolinks:load', function() {
    checkLinkStatus();
});

function checkLinkStatus() {
    let pdfUrl = $('.download-pdf').attr('href');
    $.ajax({
        url: pdfUrl,
        success: function() {
            $('.download-pdf').text('A PDF version of your completed form is now available for download')
                .css('pointer-events', 'auto');
        },
        error: function() {
            $('.download-pdf').text('Not quite ready yet - a PDF version of your completed form will be available for download shortly')
                .css('pointer-events', 'none');
            console.warn(`Unable to find PDF, retrying ${pdfUrl} 10 seconds`);
            setTimeout(checkLinkStatus, 10000);
        }
    })
}