# tap

> Single-page promotional site for my shirt

A minimal, fast, and visually engaging landing page showcasing a shirt product. Built with Next.js and optimized for performance and mobile experience.

---

## Project structure

This is the **meta repository** for project-level documentation and integration testing.

- **[tap-web](https://github.com/taufik-adinugraha/tap-web)** — Next.js single-page site (production site)

See [repos.md](./repos.md) for the full repository index.

---

## Quick start (for contributors)

### Prerequisites

- Node.js 20+
- Docker + Docker Compose (for integration tests)

### Local development

1. Clone the web repo:

   ```bash
   git clone https://github.com/taufik-adinugraha/tap-web.git
   cd tap-web
   ```

2. Install dependencies:

   ```bash
   npm install
   ```

3. Run the dev server:

   ```bash
   npm run dev
   ```

4. Open [http://localhost:3000](http://localhost:3000)

See the [tap-web README](https://github.com/taufik-adinugraha/tap-web/blob/main/README.md) for full setup instructions.

---

## Integration tests

The `devos-integration/` folder contains an optional multi-repo test stack for end-to-end smoke tests.

### Run integration tests locally

```bash
cd devos-integration
docker compose -f docker-compose.test.yml up --build --exit-code-from test-runner
```

This starts:

- `web` service (Next.js site)
- `test-runner` service (smoke tests with curl)

Tests verify the page loads and returns 200 OK. Exit code 0 = pass, non-zero = fail.

### DevOS integration

DevOS (Forge) uses this stack to validate changes across the project before merging. The `test-runner` service runs `devos-integration/test.sh` after all services are healthy.

---

## CI / CD

- **CI**: `.github/workflows/ci.yml` in `tap-web` runs lint, type-check, and build on every PR
- **Deploy**: Vercel (via GitHub integration) deploys main → production, PRs → preview URLs
- **Monitoring**: Sentry captures runtime errors in production

---

## Stack

- **Frontend**: Next.js 14 (App Router), React, TypeScript, Tailwind CSS
- **Hosting**: Vercel
- **Monitoring**: Sentry

---

## Links

- [Project context (AI)](./CLAUDE.md)
- [Repository index](./repos.md)
- [tap-web README](https://github.com/taufik-adinugraha/tap-web/blob/main/README.md)

---

**Maintainer**: taufik-adinugraha  
**License**: MIT (or your choice)
