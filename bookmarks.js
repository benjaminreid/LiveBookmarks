(function($) { $(document).ready(function() {
  
  var results     = $('#results'),
      search      = $('#search');

  search.on('keyup', function() {
    var newSearch = $(this).val();
    chrome.bookmarks.search(newSearch, function(res) {
      results.html(getBookmarksHTML(res));
    });
  });

  var template = '<li><a href="{{URL}}">{{TITLE}}</a></li>';

  function getBookmarksHTML(bookmarks) {
    var output = '<ul class="results-list">';
    for(var b in bookmarks) {
      var bookmark  = bookmarks[b];
      output += template.replace('{{URL}}', bookmark.url).replace('{{TITLE}}', bookmark.title);
    }
    output += '</ul>';
    return output;
  }

}); })(jQuery);