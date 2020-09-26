
let loader_holder = document.getElementsByClassName("loader-holder")[0];
var myNav = document.getElementById('navbar');
var myLogo = document.getElementById('logo-right');
window.onscroll = function () {
    "use strict";
    if (document.body.scrollTop >= 200 || document.documentElement.scrollTop >= 200) {
        const progress = document.querySelectorAll('.progress-done');
        progress.forEach(p=>{
            setTimeout(() => {
                p.style.opacity = 1;
                p.style.width = p.getAttribute('data-done') + '%';
            }, 500)
        });
    }
};

function hideLoader() {
    loader_holder.style.visibility = "hidden";
    loader_holder.style.opacity = 0
}





