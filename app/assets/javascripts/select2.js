$(document).ready(function () {
  $("#select").multipleSelect({
    onCheckAll: function (view) {
      $("[id^=shiritori]").removeAttr('disabled');
    }
  });
});