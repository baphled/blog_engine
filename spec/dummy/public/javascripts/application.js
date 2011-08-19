// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults
$(document).ready(function() {
  $('#blog_engine_article_content, #blog_engine_comment_body').markItUp(mySettings)
  $('#blog_engine_article_published_at').datepicker({ dateFormat: 'dd-mm-yy', gotoCurrent: true, changeYear: true })
});

