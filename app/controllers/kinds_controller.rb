# frozen_string_literal: true

class KindsController < ApplicationController
  def index
    @kinds = Kind.includes(:planet).order(:name)
  end

  def show
    @kind = Kind.find(params[:id])
  end
end
