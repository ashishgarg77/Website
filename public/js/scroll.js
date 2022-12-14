(function($){var types=['DOMMouseScroll','mousewheel'];if($.event.fixHooks){for(var i=types.length;i;){$.event.fixHooks[types[--i]]=$.event.mouseHooks;}}
$.event.special.mousewheel={setup:function(){if(this.addEventListener){for(var i=types.length;i;){this.addEventListener(types[--i],handler,false);}}else{this.onmousewheel=handler;}},teardown:function(){if(this.removeEventListener){for(var i=types.length;i;){this.removeEventListener(types[--i],handler,false);}}else{this.onmousewheel=null;}}};$.fn.extend({mousewheel:function(fn){return fn?this.bind("mousewheel",fn):this.trigger("mousewheel");},unmousewheel:function(fn){return this.unbind("mousewheel",fn);}});function handler(event){var orgEvent=event||window.event,args=[].slice.call(arguments,1),delta=0,returnValue=true,deltaX=0,deltaY=0;event=$.event.fix(orgEvent);event.type="mousewheel";if(orgEvent.wheelDelta){delta=orgEvent.wheelDelta/120;}
if(orgEvent.detail){delta=-orgEvent.detail/3;}
deltaY=delta;if(orgEvent.axis!==undefined&&orgEvent.axis===orgEvent.HORIZONTAL_AXIS){deltaY=0;deltaX=-1*delta;}
if(orgEvent.wheelDeltaY!==undefined){deltaY=orgEvent.wheelDeltaY/120;}
if(orgEvent.wheelDeltaX!==undefined){deltaX=-1*orgEvent.wheelDeltaX/120;}
args.unshift(event,delta,deltaX,deltaY);return($.event.dispatch||$.event.handle).apply(this,args);}})(jQuery);

var Parallax = {
    utils: {
        doSlide: function(section) {
            var top = section.position().top;
            $('#section-wrapper').stop().animate({
                top: -top
            }, 600, 'linear', function() {
                section.addClass('slided').siblings('div.section').removeClass('slided');
            });
        }
    },
    fn: {
        setHeights: function() {
            $('div.section').height($(window).height());
        },
        onSiteScroll: function() {
            var section = null;

            $('#section-wrapper').mousewheel(function(event, delta) {
                event.preventDefault();
                if (delta < 0) {
                    section = ($('.slided').length) ? $('.slided') : $('#section-1');
                    var next = (section.next().length) ? section.next() : $('#section-1');
                    Parallax.utils.doSlide(next);
                }
                else if(delta > 0) {
                    section = ($('.slided').length) ? $('.slided') : $('#section-1');
                    var prev = (section.prev().length) ? section.prev() : $('#section-1');
                    Parallax.utils.doSlide(prev);
                }
            });


        }
    },

    init: function() {
        for (var prop in this.fn) {
            if (typeof this.fn[prop] === 'function') {
                this.fn[prop]();
            }
        }
    }
};

Parallax.init();