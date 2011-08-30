$.fn.spin = function(opts) {
  this.each(function() {
    var spinner = $(this).data('spinner');
    if (spinner) spinner.stop();
    if (opts !== false) {
      $(this).data('spinner', new Spinner(opts).spin(this));
    }
  });
  return this;
}