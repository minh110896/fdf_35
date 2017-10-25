class Admin::SuggestsController < ApplicationController
  before_action :load_suggest, only: %i(destroy show)

  def index
    @suggests = Suggest.order_iduser.paginate(page: params[:page],
      per_page: Settings.suggest.per_page)
  end

  def show; end

  def destroy
    if @suggest.destroy
      UserMailer.mailer_suggest(@suggest).deliver_now
      flash[:success] = t "admin.deleted"
    else
      flash[:warning] = t "admin.notdelete"
    end
    redirect_to admin_suggests_path
  end

  private

  def suggest_params
    params.require(:suggest).permit(:content, :user_id)
  end

  def load_suggest
    @suggest = Suggest.find_by id: params[:id]
    return if @suggest
    flash[:warning] = t "users_controller.errorss"
    redirect_to admin_products_path
  end
end
