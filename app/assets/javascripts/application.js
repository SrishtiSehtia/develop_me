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
//= require rails-ujs
//= require jquery
//= require materialize
//= require validate
// require_tree .

$(function(){

  var is_page = function(path){ return location.pathname.indexOf(path) >= 0 }
  var data = {};

  if( is_page("/login") ){
    data = {
      email: { required: true, email: true },
      password: {required: true, minlength: 5}
    }
  } else if( is_page("/users/new") ){
    data = {
      first_name:{ required: true, minlength: 2 },
      last_name: { required: true, minlength: 2},
      email: { required: true, email: true },
      password: {required: true, minlength: 5}
    }
  }

  $("form").validate({
    rules: data,
    errorElement : 'div',
    errorPlacement: function(error, element) {
      error.addClass('error').insertAfter(element);
    }
  })
});
