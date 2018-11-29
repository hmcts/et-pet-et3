$( document ).on('turbolinks:load', function() {
    if ($('.pdf-success').length) {
        checkLinkStatus();
    }
});

function checkLinkStatus() {
    let url = $('.pdf-success').attr('href');
    let http = new XMLHttpRequest();
    http.overrideMimeType("application/pdf");
    http.open('GET', url, true);
    http.onload = function (e) {
        if (http.readyState === 4) {
            if (http.status === 200) {
                $('.pdf-failure').addClass("hidden");
                $('.pdf-success').removeClass("hidden").css('pointer-events', 'auto');
            } else {
                $('.pdf-success').addClass("hidden");
                $('.pdf-failure').removeClass("hidden").css('pointer-events', 'none');
                console.warn(`Unable to find PDF, retrying ${url} in 10 seconds`);
                setTimeout(function() { checkLinkStatus() }, 10000);
            }
        }
    };
    http.send();
}