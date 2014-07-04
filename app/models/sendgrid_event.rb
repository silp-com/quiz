class SendgridEvent

  # http://sendgrid.com/docs/API_Reference/Webhooks/event.html
  def call(event)
    # if category is job_talent_match and event is open or click, track the corresponding event
    # Person::Activity.track!(:opened_talent_match_mail, :person_id => person_id)
    # Person::Activity.track!(:clicked_talent_match_mail, :person_id => person_id)
  end

end