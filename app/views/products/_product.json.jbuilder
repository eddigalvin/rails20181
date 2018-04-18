json.extract! product, :id, :name, :manu, :model, :desc, :procname, :proc_id, :memsize, :mem_id, :hdtype, :hdsize, :hd_id, :osname, :os_id, :vatprice, :image_url, :created_at, :updated_at
json.url product_url(product, format: :json)
