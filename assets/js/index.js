
let loader_holder = document.getElementsByClassName("loader-holder")[0];
var myNav = document.getElementById('navbar');
var myLogo = document.getElementById('logo-right');
window.onscroll = function () { 
    "use strict";
    if (document.body.scrollTop >= 70 || document.documentElement.scrollTop >= 70 ) {
        myNav.style.background="#fff";
        myNav.style.boxShadow="0px 0px 10px silver";
    } 
    else {
        myNav.style.background="none"
        myNav.style.boxShadow="none";
    }
};

function hideLoader() {
    loader_holder.style.visibility = "hidden";
    loader_holder.style.opacity=0
}
