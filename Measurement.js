
//GET ALL IFRAME ELEMENTS
var videos = document.getElementsByClassName("Media");

//WIDTH AND HEIGHT
var _width = 530;
var _height = 300;

//ON WEBPAGE LOAD
window.onload = function () {
    for (var i = 0; i < videos.length; i++) {
        videos[i].style.width = _width + "px";
        videos[i].style.height = _height + "px";
    }
}
