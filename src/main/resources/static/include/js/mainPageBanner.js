$(document).ready(function(){
  let swiper = new Swiper(".mySwiper", {
    slidesPerView: 1,
    spaceBetween: 30,
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

  let horizontalBar = document.getElementById("horizontal-underline");
  let horizontalMenus = document.querySelectorAll(".main-ul > li ");
  
  console.log(horizontalMenus);
  
  
  function horizontalIndicator(e) {
    horizontalBar.style.left = e.offsetLeft + "px";
    horizontalBar.style.width = e.offsetWidth + "px";
    horizontalBar.style.top = e.offsetTop + e.offsetHeight + "px";
  }
  
  
  horizontalMenus.forEach((menu) =>
    menu.addEventListener("mouseover", (e) =>
      horizontalIndicator(e.currentTarget)
    )
  );
  horizontalMenus.addEventListener("mouseout", function(){
    horizontalBar.style.width = 0 + "px";
  });

  

});
