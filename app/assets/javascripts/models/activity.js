var app = app || {};

app.Activity = Backbone.Model.extend({
  defaults: {
    coverImage: 'http://pic.52mxp.com/site/text.png',
    title: '未命名',
    createDate: 'Unknown'
  }
});
