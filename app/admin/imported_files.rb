ActiveAdmin.register ImportedFile do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  # permit_params :title, :avatar, :post_id
  #
  # or
  #
  # permit_params do
  #   permitted = [:title, :avatar, :post_id]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
  
  index do 
    column :id
    column :title
    actions do |file|
      item "Download", rails_blob_path(file.avatar), class: "member_link"
    end
  end

  show do 
    render "show_partial", {imported_file: imported_file}
  end
end
