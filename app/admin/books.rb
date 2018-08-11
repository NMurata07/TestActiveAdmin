ActiveAdmin.register Book do
# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
# permit_params :list, :of, :attributes, :on, :model
#
# or
#
# permit_params do
#   permitted = [:permitted, :attributes]
#   permitted << :other if params[:action] == 'create' && current_user.admin?
#   permitted
# end

  permit_params :title, :isbn, :published_date, author_books_attributes: [:author_id, :_destroy, :id]

  form do |f|
    f.inputs '書籍登録' do
      f.input :title
      f.input :isbn
      f.input :published_date
      f.has_many :author_books, allow_destroy: true, heading: false,
                                new_record: true do |ab|
        ab.input :author_id,
                 label: '著者',
                 as: :select,
                 collection: Author.all.map { |a| [a.name, a.id] }
      end
      f.actions
    end
  end
end
