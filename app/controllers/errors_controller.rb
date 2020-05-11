# frozen_string_literal: true

# Handles errors
class ErrorsController < ApplicationController
  respond_to :html

  # 401
  def unauthorized
    render 'errors/unauthorized', status: :unauthorized
  end

  # 403
  def forbidden
    render 'errors/forbidden', status: :forbidden
  end

  # 404
  def not_found
    render 'errors/not_found', status: :not_found
  end

  # 422
  def rejected
    render 'errors/rejected', status: :unprocessable_entity
  end

  # 500
  def internal_server_error
    render 'errors/internal_server_error', status: :internal_server_error
  end
end