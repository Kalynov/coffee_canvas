const path = require('path');

module.exports = {
    mode: 'development',
    entry: './src/index.coffee',
    output: {
        filename: 'index.js',
    },
    module: {
      rules: [
        {
          test: /\.coffee$/,
          loader: "coffee-loader",
          options: {
            bare: false,
            transpile: {
              presets: ["@babel/env"],
            },
          },
        },
      ],
    },
    devServer: {
        port: 4200,
        static: path.join(__dirname, 'public'),
        hot: true,
        allowedHosts: 'auto',
        bonjour: true,
      },
  };