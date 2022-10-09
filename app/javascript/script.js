const API_KEY = gon.weather_api_key

/* global $*/
$(function(){
  $('#btn').on('click', function() {

    $.ajax({
      url: "https://api.openweathermap.org/data/2.5/weather?q=" + $('#cityname').val() + "&units=metric&appid=" + API_KEY,
      dataType : 'jsonp',
    }).done(function (data){
      //通信成功
      // 位置
      $('#place').text(data.name);
      // 最高気温
      $('#temp_max').text(data.main.temp_max + "℃");
      // 最低気温
      $('#temp_min').text(data.main.temp_min + "℃");
      //湿度
      $('#humidity').text(data.main.humidity + "%");
      //風速
      $('#speed').text(data.wind.speed + "m/s");
      // 天気
      // $('#weather').text(data.weather[0].main);
      // 天気アイコン
      $('#weather img').attr("src","http://openweathermap.org/img/w/" + data.weather[0].icon + ".png");
      $('#weather img').attr("alt",data.weather[0].main);
    }).fail(function (data) {
      //通信失敗
          alert('通信に失敗しました。');
    });
  });
});


$(function() {
  $('#back a').on('click',function(event){
    $('body, html').animate({
      scrollTop:0
    }, 800);
    event.preventDefault();
  });
});