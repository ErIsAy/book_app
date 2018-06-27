// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery/dist/jquery
//= require bootstrap/dist/js/bootstrap.min
//= require rails-ujs
//= require jquery.purr
//= require toastr/build/toastr.min
//= require best_in_place
//= require activestorage
//= require_tree .

$(document).ready(function() {
    //
    // activating Best In Place gem
    //
    jQuery(".best_in_place").best_in_place();
    $('.best_in_place').bind("ajax:success", function() {
        window.location.reload();
    });
    //
    // read more/read less
    //
    $('[class^="read-more"]').click(function(element) {
        element.preventDefault()
        $(`.truncated-paragraph-${elId($(this))}`).hide()
        $(`.normal-paragraph-${elId($(this))}`).show()
    })

    $('[class^="read-less"]').click(function(element) {
        element.preventDefault()
        $(`.normal-paragraph-${elId($(this))}`).hide()
        $(`.truncated-paragraph-${elId($(this))}`).show()
    })

    function elId(element) {
        let elClassName = element.attr('class').split('-')
        return elClassName[elClassName.length - 1]
    }


});