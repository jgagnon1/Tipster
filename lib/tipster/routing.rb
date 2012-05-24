module Tipster
    module Routing
        module MapperExtensions
            def contextual_tips
                @set.add_route("tipster/:id/:action", {:controller => :tipster})
            end
        end
    end
end

ActionController::Routing::RouteSet::Mapper.send :include, Tipster::Routing::MapperExtensions
