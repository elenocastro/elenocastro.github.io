(() => {
    const badges = document.querySelectorAll('[data-scholar-citations]');
    if (!badges.length || !['www.elenocastro.com', 'elenocastro.com', 'elenocastro.github.io'].includes(location.hostname)) return;

    const url = 'https://raw.githubusercontent.com/elenocastro/elenocastro.github.io/citation-counts/scholar-citations.json';
    fetch(url)
        .then(response => response.ok ? response.json() : null)
        .then(counts => {
            if (!counts) return;
            badges.forEach(badge => {
                const count = counts[badge.dataset.scholarCitations];
                if (Number.isSafeInteger(count) && count >= 0) {
                    badge.querySelector('.scholar-citation-count').textContent = count;
                    badge.setAttribute('aria-label', `${count} Google Scholar citations`);
                }
            });
        })
        .catch(() => {
            // Keep the count rendered by Jekyll when the refresh is unavailable.
        });
})();
