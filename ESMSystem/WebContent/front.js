$().ready(function() {
    // menu button for top nav
    $('.menu-button a').click(function(e) {
      e.preventDefault();
      $('nav ul.main-nav').toggleClass('active');
    });
    // # links
    $('a[href="#"]').click(function(e) {
        $('html, body').animate({scrollTop:0}, 'slow');
    });
});