class PairProgrammingSessions < Grape::API 
    helpers APIHelpers::AuthenticationHelper
    before { restrict_access_to_developers }
    before { authenticate! }

    format :json

    desc 'End-points for the PairProgrammingSessions'
    namespace :pair_programming_sessions do 
        desc 'Retrieve the pair programming sessions'
        params do 
            requires :token, type: String, desc: 'token'
        end
        get do 
            sessions = PairProgrammingSession.where { (host_user = my{current_user}) | (visitor_user == my{current_user}) }
            # debugger
            # sessions = sessions.includes(:project, :host_user, :visitor_user, reviews: [:code_samples, :user])
            present sessions, with: Entities::PairProgrammingSessionsEntity
        end
    end
end