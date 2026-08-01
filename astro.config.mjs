import { defineConfig } from 'astro/config';
import sitemap from '@astrojs/sitemap';

export default defineConfig({
  site: 'https://zero-sub.github.io/the-rpg-blend',
  base: '/the-rpg-blend',
  integrations: [sitemap()],
});
