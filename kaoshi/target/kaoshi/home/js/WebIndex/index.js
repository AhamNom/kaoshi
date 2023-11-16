var mainslider;

$(document).ready(function(){
    $.get("/dati.php/WebIndex/getBanner",function(data){
                    data = JSON.parse(data);
                    var sliders = $(".slider");
                    for (var i = 0; i < data.length; i++) {
                        var  slider=document.createElement('div');
                        slider.className = "slide";
                        slider.id = "slide"+data[i].id;
                        sliders.append(slider);
                        $(".slide#slide"+data[i].id).backstretch(data[i].thumb);
                        
                    }

                    var options = {
                        slides: '.slide', // The name of a slide in the slidesContainer
                        swipe: true,    // Add possibility to Swipe > note that you have to include touchSwipe for this
                        slideTracker: true, // Add a UL with list items to track the current slide
                        slideTrackerID: 'slideposition', // The name of the UL that tracks the slides
                        slideOnInterval: false, // Slide on interval
                        interval: 9000, // Interval to slide on if slideOnInterval is enabled
                        animateDuration: 1000, // Duration of an animation
                        animationEasing: 'ease', // Accepts: linear ease in out in-out snap easeOutCubic easeInOutCubic easeInCirc easeOutCirc easeInOutCirc easeInExpo easeOutExpo easeInOutExpo easeInQuad easeOutQuad easeInOutQuad easeInQuart easeOutQuart easeInOutQuart easeInQuint easeOutQuint easeInOutQuint easeInSine easeOutSine easeInOutSine easeInBack easeOutBack easeInOutBack
                        pauseOnHover: false // Pause when user hovers the slide container
                    };

                    $(".slider").simpleSlider(options);
                    mainslider = $(".slider").data("simpleslider");
                    /* yes, that's all! */

                    $(".slider").on("beforeSliding", function(event){
                        var prevSlide = event.prevSlide;
                        var newSlide = event.newSlide;
                        $(".slider .slide[data-index='"+prevSlide+"'] .slidecontent").fadeOut();
                        $(".slider .slide[data-index='"+newSlide+"'] .slidecontent").hide();
                    });

                    $(".slider").on("afterSliding", function(event){
                        var prevSlide = event.prevSlide;
                        var newSlide = event.newSlide;
                        $(".slider .slide[data-index='"+newSlide+"'] .slidecontent").fadeIn();
                    });

                    $('.slide .backstretch img').on('dragstart', function(event) { event.preventDefault(); });

                    $(".slidecontent").each(function(){
                        $(this).css('margin-top', -$(this).height()/2);
                    });
                }
    );
    
});
