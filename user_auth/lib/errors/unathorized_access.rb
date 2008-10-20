module UserAuth
  module Errors
    class UnauthorizedAccess < StandardError
      def initialize
        super("You are not authorized to acess this page!")
      end
    end
  end
end