# encoding: utf-8

class PatientsController < ApplicationController  
  def index
    @patients = Patient.all
  end

  def show
    @patient = Patient.find(params[:id])
    @comment = @patient.comments.new
  end

  def new
    @patient = Patient.new
  end

  def edit    
    @patient = Patient.find(params[:id])    
  end  

  def create    
    @patient = Patient.new(params[:patient])    
    
    # Crafting patient's full name
    @patient.full_name = [@patient.last_name, @patient.first_name, @patient.middle_name].join(" ") 
    
    # Creating an empty teeth_chart for new patient
    @patient.create_teeth_chart if @patient.teeth_chart.nil?
    
    if @patient.save
      redirect_to(@patient, :notice => "Пациент был успешно добавлен.")
    else
      render :action => "new"
    end
  end

  def update
    @patient = Patient.find(params[:id])
    
    # Crafting patient's full name unless it's a profile file update
    if params[:patient][:first_name]
      @patient.full_name = [params[:patient][:last_name], params[:patient][:first_name], params[:patient][:middle_name]].join(" ")
    end
    
    if @patient.update_attributes(params[:patient])
      redirect_to(@patient, :notice => "Данные о пациенте были успешно изменены.")
    else
      render :action => "edit"
    end
  end

  def destroy
    @patient = Patient.find(params[:id])
    
    if @patient.destroy
      redirect_to patients_url
    end
  end
  
end