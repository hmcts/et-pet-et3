$( document ).on('turbolinks:load', function() {
    if ($('.download-pdf').length) {
        checkLinkStatus();
    }
});

function checkLinkStatus() {
    let url = $('.download-pdf').attr('href');
    let http = new XMLHttpRequest();
    http.overrideMimeType("application/pdf");
    http.open('GET', url, true);
    http.onload = function (e) {
        if (http.readyState === 4) {
            if (http.status === 200) {
                $('.download-pdf').text('A PDF version of your completed form is now available for download')
                    .css('pointer-events', 'auto');
            } else {
                $('.download-pdf').text('Not quite ready yet - a PDF version of your completed form will be available for download shortly')
                    .css('pointer-events', 'none');
                console.warn(`Unable to find PDF, retrying ${url} in 10 seconds`);
                setTimeout(function() { checkLinkStatus() }, 10000);
            }
        }
    };
    http.send();
}