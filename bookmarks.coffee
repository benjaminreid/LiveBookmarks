$(document).ready ->

  `
  (function() {
    var ga = document.createElement('script'); ga.type = 'text/javascript'; ga.async = true;
    ga.src = 'https://ssl.google-analytics.com/ga.js';
    var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(ga, s);
  })();
  `

  results = $('#results')
  search  = $('#search')

  search.focus()

  search.on 'keyup', () ->
    newSearch = $(this).val()
    chrome.bookmarks.search newSearch, (res) ->
      results.html getBookmarksHTML(res)

  getBookmarksHTML = (bookmarks) ->
    output = '<ul class="results-list">'

    buildHtml = (bookmark) ->
      "<li><a href=\"#{bookmark.url}\" target=\"_blank\">#{bookmark.title}</a></li>"

    output += buildHtml bookmark for bookmark in bookmarks
    output += '</ul>'
