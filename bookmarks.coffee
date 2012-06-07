$(document).ready ->
  
  results = $('#results')
  search  = $('#search')

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