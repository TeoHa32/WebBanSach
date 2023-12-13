function amount(){
    var num_input = document.querySelector(".product_detail-amount-num");
    var num = Number(num_input.value)
    var plus =  document.querySelector(".fa-plus").addEventListener("click", function(){
        num += 1
        if(num > 10 )
            num = 10
        num_input.value = num

    });

    var minus =  document.querySelector(".fa-minus").addEventListener("click", function(){
        num -= 1
        if(num < 1 )
            num = 1
        num_input.value = num
    });
}

function sortByPrice(){
    var low_to_high = document.querySelector(".sort_low-to-high");
    var high_to_low = document.querySelector(".sort_high-to-low");
    var checks = document.getElementsByClassName("fa-check")

    low_to_high.addEventListener("click", function(){
        checks[0].classList.add("fa-check-show")
        checks[1].classList.remove("fa-check-show")
    })

    high_to_low.addEventListener("click", function(){
        checks[1].classList.add("fa-check-show")
        checks[0].classList.remove("fa-check-show")
    })
    
    
}

function myfunction(img, name, price,publisher, description,author ){
	document.getElementById('img').src =  "/ShopBanSach/view/image/"+img
		
	document.getElementById('name').innerText = "Tên sản phẩm: " + name
	document.getElementById('publisher').innerText = publisher
	document.getElementById('author').innerText = author
	document.getElementById('price').innerText = price
	document.getElementById('description').innerText = description
}

const search = () => {
    var searchBox = document.getElementById('search-box').value.toLowerCase();
    var product = document.querySelectorAll('.product');
    var nameProduct = document.querySelectorAll('.card-title');

    for(var i = 0 ; i < nameProduct.length ; i++){
        if( nameProduct[i].innerHTML.toLowerCase().match(searchBox) ){
            product[i].style.display = "block";
        }
        else{
            product[i].style.display = "none";
        }
    }

}


const showPagination = () => {
    var url = window.location.href;
    
    console.log(url)
    
    var element = document.querySelector('.pagination');
    
    if(url.includes("high-to-low") || url.includes("low-to-high")){
        element.style.display = "block";
         element.style.display = "flex";
    }
    else{
        element.style.display = "none";
    }
}
/**
 * 
 */