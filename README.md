React Lite Coder
----

Code Editor and Code Viewer of jianliao.com

Demo http://ui.talk.ai/react-lite-coder/

### Usage

### Develop

```text
npm i
```

You need a static file server for the HTML files. Personally I suggest using Nginx.

Develop:

```bash
gulp html # regenerate index.html
webpack-dev-server --hot # enable live-reloading
```

Build (Pack and optimize js, reivision js and add entry in `index.html`):

```bash
gulp build
```

### License

MIT
