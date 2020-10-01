ActiveAdmin.register Post do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  permit_params :title, :description
  
   active_admin_import  validate: false,
                        batch_size: 1000,
                        before_batch_import: lambda { |importer|
                        importer.batch_slice_columns(Post.column_names)
                      },
                        after_import: proc{ |import|
                           ImportedFile.create(title: import.file.original_filename, avatar: import.file)
                        },
                        back: {action: 'index',controller: 'admin/imported_files'}
  
end
