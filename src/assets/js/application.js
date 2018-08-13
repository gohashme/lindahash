$(function () {
  window.GoHashMe = {}

  var current = location.pathname.split("/").slice(-1)[0].replace(/^\/|\/$/g, '');
  $('.navbar.horizontal-layout .nav-bottom .page-navigation .nav-item').each(function () {
    var $this = $(this);
    if (current == '') {
      //for root url
      $('.pool-nav').addClass("active");
    } else {
      //for other url
      if ($this.find(".nav-link").attr('href').indexOf(current) !== -1) {
        $(this).find(".nav-link").parents('.nav-item').last().addClass('active');
        $(this).addClass("active");
      }
    }
  })

  $(".navbar.horizontal-layout .navbar-menu-wrapper .navbar-toggler").on("click", function () {
    $(".navbar.horizontal-layout .nav-bottom").toggleClass("header-toggled");
  });

  //checkbox and radios
  $(".form-check .form-check-label,.form-radio .form-check-label").not(".todo-form-check .form-check-label").append('<i class="input-helper"></i>');

  GoHashMe.hashFormat = function (hash, unit = "H/s", symbolT = true) {
    if (hash === 0 || hash < 0) {
      return '0 ' + unit
    } else {
      let denominations = [
        { hash: 1e-6, symbol: "μ" },
        { hash: 1e-3, symbol: "m" },
        { hash: 1, symbol: "" },
        { hash: 1e3, symbol: "k" },
        { hash: 1e6, symbol: "M" },
        { hash: 1e9, symbol: "G" },
        { hash: 1e12, symbol: "T" },
        { hash: 1e15, symbol: "P" },
        { hash: 1e18, symbol: "E" },
        { hash: 1e21, symbol: "Z" },
        { hash: 1e24, symbol: "Y" },
      ]

      let denomination = []

      $.each(denominations, function (index, d) { 
        if (hash >= d.hash) {
          denomination.push(d)
        }
      })

      hash = (hash / denomination[denomination.length - 1].hash).toString().match(/^-?\d+(?:\.\d{0,2})?/)[0]

      if (symbolT) {
        return hash + " " + denomination[denomination.length - 1].symbol + unit
      } else {
        return hash
      }
    }    
  }
})