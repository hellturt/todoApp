class Task < ApplicationRecord
	belongs_to :user

	auto_html_for :content do
	    html_escape
	    image
	    vimeo(width: '100%', height: 250 )
	    youtube(width: '100%', height: 250 )
	    link target: '_blank', rel: 'nofollow'
	    simple_format
	  end
end
