module Cricket
    class Base < Grape::API
      mount Cricket::V1::List
    #   mount Cricket::V1::Tm
    end
end