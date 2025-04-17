const { environment } = require('@rails/webpacker')

const babelLoader = environment.loaders.get('babel')

babelLoader.include = [
  require('path').resolve(__dirname, '../../app/javascript'),
  require('path').resolve(__dirname, '../../node_modules/tom-select') 
]

module.exports = environment
