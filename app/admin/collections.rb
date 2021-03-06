ActiveAdmin.register Collection do
  menu false
  actions :all, except: %i[edit destroy]

  show title: :id do
    attributes_table do
      rows :id, :created_at
      row('Peso') { |collection| collection.pockets.pluck(:weight).map { |weight| weight || 0 }.sum.round }
      row(:route) { |collection| link_to(collection.route.id, admin_route_path(collection.route.id)) }
    end
  end
end
