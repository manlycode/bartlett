module Bartlett
  module Commands
    module AddUser
      USAGE_MESSAGE = <<-MSG
Usage: bart add-user <github_username>
      MSG

      def self.run(args)
        if args.empty?
          puts USAGE_MESSAGE
          return
        end

        # Authorize the user
      end
    end
  end
end
