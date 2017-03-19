class Site::Profile::AdsController < Site::ProfileController
    def index
      @ads = Ad.where(member_id: current_member.id)
    end
end
