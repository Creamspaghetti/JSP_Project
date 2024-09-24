// 스크롤 함수
function scrollToSection(event) {
    const sectionId = event.target.getAttribute('data-target');
    document.getElementById(sectionId).scrollIntoView({ 
        behavior: 'smooth', 
        block: "center"
    });
}

document.querySelectorAll('.left-goods-category li').forEach(function(li) {
    li.addEventListener('click', scrollToSection);
});

// Intersection Observer를 사용해 각 섹션의 가시성을 추적
const sections = document.querySelectorAll('.goods-category');
const navItems = document.querySelectorAll('.left-goods-category li');

window.addEventListener('scroll', () => {
    let currentSection = '';

    sections.forEach(section => {
        const sectionTop = section.offsetTop;
        const sectionHeight = section.offsetHeight;

        if (window.scrollY >= sectionTop - sectionHeight / 2 && window.scrollY < sectionTop + sectionHeight / 2) {
            currentSection = section.getAttribute('id');
        }
    });

    // 각 <li> 항목의 상태 업데이트
    navItems.forEach(li => {
        li.classList.remove('active');
        if (li.getAttribute('data-target') === currentSection) {
            li.classList.add('active');
        }
    });
});

// 검색 버튼 클릭 시 검색
$('#search-button').on('click', function() {
    search();  // 검색 함수 실행
});

// 엔터 키를 눌렀을 때도 검색 실행
$('#search').on('keydown', function(event) {
    if (event.key === 'Enter') {  // 엔터 키를 눌렀는지 확인
        search();  // 검색 함수 실행
    }
});

// 검색
function search() {
    let search_value = $('#search').val();
    
    // 각 .goods 요소의 name 속성을 순회하면서 확인
    $('.goods').each(function() {
        let name = $(this).attr('name');  // 각 요소의 name 속성값을 가져옴
        if (name === search_value) {
            let href = $(this).attr('href');
            window.location.href = href;
        }
    });
}
