module ArticlesHelper
	@@comment_list , @@x = '' , 0
	def comment_listing1(comment , x = 0)
		@@comment_list , @@x = '' , 0 if x == 1
		unless comment.parent?
			p_del = comment.replies.present? ? '' : "<span class='delete'> Delete</span>"
			@@comment_list << "<div class='parent'><p>#{comment.body}</p><p><span class='reply'>Reply</span>#{p_del}</p><div>"
		end	
		@@x = @@x + 40 if comment.replies.present?
		comment.replies.each do |reply|
			c_del = reply.replies.present? ? '' : "<span class='delete'>Delete</span>"
			@@comment_list << "<div class='child'><p style='margin-left:"+@@x.to_s+"px;'>#{reply.body}</p><p style='margin-left:"+@@x.to_s+"px;'><span class='reply'>Reply </span>#{ c_del}</p></div>"
			comment_listing reply
		end	
		return @@comment_list.html_safe
	end

	def comment_listing(comment , x = 0)
		@@comment_list = '' if x == 1
		@@comment_list << "<div class='comment' id='comment_#{comment.id}'> <div class='avatar'> <img alt='Avatar' height='64' src='http://gravatar.com/avatar/b0c8c38cef91e576f11477dac92e0e51.png?s=64&amp;d=http%3A%2F%2Frailscasts.com%2Fassets%2Fguest.png' width='64'></div> <div class='actions user_actions'> </div> <div class='main'> <div class='headline'> <span class='name'> <a href='/users/1080'>S</a> </span> <a href='/episodes/417-foundation?view=comments#comment_163908' class='created_at'> about 2 years ago </a> </div> <div class='comment_content'> <p>#{comment.body}</p> <div class='actions'><div class='comment_content'> <p>hfghfgh</p> <div class='actions'> <a href='/comments/new?episode_id=476&amp;parent_id=166100' data-remote='true'>Reply</a> <a href='/comments/166100/edit' data-remote='true'>Edit</a> <a href='/comments/166100' data-method='delete' data-remote='true' rel='nofollow'>Delete</a> </div> </div> </div> </div> </div> <div class='clear'></div> </div><div class='nested_comments'>"
		comment.replies.each do |reply|
			comment_listing reply
		end	
		@@comment_list << "</div>"
		return @@comment_list.html_safe
	end
end
