# Salt Node with TypeScript Template

This repository sets up a project as described in the [precourse material on TypeScript](https://precourse.salt.study/blogs/0302-typescript#programming-typescript). I've used it to copy and paste from during conversion of the repositories of the JSFS-course, but realized that it can be useful for anyone that wants to get started.

It only contains what you need to get started with development with TypeScript, Salt-style.

## Manual setup

You can set it up in a new directory, by using these commands:

```bash
npm init --yes
npm i -D typescript ts-node mocha
npm i -D @types/mocha @types/node eslint-config-salt-typescript
mkdir src
touch src/index.ts
touch src/index.test.ts

echo "{
  \"compilerOptions\": {
    \"module\": \"NodeNext\",
    \"moduleResolution\": \"NodeNext\",
    \"sourceMap\": true,
    \"target\": \"ES2015\",
    \"outDir\": \"dist\"
  },
  \"include\": [\"src\"],
  \"exclude\": [\"node_modules\"],
}" > tsconfig.json

echo "{
  \"extends\": \"salt-typescript\",
  \"parserOptions\": {
    \"project\": \"tsconfig.json\"
  }
}" > .eslintrc

npx --yes scradd . "test" "mocha -r ts-node/register src/**/*.test.ts" -o
npx --yes scradd . dev "ts-node ./src/index.ts"
npx --yes scradd . build "tsc ./src/index.ts"
npx --yes scradd . lint "eslint ./src/**/*.ts"
npx --yes gitignore node
```

## Verifying setup

You can then test the commands using

```bash
npm ci # reinstall
npm run test
npm run build
npm run lint
npm run dev
```

These should all work, although they don't do much

