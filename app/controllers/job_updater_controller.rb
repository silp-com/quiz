require 'branding/job_updater'

class JobUpdaterController < ApplicationController
  def update_job
    Branding::JobUpdater.perform_async
  end
end
