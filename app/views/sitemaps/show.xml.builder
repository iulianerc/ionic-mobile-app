xml.instruct!
xml.urlset xmlns: "http://www.sitemaps.org/schemas/sitemap/0.9" do
  @records.find_each do |record|
    xml.url do
      xml.loc client_url([params[:id], record.to_param].join("/"))
      xml.lastmod record.updated_at.to_fs(:w3c)
    end
  end
end
