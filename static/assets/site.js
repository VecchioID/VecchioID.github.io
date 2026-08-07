(() => {
  const root = document.documentElement;
  const button = document.getElementById('theme-toggle');
  const stored = localStorage.getItem('vecchio-theme');
  if (stored === 'light' || stored === 'dark') root.dataset.theme = stored;

  if (button) {
    button.addEventListener('click', () => {
      const current = root.dataset.theme;
      let next;
      if (current === 'light') next = 'dark';
      else if (current === 'dark') next = 'light';
      else next = matchMedia('(prefers-color-scheme: dark)').matches ? 'light' : 'dark';
      root.dataset.theme = next;
      localStorage.setItem('vecchio-theme', next);
    });
  }

  const article = document.querySelector('.article-body');
  const progress = document.getElementById('reading-progress');
  if (article && progress) {
    const updateProgress = () => {
      const start = article.getBoundingClientRect().top + window.scrollY;
      const end = start + article.offsetHeight - window.innerHeight;
      const ratio = end <= start ? 1 : Math.min(1, Math.max(0, (window.scrollY - start) / (end - start)));
      progress.style.transform = `scaleX(${ratio})`;
      progress.classList.add('visible');
    };
    updateProgress();
    addEventListener('scroll', updateProgress, { passive: true });
    addEventListener('resize', updateProgress);
  }

  document.querySelectorAll('.prose pre').forEach((pre) => {
    const btn = document.createElement('button');
    btn.className = 'copy-code';
    btn.type = 'button';
    btn.textContent = 'Copy';
    btn.addEventListener('click', async () => {
      const code = pre.querySelector('code')?.innerText ?? pre.innerText;
      await navigator.clipboard.writeText(code);
      btn.textContent = 'Copied';
      setTimeout(() => { btn.textContent = 'Copy'; }, 1200);
    });
    pre.appendChild(btn);
  });
})();
