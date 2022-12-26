$(document).ready(function() {
    /* swiper */
    // dogSwiper
    const dog_swiper = new Swiper(".dogSwiper", {
        slidesPerView: 5,
        spaceBetween: 30,
        centeredSlides: true,
        autoplay: {
            delay: 3000,
            disableOnInteraction: false,
        },
        loop: true,
        pagination: {
            el: ".swiper-pagination",
            clickable: true,
        },
        navigation: {
            nextEl: ".swiper-button-next",
            prevEl: ".swiper-button-prev",
        },
    });
    
    const cat_swiper = new Swiper(".catSwiper", {
        slidesPerView: 5,
        spaceBetween: 30,
        centeredSlides: true,
        autoplay: {
            delay: 7000,
            disableOnInteraction: false,
        },
        loop: true,
        pagination: {
            el: ".swiper-pagination",
            clickable: true,
        },
        navigation: {
            nextEl: ".swiper-button-next",
            prevEl: ".swiper-button-prev",
        },
    });

    // reviewSwiper
    const review_swiper = new Swiper(".reviewSwiper", {
        effect: "coverflow",
        grabCursor: true,
        centeredSlides: true,
        autoplay: {
            delay: 3000,
            disableOnInteraction: false,
        },
        slidesPerView: "auto",
        coverflowEffect: {
            rotate: 50,
            stretch: 0,
            depth: 100,
            modifier: 1,
            slideShadows: false,
        },
        pagination: {
            el: ".swiper-pagination",
        },
    });

    // video
    //최초 로드 시 iframe 높이값 비율에 맞게 세팅
    let videoIframe = document.getElementById('video');
    let resHeight = videoIframe.offsetWidth * 0.5625;
    videoIframe.setAttribute('height', resHeight);

    //브라우저 리사이즈 시 iframe 높이값 비율에 맞게 세팅
    window.addEventListener('resize', function(){
        resHeight = videoIframe.offsetWidth * 0.5625;
        videoIframe.setAttribute('height', resHeight);
    });

    const myModal = document.getElementById('exampleModal');
    const myInput = document.getElementById('myInput');

    myModal.addEventListener('shown.bs.modal', () => {
        myInput.focus()
    });

});
