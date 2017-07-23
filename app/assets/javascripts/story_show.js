var Story = function(attributes) {
  this.id = attributes.id;
  this.title = attributes.title;
  this.content = attributes.content;
  this.slug = attributes.slug;
  this.created_at = attributes.created_at;
  this.comments = attributes.comments;
  this.user = attributes.user;
};

Story.prototype.renderStory = function() {
  var text = "";
  text = '<h2 class="blog-post-title">' + this.title + '</h2>';
  text += '<p class="blog-post-meta">' + 'by' + ' ' + this.user.username + ' ' +'-' + ' ' + this.created_at + ' ' + '</p>';
  text += '<p class="blog-post-content">' + this.content + '</p>';
  return text;
};

var getStory = function() {
    $.ajax({
      url: this.href,
      method: "GET",
      dataType: "json",
    }).success(function(json){
      var story = new Story(json)
      var renderStory = story.renderStory();
      $("#showstory").append(renderStory);
    })
}
  
$(document).ready(function() {
  getStory();
})

