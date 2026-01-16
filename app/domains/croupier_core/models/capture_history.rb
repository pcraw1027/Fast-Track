module Domains
  module CroupierCore
        class CaptureHistory < ApplicationRecord
            enum status: { pending: 0, completed: 1, error: 2 }
            self.table_name = "capture_histories"
        end
   end
end
