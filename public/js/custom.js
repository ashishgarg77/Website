	$(function () {
	
		var Div1Height = $('.community-outer-new1').height();
	console.log(Div1Height)	
	
	
	
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


    $('.customyoumay .owl-carousel').owlCarousel({
        loop: true,
        margin: 20,
        dots: false,
        nav: false,
        responsiveClass: true,
        responsive: {
            0: {
                items: 1,
                nav: false,
                stagePadding: 30,
            },
            767: {
                items: 1,
                nav: false,
                stagePadding: 100,
            },
            1000: {
                items: 1,
                nav: false,
                loop: false
            }
        }
    })

    $('.eventmobile-slider .owl-carousel').owlCarousel({
        loop: true,
        margin: 20,
        dots: false,
        nav: false,
        responsiveClass: true,
        responsive: {
            0: {
                items: 1,
                nav: false,
                stagePadding: 30,
            },
            767: {
                items: 1,
                nav: false,
                stagePadding: 100,
            },
            1000: {
                items: 1,
                nav: false,
                loop: true
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


      $('.mob-slider-evn .owl-carousel').owlCarousel({
        loop: true,
		stagePadding: 50,
        margin: 40,
		animateOut: 'fadeOut',
        dots: false,
        nav: true,
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
                nav: true,
                loop: false
            }
        }
    })

   

    


    $('.trigger').on('click', () =>{
        $('.megamenu').show();
        $('body').css({'overflow':'hidden'})
    })

    $('.trigger.close').on('click', () =>{
        $('.megamenu').hide();
        $('body').css({'overflow':'auto'})

    })
    $('.menu_inClick').on('click', () =>{
        $('.menu_in').slideToggle();

    })


})


    

$(document).ready(function(){
	$('.home-cat').hover(function (el,ind) {
		$('.home-cat').removeClass('active')
		$(this).addClass('active');
	var array =["images/ekkon-thn11.jpg","images/ekkon-thn12.jpg","images/ekkon-thn13.jpg","images/ekkon-thn14.jpg","images/corporate.jpg","images/ekkon-thn16.jpg"]		
	var index = $(this).index();
	//console.log($('.home-cat-main').eq(array[index]),array[index])
	 $('.home-cat-main').css({"background": "url('"+array[index]+"')","background-size": "cover;"});
	}, 
	function () {
		$('.home-cat-main').removeAttr( "style" )
	});



	
/*$(window).scroll(function(){

	
	
});*/
	
	

})