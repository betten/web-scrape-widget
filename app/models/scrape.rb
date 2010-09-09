require 'digest/md5'
class Scrape < ActiveRecord::Base
	after_create :add_uid

    private
	def add_uid
		self.uid = Digest::MD5.hexdigest(self.id.to_s)
		self.save
	end
end
