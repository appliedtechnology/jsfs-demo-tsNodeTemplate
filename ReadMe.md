# Salt Node with TypeScript Template

This repository sets up a project as described in the [precourse material on TypeScript](https://precourse.salt.study/blogs/0302-typescript#programming-typescript). I've used it to copy and paste from during conversion of the repositories of the JSFS-course, but realized that it can be useful for anyone that wants to get started.

It only contains what you need to get started with development with TypeScript, Salt-style.

## Manual setup

You can set it up in a new directory, by using these commands:

```bash
npm init --yes
npm i -D typescript ts-node mocha
npm i -D @tsconfig/node16 @types/mocha @types/node eslint-config-salt-typescript
mkdir src
touch src/index.ts
touch src/index.test.ts

echo "{
  \"extends\": \"@tsconfig/node16/tsconfig.json\",
  \"compilerOptions\": {
    \"outDir\": \"dist\"
  },
  \"include\": [\"src\"],
  \"exclude\": [\"node_modules\"]
}" > tsconfig.json

echo "{
  \"extends\": \"salt-typescript\",
  \"parserOptions\": {
    \"project\": \"tsconfig.json\"
  }
}
" > .estlintrc

npx scradd . "test" "mocha -r ts-node/register src/**/*.test.ts" -o
npx scradd . dev "ts-node src/index.ts"
npx scradd . build tsc
npx scradd . lint "eslint ./src/**/*.ts"
npx gitignore node
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

