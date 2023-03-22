$(function(){
  menuView("#ml1", "#sl1");
  menuView("#ml2", "#sl2");
  menuView("#ml3", "#sl3");
  menuView("#ml4", "#sl4");
  menuView("#sl1", "#sl1");
  menuView("#sl2", "#sl2");
  menuView("#sl3", "#sl3");
  menuView("#sl4", "#sl4");
});

/* ************** 하위 메뉴 노출 함수 ************** */
function menuView(main, sub){
  $(main).mouseover(function(){
    $(sub).css("display", "block");
  });
  $(main).mouseout(function(){
    $(sub).css("display", "none");
  });
}
