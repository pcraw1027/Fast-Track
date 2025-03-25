module ApiV1Routes
  def self.extended(router)
    router.instance_exec do
      namespace :v1 do
        get "/" => "landing#live"
      end
    end
  end
end
