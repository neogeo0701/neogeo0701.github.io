document.addEventListener("DOMContentLoaded", () => {
    // Reveal elements on scroll
    const observerOptions = {
        root: null,
        rootMargin: '0px',
        threshold: 0.1
    };

    const observer = new IntersectionObserver((entries, observer) => {
        entries.forEach(entry => {
            if (entry.isIntersecting) {
                entry.target.classList.add('show');
                observer.unobserve(entry.target);
            }
        });
    }, observerOptions);

    // Grab elements to animate
    const sectionsToAnimate = document.querySelectorAll('.card, .skill-tag, .section-title, .contact p, .contact a');
    
    sectionsToAnimate.forEach((el, index) => {
        el.classList.add('hidden');
        // Add a slight stagger delay dynamically for siblings if needed
        el.style.transitionDelay = `${(index % 5) * 0.1}s`;
        observer.observe(el);
    });

    // Smooth scroll for nav links 
    document.querySelectorAll('a[href^="#"]').forEach(anchor => {
        anchor.addEventListener('click', function (e) {
            e.preventDefault();
            const target = document.querySelector(this.getAttribute('href'));
            if(target) {
                target.scrollIntoView({
                    behavior: 'smooth'
                });
            }
        });
    });
});
