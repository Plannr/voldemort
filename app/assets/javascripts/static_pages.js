// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.

var app = app || {};

app.init = function () {
    app.bgFull(".bg-full");
};

app.bgFull = function ( selector ) {
    var el = $(selector);
    
    $.each(el, function() {
        var thisEl = $(this);
        var imgSrc = thisEl.data('image-src');
        thisEl.css('background-image', 'url('+imgSrc+')');
    });
};

$(document).on('ready page:load', function () {
    app.init();
});