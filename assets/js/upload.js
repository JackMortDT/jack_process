import jQuery from "jquery"


function startUpload(formData, $form) {
  let $progress = $form.find("progress");
  $progress.show()
  jQuery.ajax({
    type: 'POST',
    url: '/uploads',
    data: formData,
    processData: false,
    cache: false,
    contentType: false,
    xhr: function () {
      let xhr = jQuery.ajaxSettings.xhr();
      if (xhr.upload) {

        xhr.upload.addEventListener(
          'progress', 
          createProgressHandler($form), 
          false
        );

      }
      return xhr;
    },

    success: function (data) {
      window.location = "/uploads"
    },

    error: function (data) {
      console.error(data);
    }
  })
}

function createProgressHandler($form) {
  let $progress = $form.find("progress"),
      $label = $form.find("label.progress-percentage");

  return function handleProgressEvent(progressEvent) {
    let progress = progressEvent.loaded / progressEvent.total,
      percentage = progress * 100,
      percentageStr = `${percentage.toFixed(2)}%`;

    $label.text(percentageStr);

    $progress
      .attr("max", progressEvent.total)
      .attr("value", progressEvent.loaded);
  }
}

jQuery(document).ready(function ($) {
  let $form = $("#upload_form"),
    $fileInput = $form.find("input[type='file']");

  $form.submit(function (event) {
    let formData = new FormData(this);
    startUpload(formData, $form);

    event.preventDefault();
  })

  $fileInput.on("change", function (e) {
    $form.trigger("submit");
  });
})