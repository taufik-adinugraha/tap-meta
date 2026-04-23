# tap – Project Context for AI

## Purpose

**tap** is a single-page promotional website showcasing a shirt product. The project is designed to be minimal, fast, and visually engaging – a focused landing page that highlights the shirt with compelling imagery, product details, and a clear call-to-action.

## Project structure

This is a **meta repository** that holds project-level documentation and coordination files. The actual web application lives in the `tap-web` repo.

- **tap-meta** (this repo) — project-level AI context, repo index, integration test setup
- **tap-web** — Next.js single-page site with product showcase, optimized images, and responsive design

## Stack overview

- **Frontend**: Next.js 14 (App Router), React, TypeScript, Tailwind CSS
- **Hosting**: Vercel (via GitHub integration)
- **Monitoring**: Sentry for error tracking

## Key patterns

- **Single-page focus**: All content lives on one route (`/`). No complex routing or navigation.
- **Image optimization**: Product photos are served via Next.js Image component for automatic optimization and responsive loading.
- **Mobile-first**: Design prioritizes mobile experience, progressively enhancing for larger screens.
- **Fast load times**: Minimal JavaScript, optimized assets, CDN delivery.

## Development workflow

1. Changes land in feature branches in `tap-web`
2. CI runs lint + type-check + build on every PR
3. Vercel preview deployments provide live URLs for review
4. Merge to main triggers production deploy
5. Sentry captures any runtime errors in production

## Integration testing

The `devos-integration/` folder contains an optional multi-repo test stack for end-to-end smoke tests. Since this project has only one service (web), the integration tests are minimal – they verify the page loads, key elements render, and no JavaScript errors occur.

Run integration tests:

```bash
cd devos-integration
docker compose -f docker-compose.test.yml up --build --exit-code-from test-runner
```

DevOS (Forge) uses this stack to validate changes across the project before merging.

## Error monitoring

Sentry is initialized in `tap-web` via Next.js instrumentation hooks. All unhandled errors and promise rejections are captured automatically. Check the Sentry dashboard for alerts.

## Key files in this repo

- `CLAUDE.md` (this file) — AI context for the project
- `repos.md` — index of all repos with stack, deploy targets, and relationships
- `README.md` — human-readable project overview and setup guide
- `devos-integration/docker-compose.test.yml` — multi-repo test stack
- `devos-integration/test.sh` — integration test script (smoke tests)

## Do not touch

- `.github/workflows/` in service repos — CI config managed by DevOS
- `devos-integration/` structure — DevOS relies on this shape

## Related repos

- [tap-web](https://github.com/taufik-adinugraha/tap-web) — Next.js single-page site
