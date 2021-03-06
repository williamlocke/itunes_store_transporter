require "optout"
require "itunes/store/transporter/command"

module ITunes
  module Store
    module Transporter
      module Command            # :nodoc: all

        ##
        # Upload a package to the iTunes Store
        #
        class Upload < Mode
          def initialize(*config)
            super
            options.on *PACKAGE
            options.on *TRANSPORT
            options.on *SUCCESS
            options.on *FAILURE
            options.on :delete, "-delete", Optout::Boolean
            options.on :rate, "-k", Integer  # Required if TRANSPORT is Aspera or Signiant 
            options.on :log_history, "-loghistory", Optout::Dir.exists
          end
        end
      end
    end
  end
end
