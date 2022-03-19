ActiveAdmin.register_page "Graph" do
    # redirect("http://localhost:3000/blazer")
    
    action_item :view_site do
      link_to "View Site", "/blazer"
    end

    content do
      para "Click the link to take a look at our statistics"
    end
  end