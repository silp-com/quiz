require "spec_helper.rb"

describe JobUpdaterController do
  its "update_job action" do
    updater = double()
    allow(updater).to receive(:perform).and_return { "SUCCESS" }
    get 'update_job'
    expect(response).to == ""
  end
end