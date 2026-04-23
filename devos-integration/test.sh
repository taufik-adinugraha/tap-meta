#!/bin/sh
set -e

echo "==> Running integration tests for tap"
echo ""

WEB_URL=${WEB_URL:-http://web:3000}

echo "[1/3] Smoke test: GET $WEB_URL"
STATUS=$(curl -s -o /dev/null -w "%{http_code}" "$WEB_URL")
if [ "$STATUS" -ne 200 ]; then
  echo "❌ FAIL: Expected 200, got $STATUS"
  exit 1
fi
echo "✅ PASS: Got 200 OK"
echo ""

echo "[2/3] Check page contains expected content"
BODY=$(curl -s "$WEB_URL")
if echo "$BODY" | grep -q "<html"; then
  echo "✅ PASS: HTML content present"
else
  echo "❌ FAIL: No HTML content found"
  exit 1
fi
echo ""

echo "[3/3] Check Next.js scripts loaded (no 500 errors)"
if echo "$BODY" | grep -q "/_next/"; then
  echo "✅ PASS: Next.js scripts referenced"
else
  echo "⚠️  WARN: No Next.js script tags found (may be static)"
fi
echo ""

echo "==> All integration tests passed ✅"
exit 0
