class DoctorsController < ApplicationController
  def index
    @doctors = Doctor.all    
  end

  def show
    @doctor = Doctor.find(params[:id])

    respond_to do |format|
      format.xml  { render :xml => @doctor }
    end
  end

  def new
    @doctor = Doctor.new
  end

  def edit
    @doctor = Doctor.find(params[:id])
  end

  def create
    @doctor = Doctor.new(params[:doctor])
    
    if @doctor.save
      redirect_to(doctors_url, :flash => { :updated_id => @doctor.id }, :notice => "Doctor was successfully created.")
    else
      render :action => "new"
    end
  end

  def update
    @doctor = Doctor.find(params[:id])
    
    if @doctor.update_attributes(params[:doctor])
      redirect_to(doctors_url, :flash => { :updated_id => @doctor.id }, :notice => "Doctor was successfully updated.")
    else
      render :action => "edit"
    end    
  end

  def destroy
    @doctor = Doctor.find(params[:id])
    
    if @doctor.destroy
      redirect_to(doctors_url)
    end
  end
end
