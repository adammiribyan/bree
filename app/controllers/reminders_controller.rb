class RemindersController < ApplicationController
  def index
    @birthdays = Patient.has_birthday_today
    @inspections = Patient.require_inspection   
  end

end
