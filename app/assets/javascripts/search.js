$(function(){

  var search_list = $(".result");

  function appendRestaurant(restaurant) {
   // var html = `<div class="result_store">
   //              <img src="${ restaurant.image }">
   //              <ul>
   //                <li class="result_storeName">${ restaurant.name }</li>
   //                <li class="result_storeAddress">${ restaurant.address }</li>
   //              </ul>
   //              <a href="/restaurants/register?id=${ restaurant.id }">登録</a>
   //            </div>`
    search_list.append(html);
  }

  function appendNorestaurant(restaurant) {
    var html = `<div class="result_store">${ restaurant }</div>`
    search_list.append(html);
  }

  $(".search__query, .search__name, .search__area").on("change", function(){
    var name = $(".search__name").val();
    var area = $(".search__area").val();

    $.ajax({
      type: 'GET',
      url: '/restaurants/search',
      data: {
        name: name,
        area: area
      },
      dataType: 'json'
    })

    .done(function(restaurants) {
      $(".result_store").empty();
      if (restaurants.length !== 0){
        restaurants.forEach(function(restaurant){
          appendRestaurant(restaurant);
        });
      }
      else {
        appendNorestaurant("一致する店舗はありません");
      }
    })
    .fail(function() {
      alert('店舗検索に失敗しました');
    })
  });
});
