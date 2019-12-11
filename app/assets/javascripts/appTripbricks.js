//= require angular
//= require jquery

var appTripbricks = angular.module("appTripbricks", [])
.controller("myCtrl", ["$scope", function($scope) {
    $scope.myValue ="";
    $scope.myFunc = function() {
        $(".autocomplete_list").removeClass("hidden");
    };
}]);

$(document).ready(function() {
    var owl = $("#carousel-place-home");
    owl.owlCarousel({
        items: 1,
        loop: true,
        margin: 10,
        autoPlay: true,
        autoPlayTimeout: 5000,
        autoPlayHoverPause: true
    });

    var owlHotel = $("#carousel-place-hotel");
    owlHotel.owlCarousel({
        items: 1,
        loop: true,
        margin: 10,
        dots: false,
        pagination: false,
        autoPlay: true,
        autoPlayTimeout: 5000,
        autoPlayHoverPause: true
    });
    // Photo slider
    var owlPhoto = $("#photo-slider");
    owlPhoto.owlCarousel({
        items:4,
        responsive:{
            0:{
                items:1
            },
            600:{
                items:2
            },
            1000:{
                items:3
            },
            1200:{
                items:4
            }
        },
        loop:true,
        margin:10,
        nav:true,
        pagination: true,
        autoPlay: true,
        autoPlayTimeout: 5000,
        autoPlayHoverPause: true
    });
    // Link images

    var owlLinkimage = $(".link-images-slider");
    owlLinkimage.owlCarousel({
        items: 6,
        responsive:{
            0:{
                items:1
            },
            600:{
                items:2
            },
            1000:{
                items:3
            },
            1200:{
                items:6
            }
        },
        loop: true,
        margin: 10,
        autoPlay: true,
        pagination: false,
        merge: true,
        autoPlayTimeout: 10000,
        autoPlayHoverPause: true
    });
});

jQuery(document).ready(function($) {
    $('#hotelCarousel').carousel({
        interval: 5000
    });
    //Handles the carousel thumbnails
    $('[id^=carousel-hotel-]').hover(function() {
        var id_selector = $(this).attr("id");
        try {
            var id = /-(\d+)$/.exec(id_selector)[1];
            console.log(id_selector, id);
            jQuery('#hotelCarousel').carousel(parseInt(id));
        } catch (e) {
            console.log('Regex failed!', e);
        }
    });
    $('.hide-bullets [id^=carousel-hotel-]').click(function() {
        $('#modal_Room-desc').modal({
            show: 'true'
        });
    });
    // When the carousel slides, auto update the text
    $('#hotelCarousel').on('slid.bs.carousel', function(e) {
        var id = $('.item.active').data('slide-number');
        // $('#carousel-text').html($('#slide-content-' + id).html());
        $("#hotel-slider-thumbs li").removeClass("active");
        $('#hotel-slider-thumbs li[data-item-number = ' + id + ']').addClass("active");
    });
});
