class Account < ActiveRecord::Base
  has_many :users
  has_many :recurrences
  
  def load_recurrence_templates
    # clear existing recurrences
    self.recurrences.destroy_all
    # load from templates
    blog_templates = JSON.parse(TEMPLATES['small_blog_post_template'])
    blog_templates.each do |template|
      @recurrence = (Object.const_get template['type']).new
      @recurrence.account_id = self.id
      @recurrence.event_class_name = BlogPost.to_s
      @recurrence.schedule = template['schedule'].to_json
      @recurrence.event_count = template['count']
      @recurrence.start_at = Date.today
      @recurrence.save
    end
    tweet_templates = JSON.parse(TEMPLATES['small_tweet_template'])
    tweet_templates.each do |template|
      @recurrence = (Object.const_get template['type']).new
      @recurrence.account_id = self.id
      @recurrence.event_class_name = Tweet.to_s
      @recurrence.schedule = template['schedule'].to_json
      @recurrence.event_count = template['count']
      @recurrence.start_at = Date.today
      @recurrence.save
    end
  end
end
