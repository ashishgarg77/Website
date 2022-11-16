$(function () {
    $('.signup-left .owl-carousel').owlCarousel({
        loop: true,
        responsiveClass: true,
        responsive: {
            0: {
                items: 1,
                nav: false
            },
            600: {
                items: 1,
                nav: false
            },
            1000: {
                items: 1,
                nav: false,
                loop: false
            }
        }
    })

    $('.browse-by-body .owl-carousel').owlCarousel({
        loop: true,
        margin: 40,
        dots: false,
        nav: true,
        responsiveClass: true,
        responsive: {
            0: {
                items: 1,
                nav: false
            },
            600: {
                items: 3,
                nav: false
            },
            1000: {
                items: 5,
                nav: true,
                loop: false
            }
        }
    })


		



    $('.mobile-trigger').on('click', () =>{
        $('.blackover').toggleClass('active');
        $('.navigation').toggleClass('active');
        $('.navigation').toggleClass('open');
    })

    $('.blackover').on('click', () =>{
        $('.blackover').removeClass('active');
        $('.navigation').removeClass('active');
        $('.navigation').removeClass('open');

    })
    $('.menu_inClick').on('click', () =>{
        $('.menu_in').slideToggle();

    })
    
  

})