const filter = document.getElementById('typeFilter');
const cards = document.querySelectorAll('.property-card');

filter.addEventListener('change', () => {
    const selected = filter.value;

    cards.forEach(card => {
        const type = card.getAttribute('data-type');
        card.style.display = (selected === '' || selected === type) ? 'block' : 'none';
    });
});
