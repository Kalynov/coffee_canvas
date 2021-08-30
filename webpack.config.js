const path = require('path');
const HtmlWebpackPlugin = require('html-webpack-plugin');

module.exports = {
    mode: 'production',
    entry: './src/index.coffee',
    plugins: [
        new HtmlWebpackPlugin({
            title: 'Output Management',
        }),
    ],
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
        {
            test: /\.html?$/,
            use: ['raw-loader'],
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