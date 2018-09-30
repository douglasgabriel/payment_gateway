'use strict';

var path = require('path');
var MiniCssExtractPlugin = require("mini-css-extract-plugin");
var webpack = require('webpack');

function join(dest) { return path.resolve(__dirname, dest); }

function web(dest) { return join('web/static/' + dest); }

var config = module.exports = {
  entry: web("js/app.js"),
  output: {
    path: join('priv/static/js'),
    filename: "app.js"
  },
  resolveLoader: {
    modules: [path.join(__dirname, 'node_modules')]
  },
  resolve: {
    extensions: ['.js', '.sass', '.css'],
    modules: ['apps/ui/node_modules']
  },

  module: {
    noParse: /vendor\/phoenix/,
    rules: [
      {
        test: /\.js$/,
        exclude: /node_modules/,
        loader: 'babel-loader',
        options: {
          cacheDirectory: true,
          plugins: ['transform-decorators-legacy'],
          presets: ['react', 'es2015', 'stage-2', 'stage-0'],
        },
      },
      {
        test: /\.(sa|sc|c)ss$/,
        use: [
          MiniCssExtractPlugin.loader,
          'css-loader',
          'sass-loader',
        ],
      }
    ],
  },

  plugins: [
    new MiniCssExtractPlugin('./web/static/css/application.css'),
  ],
};

if (process.env.NODE_ENV === 'production') {
  config.plugins.push(
    new webpack.optimize.DedupePlugin(),
    new webpack.optimize.UglifyJsPlugin({ minimize: true })
  );
}