# tap – Repository Index

All repositories for the **tap** project.

---

## tap-meta

- **Type**: Meta (docs-only)
- **GitHub**: [taufik-adinugraha/tap-meta](https://github.com/taufik-adinugraha/tap-meta)
- **Purpose**: Project-level AI context, repo index, integration test coordination
- **Stack**: Markdown docs, Docker Compose test stack
- **Deploy target**: N/A (docs only)
- **Relationships**: References `tap-web` in integration tests

---

## tap-web

- **Type**: Web (frontend)
- **GitHub**: [taufik-adinugraha/tap-web](https://github.com/taufik-adinugraha/tap-web)
- **Purpose**: Single-page promotional site for shirt product
- **Stack**: Next.js 14 (App Router), React, TypeScript, Tailwind CSS
- **Deploy target**: Vercel (production + preview)
- **Monitoring**: Sentry
- **Relationships**: Standalone – no API dependencies
- **CI**: `.github/workflows/ci.yml` runs lint, type-check, build on every PR

---

## Architecture summary

```
┌─────────────┐
│   tap-web   │  Next.js single-page site
│  (Vercel)   │  /
└─────────────┘
```

This is a **single-service project**. The web repo contains all frontend logic, content, and styling. No backend or API services are required.
