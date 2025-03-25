var thisPage = 1;
var limit = 6;
var list = document.querySelectorAll('.properties-items .item');
function loadItems() {
    var beginGet = limit * (thisPage - 1);
    var endGet = limit * thisPage - 1;
    list.forEach((item,key) => {
        if(key >= beginGet && key <= endGet) {
            item.style.display = 'block';
        } else {
            item.style.display = 'none';
        }
    })
    // Tính vị trí trang hiện tại
    listPage();
}

loadItems();
function listPage() {
    var count = Math.ceil(list.length / limit); // tổng số trang 
    document.querySelector('.pagination').innerHTML = '';

    if (thisPage != 1) {
        var prev = document.createElement('li');
        var startPage = document.createElement('li');
        startPage.innerHTML = '<i class="fa-solid fa-backward-fast"></i>';
        prev.innerHTML = '<i class="fa-solid fa-arrow-left"></i>';
        prev.setAttribute('onclick', "changePage(" + (thisPage - 1) + ")");
        startPage.setAttribute('onclick', "changePage(" + 1 + ")");
        document.querySelector('.pagination').appendChild(startPage);
        document.querySelector('.pagination').appendChild(prev);
    }

    // Chỉ show tối đa 10 nút chuyển trang thôi
    var start = Math.floor((thisPage - 1) / 10) * 10 + 1;
    var end = start + 9;
    if (end > count) {
        end = count;
    }


    for (var i = start; i <= end; i++) {
        var newPage = document.createElement('li');
        newPage.innerHTML = i;
        if (i == thisPage) {
            newPage.classList.add('is_active');
        }
        newPage.setAttribute('onclick', "changePage(" + i + ")");
        document.querySelector('.pagination').appendChild(newPage);
    }

    if (thisPage != count) {
        var next = document.createElement('li');
        next.innerHTML = '<i class="fa-solid fa-arrow-right"></i>';
        next.setAttribute('onclick', "changePage(" + (thisPage + 1) + ")");
        document.querySelector('.pagination').appendChild(next);
    }

    var endPage = document.createElement('li');
    endPage.innerHTML = '<i class="fa-solid fa-backward-fast fa-rotate-180"></i>';
    endPage.setAttribute('onclick', "changePage(" + count + ")");
    document.querySelector('.pagination').appendChild(endPage);
}

function changePage(i) {
    thisPage = i;
    loadItems();
}

