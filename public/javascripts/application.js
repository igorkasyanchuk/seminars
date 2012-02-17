var redactor = {
  focus: true,
  path: '/redactor/',
  image_upload: '/dashboard/asset_photos',
  file_upload:  '/dashboard/assets',
  pathCss: '../stylesheets/',
  css: ['e.css'],
  lang: 'en'
}; 

$(function() {
 $('#search_input input').keypress(function(e) {
        if(e.which == 13) {
          $(this).parents("form").submit();
          return false;
        }
    });

  $("#search_link").click(function() {
    $(this).parents("form").submit();
    return false;
  });
})
