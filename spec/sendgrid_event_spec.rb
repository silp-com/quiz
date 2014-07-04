require "spec_helper"

describe SendgridEvent do
  before(:each) do
    @attributes = {"email" => "test@gmail.com", "arg2" => "2", "arg1" => "1", "category" => "testing"}
  end
  
  it "should accept any event" do
    event = Gridhook::Event.new(@attributes)
  
    se = SendgridEvent.new
    se.call(event)
  end
  
  it "should create track activity" do
    attributes = @attributes.merge('event' => 'open',
                                   "category" => [
                                       "job_talent_match",
                                       "5329a9953a29fd9ba700000c",
                                       "job_talent_match_5329a9953a29fd9ba700000c",
                                       'domestic',
                                       "job_talent_match_domestic",
                                       "person_123456",
                                       "job_talent_match_person_123456"
                                   ])
    event = Gridhook::Event.new(attributes)
              
    Person::Activity.should_receive(:track!).with(:opened_talent_match_mail, :person_id => 123456)
  
    se = SendgridEvent.new
    se.call(event)
  end                                      
  
  it "should create track activity" do
    attributes = @attributes.merge('event' => 'click',
                                   "category" => [
                                       "job_talent_match",
                                       "5329a9953a29fd9ba700000c",
                                       "job_talent_match_5329a9953a29fd9ba700000c",
                                       'domestic',
                                       "job_talent_match_domestic",
                                       "person_123456",
                                       "job_talent_match_person_123456"
                                  ])
    event = Gridhook::Event.new(attributes)
                                   
    Person::Activity.should_receive(:track!).with(:clicked_talent_match_mail, :person_id => 123456)
         
    se = SendgridEvent.new
    se.call(event)                       
  end              
end