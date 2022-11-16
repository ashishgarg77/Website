var fiftyWrapperheight = $(".curtain-panel").height();
      var leftDistance = $(".left-curtain").width();
      var rightDistance = $(".right-curtain").width();
      var numberOfpix = 15;
      //const declaration
      const introVid = document.querySelector(".intro-video");
      const video = introVid.querySelector("video");
      const videoText = introVid.querySelector("h2");
      //  const content = document.querySelector(".content");
      //const heading = content.querySelector("h1");
      const sceneDuration = 8000;
      const videoLength = video.duration; //Value in second
      //ScrollMagic
      //https://scrollmagic.io/docs/ScrollMagic.Controller.html
      const controller = new ScrollMagic.Controller();

      //Scenses
      //https://scrollmagic.io/docs/ScrollMagic.Scene.html
      //https://scrollmagic.io/examples/basic/scene_manipulation.html
      const scene = new ScrollMagic.Scene({
        offset: 0, // start scene after scrolling for 0px
        duration: sceneDuration, // the scene should last for a scroll distance of 3000px | pin the element for a total of 3000px
        triggerElement: introVid,
        triggerHook: 0,
      })
        .addIndicators()
        .setPin(introVid)
        .addTo(controller); // Add scene to ScrollMagic Controller

      //Text Animation
      const textAnimation = TweenMax.fromTo(
        videoText, //element to Tween on
        2, //duration of animation
        { opacity: 0 },
        { opacity: 1, color: "black" }
      );
      let scene2 = new ScrollMagic.Scene({
        duration: sceneDuration,
        triggerElement: introVid,
        triggerHook: 0,
      })
        .setTween(textAnimation)
        .addTo(controller);
      //Video Animation

      let acceleration = 0.1;
      let scrollpos = 0;
      let delay = 0;

      scene.on("update", (e) => {
        scrollpos = e.scrollPos / 333.4;
        if (e.scrollPos > sceneDuration) {
        
          console.log("video ended");
        }
        if (e.scrollPos == 0) {
          $("body").removeClass("freeze");
        }
        //    var value = e.scrollPos / sceneDuration;
        //    var videoSeekTime = video.duration * value;

        //    console.log(e.scrollPos + " | " + videoSeekTime);
        //    isFinite(videoSeekTime) && (video.currentTime = videoSeekTime);
      });

      setInterval(() => {
        delay += (scrollpos - delay) * acceleration;

        isFinite(delay) && (video.currentTime = delay);
      }, 30);

      $(window).on("wheel", function (event) {
        event.preventDefault();
        if (event.originalEvent.detail > 0 || event.originalEvent.wheelDelta < 0) {
          //alternative options for wheelData: wheelDeltaX & wheelDeltaY
          if (numberOfpix < leftDistance + 15) {
            $(".left-curtain").css("left", -numberOfpix);
            $(".right-curtain").css("right", -numberOfpix);
            numberOfpix = numberOfpix + 15;
          } else {
            $("body").addClass("freeze");
          }
        } else {
          if ($(".curtain-panel:visible").length == 1) {
            if (-numberOfpix <= 0) {
              $(".left-curtain").css("left", -numberOfpix);
              $(".right-curtain").css("right", -numberOfpix);
              numberOfpix = numberOfpix - 15;
            }
          }
        }

        //prevent page fom scrolling
        return false;
      });