
var myNav = document.getElementById('home');

function scrollNav() {
    if (document.body.scrollTop > 50 || document.documentElement.scrollTop > 50) {
        myNav.classList.add("whit-bg");
    } else {
        myNav.classList.remove("whit-bg");
    }
}

var myLogo = document.getElementById('logo-right');

function scrollSkills() {
    if (document.body.scrollTop >= 200 || document.documentElement.scrollTop >= 200) {
        const progress = document.querySelectorAll('.progress-done');
        progress.forEach(p => {
            setTimeout(() => {
                p.style.opacity = 1;
                p.style.width = p.getAttribute('data-done') + '%';
            }, 500)
        });
    }
}

document.addEventListener("DOMContentLoaded", function () {
    var lazyloadImages;

    if ("IntersectionObserver" in window) {
        lazyloadImages = document.querySelectorAll(".lazy");
        var imageObserver = new IntersectionObserver(function (entries, observer) {
            entries.forEach(function (entry) {
                if (entry.isIntersecting) {
                    var image = entry.target;
                    image.src = image.dataset.src;
                    image.classList.remove("lazy");
                    imageObserver.unobserve(image);
                }
            });
        });

        lazyloadImages.forEach(function (image) {
            imageObserver.observe(image);
        });
    } else {
        var lazyloadThrottleTimeout;
        lazyloadImages = document.querySelectorAll(".lazy");

        function lazyload() {
            if (lazyloadThrottleTimeout) {
                clearTimeout(lazyloadThrottleTimeout);
            }

            lazyloadThrottleTimeout = setTimeout(function () {
                var scrollTop = window.pageYOffset;
                lazyloadImages.forEach(function (img) {
                    if (img.offsetTop < (window.innerHeight + scrollTop)) {
                        img.src = img.dataset.src;
                        img.classList.remove('lazy');
                    }
                });
                if (lazyloadImages.length == 0) {
                    document.removeEventListener("scroll", lazyload);
                    window.removeEventListener("resize", lazyload);
                    window.removeEventListener("orientationChange", lazyload);
                }
            }, 20);
        }

        document.addEventListener("scroll", lazyload);
        window.addEventListener("resize", lazyload);
        window.addEventListener("orientationChange", lazyload);
    }
})








var modal = document.getElementById("modal1");

// Get the button that opens the modal
var btn = document.getElementById("card1").addEventListener('click', (e) => {
    e.preventDefault();
    modal.classList.add("show");
});

// Get the <span> element that closes the modal
var span = document.getElementsByClassName("close")[0];


// When the user clicks on <span> (x), close the modal
span.onclick = function () {
    modal.classList.remove("show");
}

// When the user clicks anywhere outside of the modal, close it
window.onclick = function (event) {
    if (event.target == modal) {
        modal.classList.remove("show");
    }
}




//Get the button
var mybutton = document.getElementById("myBtn");

// When the user scrolls down 20px from the top of the document, show the button
window.onscroll = function () {
    scrollFunction();
    scrollNav();
    scrollSkills();
};

function scrollFunction() {
    if (document.body.scrollTop > 20 || document.documentElement.scrollTop > 20) {
        mybutton.style.display = "block";
    } else {
        mybutton.style.display = "none";
    }
}

// When the user clicks on the button, scroll to the top of the document
function topFunction() {
    document.body.scrollTop = 0;
    document.documentElement.scrollTop = 0;
}
