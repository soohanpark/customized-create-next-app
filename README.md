# Customized create-next-app

Customized [create-next-app](https://github.com/vercel/next.js).

Remove some unnecessary files and add somthing to need. (such as `_document.tsx`)

## Getting Started

> **Caution!**
> This repository is intended for personal use.
> Anyone is free to use it, but all settings may not be perfect or suitable for every situation.

These instructions will get you a copy of the project up and running on your local machine for development and testing purposes. See deployment for notes on how to deploy the project on a live system.

### Prerequisites

First, just clone it!

```bash
git clone https://github.com/Soohan-Park/customized-create-next-app.git
# Or `gh repo clone Soohan-Park/customized-create-next-app`
```

And, you need to `yarn` package manager. (If you don't want it, you can using `npm`.)

```bash
npm install -g yarn
```

### Installing

Install dependencies.

```bash
yarn
```

And you did all what you need. Just run!

```bash
yarn start # Or `yarn dev`
```

**(Optional) If you need a Custom Server on NextJS, please check [this document](https://nextjs.org/docs/advanced-features/custom-server) and follow instruction below.**

Let's start to making a Custom Server on NextJS!

You need to install more packages like below.

```bash
yarn add express ts-node
yarn add --dev @types/express
```

And correct `package.json`.

```json
  ...
  "scripts": {
    "dev": "next dev",
    "build": "next build",
    "start": "next build && NODE_ENV=production ts-node server.ts",  // Here!
    "lint": "next lint"
  },
  ...
```

Also, `tsconfig.json`.

```json
  ...
  },
  "include": ["next-env.d.ts", "**/*.ts", "**/*.tsx"],
  "exclude": ["node_modules"]
  // Activate these lines.
  "ts-node": {
    "transpileOnly": true,
    "compilerOptions": {
      "module": "commonjs"
    }
  }
}
```

Finally, activate `server.ts` file.

```typescript
/**
 * NextJS Custom Server w/ Express
 * If you don't need a server, you can delete this file.
 */

import next from "next";
import express from "express";

// const port = parseInt(process.env.PORT, 10) || 3000;
const port = 3000;
const dev = process.env.NODE_ENV !== "production";
const app = next({ dev });
const handle = app.getRequestHandler();

app.prepare().then(async () => {
  const server = express();

  server.all("*", (req, res) => {
    return handle(req, res);
  });

  server.listen(port, () => {
    console.log(`> Ready on http://localhost:${port}`);
  });
});
```

## Deployment

Recommend [deploying on Vercel](https://nextjs.org/docs/deployment).

## Built With

- [React](https://reactjs.org/) - A JavaScript library for building user interfaces
- [Typescript](https://www.typescriptlang.org/) - TypeScript is JavaScript with syntax for types.
- [Next.js](https://github.com/vercel/next.js) - The React Framework for Production
- [Styled Components](https://styled-components.com/) - Use the best bits of ES6 and CSS to style your apps without stress 💅🏾
- [Express](https://expressjs.com/) - (If you using a server) Node.js Web Application Framework

## Authors

- **Soohan-Park** - _Initial work_ - [SoohanPark](https://github.com/Soohan-Park)

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details
