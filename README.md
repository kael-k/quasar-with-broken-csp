# Quasar App with broken CSP demo

## This repo
Contains a really basic quasar project, which is actually the auto-generated one.
I only changed `src/components/ExampleComponent.vue` in order to have a `QSelect` instance

## The issue
Built code breaks `Content-Security-Policy` rules: clicking on `QSelect` will generate an error with CSP:

> Refused to apply inline style because it violates the following Content Security Policy
> directive: "default-src 'self'". Either the 'unsafe-inline' keyword, a hash ('sha256-47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU='),
> or a nonce ('nonce-...') is required to enable inline execution.
> Note also that 'style-src' was not explicitly set, so 'default-src' is used as a fallback.

## The cause
Reversing the code I understood that when the user click on QSelect,
it will trigger `useVirtualScroll` from `quasar/src/components/virtual-scroll/use-virtual-scroll.js` which eventually
will trigger `setOverflowAnchor`.

`setOverflowAnchor` will add a `style` element to the DOM and try to add some rules,
which obviously will make the browser angry (because of the CSP).

## How to reproduce
1. start the app by building and running the Dockerfile (or build it yourself and run in a web server which sets the at least the CSP `style-src` "self"`)
2. click on the QSelect
