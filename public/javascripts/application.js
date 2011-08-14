    $(document).ready(
        function(){

                General();
                SetupContentScrollBars();
                ResizeYouTubeVideos();
                SetupAnimateMainMenu();
                BlogTicker();
        }
    );


    function General(){
        $('a.rss').text('');
        $.jcorners("#body_content",{radius:10});

    }

    function FadeInContentAreas(){
        $('#logo').fadeIn(750);
        $('#menu').fadeIn(1500);
        $('#Latest_News').fadeIn(2000);
        $('#Next_Show').fadeIn(2000);
        $('#ImageContainer').fadeIn(2000);

        $("div.imageSelector").mouseover(function() {
           $(this).removeClass("frontImage").addClass("selectedFrontImage");
         }).mouseout(function(){
            if(!$(this).hasClass("currentlySelected"))
            {
                $(this).removeClass("selectedFrontImage").addClass("frontImage");
            }
        });

        $("div.imageSelector").click(function() {
            $(".currentlySelected").animate({ marginLeft: "0px", opacity: "1"}, 300);

            $(".imageSelector").removeClass("currentlySelected").removeClass("selectedFrontImage").addClass("frontImage");
           $(this).removeClass("frontImage").addClass("currentlySelected").addClass("selectedFrontImage");
           $(this).stop().animate({ marginLeft: "25px", opacity: ".4" }, 200);

           var currentClass = $('#page_container').attr('class');
           var newClass = $(this).attr("id").replace("t", "");
           $('#page_container').removeClass(currentClass).addClass(newClass);
         });


    }
    function ShowContentAreas(){
        $('#logo').show();
        $('#menu').show();
    }

    function SetupContentScrollBars(){


        $('#body_content').tinyscrollbar({ size: 520 });

    }

    function ResizeYouTubeVideos(){
        $('iframe').height(255);
        $('iframe').width(300);
    }

    function SetupAnimateMainMenu(){
       // Append span to each LI to add reflection

        $("#menu ul li").append("");

        // Animate buttons, move reflection and fade

        $("#menu ul li a").hover(function() {
            $(this).stop().animate({ marginLeft: "20px" }, 200);
            $(this).parent().find("span").stop().animate({ marginLeft: "100px", opacity: 0.25 }, 200);
        },function(){
            $(this).stop().animate({ marginLeft: "0px" }, 300);
            $(this).parent().find("span").stop().animate({ marginLeft: "1px", opacity: 1 }, 300);
        });
    }

    function BlogTicker(){
         var items = $('#blog_posts li').length;
        var counter = -1;

        $('#blog_posts li:first').show();

        var interval = window.setInterval(function() {
            counter += 1;

            if(counter == items) {
                counter = 0;
            }

            var element = $('#blog_posts li').eq(counter);

            element.parent().find('li').not(element).hide();
            element.fadeIn(750);
        }, 3000);
    }

    function ShowLocation(location){
        var loc = "#" + location;
        $("p.showLocation").hide("slow");

        $(loc).show("slow");

    }