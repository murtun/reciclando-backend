ActiveAdmin.register Organization do
  permit_params :name
  show title: :name do
    attributes_table do
      rows :name
    end
    panel 'Users' do
      table_for(organization.users) do |_user|
        column(:id) { |user| link_to(user.id, admin_user_path(user)) }
        column(:name, &:name)
        column(:ci, &:ci)
        tr class: 'action_items' do
          td link_to('Crear usuario', new_admin_organization_user_path(organization), class: :button)
        end
      end
    end
  end
end
