window.addEventListener("load", function () {
  var carousels = document.getElementsByClassName("carousel");

  //캐러셀 이벤트를 등록하는 로직
  for (var i = 0; i < carousels.length; i++) {
    addEventToCarousel(carousels[i]);
  }
});

// 이미지 크기를 받아서 슬라이드 버튼이벤트에 등록하는 함수 구현
function addEventToCarousel(carouselElem) {
  var ulElem = carouselElem.querySelector("ul");
  var liElems = ulElem.querySelectorAll("li");

  //너비 값 조정
  //clientWidth는 요소의 내용 영역의 너비를 나타내는 속성
  var liWidth = liElems[0].clientWidth;
  var adjustedWidth = liElems.length * liWidth;
  ulElem.style.width = adjustedWidth;

  //슬라이즈 버튼 이벤트 등록
  var slideButtons = carouselElem.querySelectorAll(".slide");
  // left/right 두개가 있음므로 모두 적용하기 위해 for문 사용
  for (var i = 0; i < slideButtons.length; i++) {
    slideButtons[i].addEventListener(
      "click",
      createListenerSlide(carouselElem)
    );
  }
}

// 이벤트가 발생하는 left/right에 따라 슬라이드 버튼이 작동 되도록 구현하는 함수
function createListenerSlide(carouselElem) {
  return function (event) {
    // event.currentTarget는 현재 이벤트가 발생한 요소를 나타냄
    // 즉 현재 클릭한 버튼
    var clickedButton = event.currentTarget;

    //값 가져오기(li요소)
    var liElems = carouselElem.querySelectorAll("li");
    //li요소 즉 이미지의 갯수 저장
    var liCount = liElems.length;
    //<div class="carousel" data="0"> -> index값 0 가져오기
    var currentIndex = carouselElem.attributes.data.value;

    //슬라이드 버튼 체크
    if (
      // clickedButton.className.includes("right")는
      // clickedButton 요소의 className 속성에 "right"라는
      // 문자열이 포함되어 있는지를 확인
      // liCount - 1 : 5개일때 0,1,2,3,4 이므로 인덱스번호 -1해야함
      clickedButton.className.includes("right") &&
      currentIndex < liCount - 1
    ) {
      currentIndex++;
      // 현재 그림의 위치(currentIndex)로 이미지 스크롤
      scrollDiv(carouselElem, currentIndex);
    } else if (clickedButton.className.includes("left") && currentIndex > 0) {
      currentIndex--;
      scrollDiv(carouselElem, currentIndex);
    }

    //인디케이터 업데이트
    updateIndicator(carouselElem, currentIndex);
    //슬라이드 버튼 보여줌 여부 업데이트
    updateSlideButtonVisible(carouselElem, currentIndex, liCount);

    //새롭게 보여지는 이미지 인덱스 값을 현제 data 값으로 업데이트
    carouselElem.attributes.data.value = currentIndex;
  };
}

function scrollDiv(carouselElem, nextIndex) {
  var scrollable = carouselElem.querySelector("div");
  var liWidth = scrollable.clientWidth;
  var newLeft = liWidth * nextIndex; //600*3=1800

  scrollable.scrollTo({ left: newLeft, behavior: "smooth" });
}

function updateIndicator(carouselElem, currentIndex) {
  var indicators = carouselElem.querySelectorAll("footer > div");
  for (var i = 0; i < indicators.length; i++) {
    if (currentIndex == i) {
      indicators[i].className = "active";
    } else {
      indicators[i].className = "";
    }
  }
}

function updateSlideButtonVisible(carouselElem, currentIndex, liCount) {
  var left = carouselElem.querySelector(".slide-left");
  var right = carouselElem.querySelector(".slide-right");

  if (currentIndex > 0) {
    left.style.display = "block";
  } else {
    left.style.display = "none";
  }

  if (currentIndex < liCount - 1) {
    right.style.display = "block";
  } else {
    right.style.display = "none";
  }
}

// window.addEventListener('load', function() {});
// 페이지가 완전히 로드된 후에 특정 함수를 실행하는 방법.
// load 이벤트는 모든 리소스(이미지, 스타일시트, 스크립트 등)가 로드되었을 때 발생함.