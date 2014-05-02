// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.

var app = app || {};

app.init = function () {
    app.bgFull(".bg-full");
    app.bindEvents();
};

app.modal = {};
app.modal.settings = {
    overlay: $('<div />').addClass('modal-overlay'),
    modalBox: $('<div />').addClass('modal-box'),
    modalClose: $('<button />').text('X').addClass('modal-close')
};
app.modal.open = function ( content ) {
    var widget = this.settings.overlay.append(this.settings.modalBox.append(this.settings.modalClose, content));
    $('.page').append(widget);
    app.modal.bindEvents();
};

app.modal.close = function () {
    $('.modal-overlay').remove();
};

app.modal.bindEvents = function () {
    $('.modal-close').on('click', app.modal.close);
};

app.bindEvents = function () {
    $('.login').on('click', function (e) {
        var el = $(this),
            formId = el.data('toggle');

        // $('#'+formId).toggleClass('toggle');
        if ( $('.modal-overlay').length > 0 ) {
            app.modal.close();
        } else {
            app.modal.open($('#'+formId).toggleClass('toggle'));
        }

        return false;
    });
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