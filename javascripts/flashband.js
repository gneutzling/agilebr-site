
// The ID of the extension we want to talk to.
var editorExtensionId = "dlpaehghkchmmlmlcnaeacacafeloahj";

$(document).ready(function(){
  $(".jumbotron a").click(function(){
    // Make a simple request:
      chrome.runtime.sendMessage(editorExtensionId, { start: 'flashband'},
        function(response) {
          console.log(response);
          //$(".jumbotron a").append(response);
        });
  });
});

