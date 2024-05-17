class API < Grape::API 
    prefix 'api'
    mount Login
    mount PairProgrammingSessions

    rescue_from Grape::Exceptions::ValidationErrors do |e|
        rack_response({
            status: e.status,
            error_msg: e.messsage,
        }.to_json, 400)
    end

    add_swagger_documentation api_version: 'v1'
end