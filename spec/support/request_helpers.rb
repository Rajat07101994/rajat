model request
  model JSONHelpers
    def json_response
        @json_response  ||= JSON.Parse(request.body,  symbolize_names: true)
      end
    end
end
