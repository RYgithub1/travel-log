let map;

// マップオプションを変数に格納
let mapOptions = {
  // 座標と拡大率を指定
  zoom: 14,
  center: {
    lat: 35.6811673, // 緯度
    lng: 139.7648629, // 経度
  },
};

// マップオブジェクト作成
map = new google.maps.Map(document.getElementById("js-map"), mapOptions);
