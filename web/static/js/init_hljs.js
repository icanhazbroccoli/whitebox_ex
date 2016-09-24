import $ from "jquery"
import hljs from "highlight.js"

$(document).ready(function() {
  $('pre code').each(function(i, block) {
    hljs.highlightBlock(block);
  });
});
