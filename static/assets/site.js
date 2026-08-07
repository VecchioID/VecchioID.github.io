(() => {
  const root = document.documentElement;
  const button = document.getElementById('theme-toggle');
  const stored = localStorage.getItem('vecchio-theme');
  if (stored === 'light' || stored === 'dark') root.dataset.theme = stored;
  if (!button) return;
  button.addEventListener('click', () => {
    const current = root.dataset.theme;
    let next;
    if (current === 'light') next = 'dark';
    else if (current === 'dark') next = 'light';
    else next = matchMedia('(prefers-color-scheme: dark)').matches ? 'light' : 'dark';
    root.dataset.theme = next;
    localStorage.setItem('vecchio-theme', next);
  });
})();
