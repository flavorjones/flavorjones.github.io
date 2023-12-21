// Add your custom JavaScript for your KeyDown presentation here
$(function() {
    $(".incremental .content")
        .find("h1,h2,h3,p,div,span,li")
        .not("h1:first-child,h2:first-child,h3:first-child")
        .addClass("slide");
});
