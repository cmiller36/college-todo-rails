$(function(){
  
    $.get(this.href).success(function(json){

      var $stories = $(".stories")
      $stories.html("")
      
      json.forEach(function(story){
        text = '<h2 class="blog-post-title">' + story.title + '</h2>';
        text += '<p class="blog-post-meta">' + 'by' + ' ' + story.user.username + ' ' +'-' + ' ' + story.created_at +
                ' ' + '<span class="badge">' + story.comments_count + ' ' +'comments' + '</span></p>';
        text += '<p>' + story.content.substring(0, 250) + '...';
        text += '<a class="js-story-show" href="/stories/' + story.slug + '">Read More</a></p>';
        $stories.append(text);
      })
   }) 
   
})