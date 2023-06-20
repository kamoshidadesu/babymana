const { environment } = require('@rails/webpacker')

//ここから(slick導入に際してのwebpackの記述)
const webpack = require('webpack')
environment.plugins.append(
  'Provide',
  new webpack.ProvidePlugin({
    $: 'jquery/src/jquery',
    jQuery: 'jquery/src/jquery'
  })
)
//ここまでを追加
module.exports = environment
