// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require bootstrap-sprockets
//= require turbolinks
//= require_tree .

$(function() {
  $('[data-toggle="tooltip"]').tooltip()
  $('body').on('loaded.bs.modal', '.modal', function (e) {
    $(this).find('[data-toggle="tooltip"]').tooltip()
  })

  var loadingHtml = '<div class="modal-body text-center"><i class="fa fa-refresh fa-spin fa-3x fa-fw"></i> <span class="sr-only">Loading...</span></div>'
  $('body').on('hidden.bs.modal', '.modal', function (e) {
    $(this).removeData('bs.modal')
    $(this).find('.modal-content').html(loadingHtml)
  })
})
