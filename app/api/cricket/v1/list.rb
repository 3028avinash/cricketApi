module Cricket
  module V1
    class List < Grape::API
      include Cricket::V1::Defaults



      ##################################################################
      # => V1 User-Profile-API
      ##################################################################
      resource :userProfile do
        desc " User Profile API"
        before {api_params}

        params do
          requires :userId, type: String, allow_blank: false
          requires :securityToken, type: String, allow_blank: false
          requires :versionName, type: String, allow_blank: false
          requires :versionCode, type: String, allow_blank: false
          optional :userName, type: String, allow_blank: false
          optional :userEmail, type: String, allow_blank: false
          optional :mobileNumber, type: String, allow_blank: false
          optional :gender, type: String, allow_blank: false
          optional :location, type: String, allow_blank: false
          optional :occupation, type: String, allow_blank: false
          optional :birthDate, type: String, allow_blank: false
          optional :profilePic, type: String, allow_blank: false
          optional :actionType, type: String, allow_blank: false #(get/post)
        end

        post do
          begin
            user = User.find(params[:userId]) #valid_user(params['userId'].to_i, params['securityToken'])
            if user
              if params['actionType'] == 'post'
                user_profile = UserProfile.where(user_id: user.id).first_or_initialize
                if user_profile.new_record?
                  user_profile.update(name: user.socialName, email: user.socialEmail, mobile: params['mobileNumber'], gender: params['gender'], location: params['location'], occupation: params['occupation'], source_ip: request.location.ip, birthDate: params['birthDate'], profile_pic: user.socialmgUrl)
                else
                  user_profile.update(mobile: (params[:mobileNumber].nil? ? user_profile.mobile : params[:mobileNumber] ), 
                    gender: (params[:gender].nil? ? user_profile.gender : params[:gender] ), 
                    location: (params[:location].nil? ? user_profile.location : params[:location] ), 
                    occupation: (params[:occupation].nil? ? user_profile.occupation : params[:occupation] ))
                end
                {message: MSG_SUCCESS, status: 200, msg: 'User Profile Submitted.'}
              else
                user_profile = UserProfile.where(user_id: user.id).first
                if user_profile
                  {message: MSG_SUCCESS, status: 200, userName: user_profile.name, userEmail: user_profile.email, mobileNumber: user_profile.mobile.to_s, gender: user_profile.gender.to_s, location: user_profile.location.to_s, occupation: user_profile.occupation.to_s, birthDate: user_profile.birthDate.to_s, profilePic: user_profile.profile_pic}
                else
                  {message: MSG_SUCCESS, status: 200, userName: user.socialName, userEmail: user.socialEmail, mobileNumber: '', gender:'', location: '', occupation: '', birthDate: '', socialImgUrl: user.socialmgUrl}
                end
              end
            else
             {message: INVALID_USER, status: 500}
            end

          rescue Exception => e
            logger.info "API Exception-#{Time.now}-userProfile-#{params.inspect}-Error-#{e}"
            {message: MSG_ERROR, status: 500}
          end
        end
      end




        ##################################################################
        # => Top Fantasy App List
        ##################################################################

        resource :fantasy do
          desc "Fantasy App List -API"
          before {api_params}
          params do
            #  requires :ip, type: String, allow_blank: false
            #  requires :coin, type: String, allow_blank: false
            #  requires :user_id, type: String, allow_blank: false
            #  requires :user_id, type: String, allow_blank: false

             # requires :versionName, type: String, allow_blank: false
            # requires :versionCode, type: String, allow_blank: false
          end
          post do
            begin
              if true
                fantasy = Fantasy.select('id','title', 'logo', 'link', 'refrelCode', 'signUpBonus', 'Withdraw', 'withdrawType')

                {message: MSG_SUCCESS, status: 200, fantasy: fantasy}
              else
                {message: INVALID_USER, status: 500}
              end
            rescue Exception => e
              logger.info "API Exception-#{Time.now}-appInvite-#{params.inspect}-Error-#{e}"
              {message: MSG_ERROR, status: 500}
            end
          end
        end


        ##################################################################
        # => Task Detail Offer
        ##################################################################

        resource :taskDetails do
          desc "Task Details-API"
          before {api_params}
          params do
             requires :taskId, type: String, allow_blank: false
            #  requires :coin, type: String, allow_blank: false
            #  requires :user_id, type: String, allow_blank: false
            #  requires :user_id, type: String, allow_blank: false

             # requires :versionName, type: String, allow_blank: false
            # requires :versionCode, type: String, allow_blank: false
          end
          post do
            begin
              if params[:taskId].present?
                task = TaskOffer.select(:id, :title, :tasks, :titleImg, :link,:point,:steps, :termsCondition).find(params[:taskId])


                {message: MSG_SUCCESS, status: 200, taskDetails: task}
              else
                {message: INVALID_USER, status: 500}
              end
            rescue Exception => e
              logger.info "API Exception-#{Time.now}-appInvite-#{params.inspect}-Error-#{e}"
              {message: MSG_ERROR, status: 500}
            end
          end
        end





        ##################################################################
        # => GeoCoder
        ##################################################################

        resource :geo do
          desc "GeoCoder-API"
          before {api_params}
          params do
            #  requires :ip, type: String, allow_blank: false
            #  requires :coin, type: String, allow_blank: false
             requires :user_id, type: String, allow_blank: false
            #  requires :user_id, type: String, allow_blank: false

             # requires :versionName, type: String, allow_blank: false
            # requires :versionCode, type: String, allow_blank: false
          end
          post do
            begin
              @user = User.find params[:user_id]
              if @user
                # params[:ip].present?
                # @user.ip_address = request.ip
                # @user.save!
                results = request.location
                # Geocoder.search(request.ip)
                # @user.address=results.city
                # request.remote_ip
                # results.first.coordinates

                {message: MSG_SUCCESS, status: 200, results: results}
              else
                {message: INVALID_USER, status: 500}
              end
            rescue Exception => e
              logger.info "API Exception-#{Time.now}-appInvite-#{params.inspect}-Error-#{e}"
              {message: MSG_ERROR, status: 500}
            end
          end
        end




        ##################################################################
        # => point_history
        ##################################################################

        resource :point_his do
          desc "point_history-API"
          before {api_params}
          params do
             requires :account_id, type: String, allow_blank: false
            #  requires :coin, type: String, allow_blank: false
            #  requires :user_id, type: String, allow_blank: false
            #  requires :user_id, type: String, allow_blank: false

             # requires :versionName, type: String, allow_blank: false
            # requires :versionCode, type: String, allow_blank: false
          end
          post do
            begin
              @account = Account.find params[:account_id]
              earn = []

              if @account
                # @account.earns.each do |earn|
                  # a = { Title: earn.a, logo: earn.logo, Points: earn.coin,
                  #    earnDate: earn.created_at}
                  # earn << a
                # end

                {message: MSG_SUCCESS, status: 200, EarnHistory: @account.earns.order(created_at: :desc)}
              else
                {message: INVALID_USER, status: 500}
              end
            rescue Exception => e
              logger.info "API Exception-#{Time.now}-appInvite-#{params.inspect}-Error-#{e}"
              {message: MSG_ERROR, status: 500}
            end
          end
        end








        ##################################################################
        # => withdraw_history
        ##################################################################

        resource :with_his do
          desc "withdraw_history-API"
          before {api_params}
          params do
             requires :account_id, type: String, allow_blank: false
            #  requires :coin, type: String, allow_blank: false
            #  requires :user_id, type: String, allow_blank: false
            #  requires :user_id, type: String, allow_blank: false

             # requires :versionName, type: String, allow_blank: false
            # requires :versionCode, type: String, allow_blank: false
          end
          post do
            begin
              @account = Account.find params[:account_id]
              with = []

              if @account
                @account.withdraws.each do |withdraw|
                  a = { transferType: Reward.find(withdraw.reward_id).name+" Wallet Transfer", txn_id: withdraw.txn_id,
                    transferAmount: withdraw.coin_amount, transferCoin: withdraw.coin,
                     withdraw_date: withdraw.created_at, logo: Reward.find(withdraw.reward_id).logo,}
                  with << a
                end

                {message: MSG_SUCCESS, status: 200, History: with}
              else
                {message: INVALID_USER, status: 500}
              end
            rescue Exception => e
              logger.info "API Exception-#{Time.now}-appInvite-#{params.inspect}-Error-#{e}"
              {message: MSG_ERROR, status: 500}
            end
          end
        end





        ##################################################################
        # => redeem
        ##################################################################

        resource :redeem do
          desc "Redeem-API"
          before {api_params}
          params do
             requires :reward_id, type: String, allow_blank: false
             requires :coin, type: String, allow_blank: false
             requires :account_id, type: String, allow_blank: false
             # requires :versionName, type: String, allow_blank: false
            # requires :versionCode, type: String, allow_blank: false
          end
          post do
            begin
              @reward = Reward.find params[:reward_id]
              @account = Account.find params[:account_id]
              if @account
                if (@account.coin.to_i) > params[:coin].to_i
                withdraw = Withdraw.create(account_id: @account.id, coin: params[:coin], reward_id: params[:reward_id], coin_amount: (params[:coin].to_i)/10, txn_id: SecureRandom.alphanumeric(10))
                @account.coin = @account.coin.to_i - withdraw.coin.to_i
                @account.save!
                else
                withdraw= "Not Enough coin in your account"
                end
                {message: MSG_SUCCESS, status: 200, withdraw: withdraw, balance: @account.coin  }
              else
                {message: INVALID_USER, status: 500}
              end
            rescue Exception => e
              logger.info "API Exception-#{Time.now}-appInvite-#{params.inspect}-Error-#{e}"
              {message: MSG_ERROR, status: 500}
            end
          end
        end






        ##################################################################
        # => rewards
        ##################################################################

        resource :reward do
          desc "Reward-API"
          before {api_params}
          params do
             # requires :account, type: String, allow_blank: false
            #  requires :coin, type: String, allow_blank: false
             # requires :versionName, type: String, allow_blank: false
            # requires :versionCode, type: String, allow_blank: false
          end
          post do
            begin
              @reward = Reward.all
              if true
                rd=[]
                @reward.each do |r|
                  rd << {id: r.id, name: r.name, logo: r.logo, amount: r.amount}
                end

                {message: MSG_SUCCESS, status: 200, reward: rd  }
              else
                {message: INVALID_USER, status: 500}
              end
            rescue Exception => e
              logger.info "API Exception-#{Time.now}-appInvite-#{params.inspect}-Error-#{e}"
              {message: MSG_ERROR, status: 500}
            end
          end
        end



        ##################################################################
        # => earn
        ##################################################################

        resource :earn do
          desc "Earn-API"
          before {api_params}
          params do
            requires :account, type: String, allow_blank: false
            requires :coin, type: String, allow_blank: false
            requires :task, type: String, allow_blank: false
            requires :reward_id, type: String, allow_blank: false
            # requires :versionName, type: String, allow_blank: false
            # requires :versionCode, type: String, allow_blank: false
          end
          post do
            begin
              @account = Account.find params[:account]
              # @task = TaskOffer.find params[:task]
              if @account.present?
                with = Earn.create(coin: params[:coin], account_id: @account.id, name: params[:task], reward_id: params[:reward_id])
                # @account.coin = @account.withdraw.coin
                @account.coin = with.coin.to_i + @account.coin.to_i
                @account.save
                {message: MSG_SUCCESS, status: 200, earn: @account  }
              else
                {message: INVALID_USER, status: 500}
              end
            rescue Exception => e
              logger.info "API Exception-#{Time.now}-appInvite-#{params.inspect}-Error-#{e}"
              {message: MSG_ERROR, status: 500}
            end
          end
        end



        ##################################################################
        # => WITHDRAW
        ##################################################################

      resource :withdraw do
        desc "WITHDRAW-API"
        before {api_params}
        params do
          requires :account, type: String, allow_blank: false
          requires :coin, type: String, allow_blank: false
          # requires :reward_id, type: String, allow_blank: false
          # requires :versionName, type: String, allow_blank: false
          # requires :versionCode, type: String, allow_blank: false
        end
        post do
          begin
            @account = Account.find params[:account]
            if @account.present?
              with = Withdraw.create(coin: params[:coin], account_id: @account.id, txn_id: SecureRandom.alphanumeric(10), coin_amount: params[:coin].to_i/10)
              # @account.coin = @account.withdraw.coin
              @account.coin =  (@account.coin.to_i)-(with.coin.to_i)
              @account.save
            {message: MSG_SUCCESS, status: 200, withdraw: Withdraw.last  }
            else
              {message: INVALID_USER, status: 500}
            end
          rescue Exception => e
           puts "API Exception-#{Time.now}-Withdraw-API-#{params.inspect}-Error-#{e}"
            {message: MSG_ERROR, status: 500}
          end
        end
      end






        ##################################################################
        # => Account
        ##################################################################
        resource :account do
          desc "account-API"
          before {api_params}
          params do
            requires :userId, type: String, allow_blank: false
            requires :securityToken, type: String, allow_blank: false
            requires :versionName, type: String, allow_blank: false
            requires :versionCode, type: String, allow_blank: false
          end
          post do
            begin
              @user = User.find(params[:userId])
              if @user.present?
                if @user.account.present? 
                  acnt=@user.account
                else
                 acnt = @user.account=Account.create(user_id: @user.id, coin: 100, refer_code: SecureRandom.alphanumeric(10)
                )
                end
              {message: MSG_SUCCESS, status: 200, account: acnt  }
              else
                {message: INVALID_USER, status: 500}
              end
            rescue Exception => e
              logger.info "API Exception-#{Time.now}-appInvite-#{params.inspect}-Error-#{e}"
              {message: MSG_ERROR, status: 500}
            end
          end
        end 


        ##################################################################
        # => Invite Page
        ##################################################################
        resource :appInvite do
          desc "Invite Page API"
          before {api_params}
          params do
            requires :userId, type: String, allow_blank: false
            requires :securityToken, type: String, allow_blank: false
            requires :versionName, type: String, allow_blank: false
            requires :versionCode, type: String, allow_blank: false        
          end
          post do
            begin
              @user = User.find(params[:userId])
              if @user.present?
                refer_code = Account.find_by(user_id: @user.id).refer_code
                fburl= "https://www.facebook.com"
                img_url = "https://media.istockphoto.com/id/1197835442/vector/male-hand-holding-megaphone-with-refer-a-friend-speech-bubble-loudspeaker-banner-for.jpg?s=612x612&w=0&k=20&c=vX55M2w9McLyALk61ll5Int5UoAbtK7jsMTsEUO5dAQ="
                {message: MSG_SUCCESS, status: 200, refer_code: refer_code, user_id: @user.id,img_url: img_url  }
              else
                {message: INVALID_USER, status: 500}
              end
            rescue Exception => e
              logger.info "API Exception-#{Time.now}-appInvite-#{params.inspect}-Error-#{e}"
              {message: MSG_ERROR, status: 500}
            end
          end
        end







      #""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
      #==================================App-Open====================================
      #""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


      resource :appOpen do
        desc "App Open API"
        # before {api_params}
        params do
          requires :userId, type: String, allow_blank: false
          # requires :securityToken, type: String, allow_blank: false
          # requires :versionName, type: String, allow_blank: false
          # requires :versionCode, type: String, allow_blank: false
        end
        post do
          begin
            user = User.find(params[:userId])
            if user
              location = request.location
              user.app_opens.new(versionName: params['versionName'],location: location.city, source_ip: location.ip, versionCode: params['versionCode']).save!
              {message: MSG_SUCCESS, status: 200 }
            else
              {message: INVALID_USER, status: 500}
            end
          rescue Exception => e
            logger.info "API Exception-#{Time.now}-appOpen-#{params.inspect}-Error-#{e}"
            {message: MSG_ERROR, status: 500}
          end
        end
      end




#"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""" #===================================Sign-Up====================================
#""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

      resource :signup do
        desc "Signup API"
        before {api_params}
        params do
          optional :refrelCode, type: String, allow_blank: false
          # requires :socialType, type: String, allow_blank: false
          # requires :socialId, type: String, allow_blank: false
          requires :versionName, type: String, allow_blank: false
          requires :versionCode, type: String, allow_blank: false
          # requires :userId, type: String, allow_blank: false
          # optional :deviceType, type: String, allow_blank: true
          # optional :deviceName, type: String, allow_blank: true       
          # requires :socialToken, type: String, allow_blank: false
          requires :socialEmail, type: String, allow_blank: false
          # requires :socialName, type: String, allow_blank: false
          # requires :socialmgUrl, type: String, allow_blank: false
          # requires :advertisingId, type: String, allow_blank: false
          # requires :utmSource, type: String, allow_blank: false
          # requires :utmMedium, type: String, allow_blank: false
          # requires :utmTerm, type: String, allow_blank: false
          # requires :utmContent, type: String, allow_blank: false
          # requires :utmCampaign, type: String, allow_blank: false
        end
        post do
          begin
            @user = User.find_by(socialEmail: params[:socialEmail])
            unless @user.present?
              @user = User.where(socialEmail: params[:socialEmail]).first_or_initialize(
                  deviceId: params[:deviceId], 
                  deviceType: params[:deviceType], 
                  deviceName: params[:deviceName], 
                  securityToken: SecureRandom.uuid(), 
                  socialType: params[:socialType], 
                  socialId: params[:socialId], 
                  socialToken: params[:socialToken], 
                  socialEmail: params[:socialEmail], 
                  socialName: params[:socialName], 
                  socialmgUrl: params[:socialmgUrl], 
                  advertisingId: params[:advertisingId], 
                  versionName: params[:versionName], 
                  versionCode: params[:versionCode], 
                  utmSource: params[:utmSource], 
                  utmMedium: params[:utmMedium], 
                  utmTerm: params[:utmTerm], 
                  utmContent: params[:utmContent], 
                  utmCampaign: params[:utmCampaign]
              )
              @user.save
              if params[:refrelCode].present?
                rfAccount = Account.find_by refer_code: params[:refrelCode]
                  rfAccount.coin = rfAccount.coin.to_i+100
                  rfAccount.save!
              end
            end
                if @user.account.present?
                  acnt = @user.account
                else
                  acnt = @user.account=Account.create(user_id: @user.id,coin: 100, refer_code: SecureRandom.alphanumeric(10))
                  Earn.create(account_id: acnt.id, coin: 100, name: "Welcome Bonus", reward_id: 4)
                  if params[:refrelCode].present?
                  Earn.create(account_id: acnt.id, coin: 100, name: "Referal Bonus", reward_id: 6)
                  end
              end
            {message: MSG_SUCCESS, status: 200, id: @user.id, SecurityToken: @user.securityToken }
            rescue Exception => e
            logger.info "API Exception-#{Time.now}-signup-#{params.inspect}-Error-#{e}"
            {message: MSG_ERROR, status: 500}
          end

        end
      end



      # """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
      # __________________________Spin-----Task__________________________________
      # """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


      resource :spin do
        desc "Spin Task --API"
        params do
          # requires :versionName, type: String, allow_blank: false
          # requires :versionCode, type: String, allow_blank: false
          requires :userId, type: String, allow_blank: false
          requires :coin, type: Integer, allow_blank: false
          # requires :securityToken, type: String, allow_blank: false
        end
        post do
          begin
            user = User.find params[:userId]
            if user
              spin=Earn.create(account_id: user.account.id, reward_id: 5, name: "SPIN", coin: params[:coin])
              user.account.coin = user.account.coin.to_i+params[:coin]
              user.account.save!
              {message: MSG_SUCCESS, spin: spin}
            else
              {message: MSG_ERROR}
            end
          end
        end
      end





      # """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
      # __________________________Task___Offers__________________________________
      # """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


      resource :taskoffer do
      desc "Task Offer List"
      params do
        # requires :versionName, type: String, allow_blank: false
        # requires :versionCode, type: String, allow_blank: false
        requires :userId, type: String, allow_blank: false       
        # requires :securityToken, type: String, allow_blank: false
      end
      post do 
        begin
          user = true
          slider = []
          if user 
            tasks=TaskOffer.select('id','title','titleImg','tasks','point','reward')
            tasks.sample(5).each do |t|
              slider << t.titleImg.truncate(50)
            end
            {message: MSG_SUCCESS, task: tasks, slider: slider}
          else
            {message: MSG_ERROR}
          end
        end
      end
    end




      # """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
      # ============---------Paly Games Earn Points--------------==================
      #"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


      resource :playGame do 
        desc "Play Games Earn Point"
        params do
          # requires :versionName, type: String, allow_blank: false
          # requires :versionCode, type: String, allow_blank: false
          requires :userId, type: String, allow_blank: false       
          # requires :securityToken, type: String, allow_blank: false
        end
        post do 
          begin
            user = true
            slider=[]
            if user 
              blog = PlayEarn.all
              blog.sample(5).each do |b|
                slider << b.blogImage
              end
              {message: MSG_SUCCESS, blog: blog, slider: slider }
            else
              {message: MSG_ERROR}
            end
          end
        end
      end



      # """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
      #         ============---------HOME--------------==================
      #""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
      resource :home do
        desc "Home-App-Open"
        params do
          # requires :versionName, type: String, allow_blank: false
          # requires :versionCode, type: String, allow_blank: false
          requires :userId, type: String, allow_blank: false       
          # requires :securityToken, type: String, allow_blank: false
        end
        post  do
          begin
            user = User.find params[:userId]
            if user
              slider = []
              liveMatches = Match.where(matchStatus: "live")
              liveDetails = []
              # slider << liveMatches.first.front_team.teamLogo

              liveMatches.each do |match|
                frontTeam = Team.find_by(teamName: match.frontTeam)
                oppTeam = Team.find_by(teamName: match.oppTeam)
                frontTeamDetails={id: frontTeam.id,name: frontTeam.teamName,code: frontTeam.teamCode, logo: frontTeam.teamLogo.truncate(50)}
                slider << {Lfront: frontTeam.teamLogo.truncate(50)}
                oppTeamDetails={id: oppTeam.id,name: oppTeam.teamName,code: oppTeam.teamCode, logo: oppTeam.teamLogo.truncate(50)}
                liveDetails << {match_id: match.id,title: match.title,  views: match.views, frontTeam: frontTeamDetails, oppTeam: oppTeamDetails }
                slider << {Opp: oppTeam.teamLogo.truncate(50)}
              end


              upcomingMatches = Match.where(matchStatus: "upcoming")
              upcomingDetails = []
              upcomingMatches.each do |match| 
                frontTeam = Team.find_by(teamName: match.frontTeam)
                oppTeam = Team.find_by(teamName: match.oppTeam)
                frontTeamDetails={id: frontTeam.id,name: frontTeam.teamName,code: frontTeam.teamCode, logo: frontTeam.teamLogo.truncate(50)}
                oppTeamDetails={id: oppTeam.id,name: oppTeam.teamName,code: oppTeam.teamCode, logo: oppTeam.teamLogo.truncate(50)}
                upcomingDetails << {match_id: match.id,title: match.title,  views: match.views, frontTeam: frontTeamDetails, oppTeam: oppTeamDetails }
              end


              completed = Match.where(matchStatus: "completed")
              completedDetails = []
              completed.each do |match| 
                frontTeam = Team.find_by(teamName: match.frontTeam)
                oppTeam = Team.find_by(teamName: match.oppTeam)
                frontTeamDetails={id: frontTeam.id,name: frontTeam.teamName,code: frontTeam.teamCode, logo: frontTeam.teamLogo.truncate(50)}
                oppTeamDetails={id: oppTeam.id,name: oppTeam.teamName,code: oppTeam.teamCode, logo: oppTeam.teamLogo.truncate(50)}
                completedDetails << {match_id: match.id,title: match.title,  views: match.views, frontTeam: frontTeamDetails, oppTeam: oppTeamDetails }
              end
              {message: 'MSG_SUCCESS', status: 200,  liveMatch: liveDetails, completedMatch: completedDetails, upcomingMatch: upcomingDetails, slider: slider}
            else
              {message: 'INVALID_USER', status: 500}
            end
          end

          end
      end





      # """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
      #      =============---------PREVIEW--------------==================
      #""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

      resource :preview do
        desc "Preview-Page-Inside_Home-App-Open"
        params do
          requires :id, type: String, allow_blank: false 
          # requires :versionName, type: String, allow_blank: false
          # requires :versionCode, type: String, allow_blank: false
          # requires :userId, type: String, allow_blank: false
          # requires :securityToken, type: String, allow_blank: false
        end
        post do
          begin
            user = User.find params[:userId]
            if user
              #Finding match with "id params"
              match = Match.find(params[:id])

              #finding Front Team
              frontTeam = Team.find_by(teamName: match.frontTeam)

              #PlayerDetail Array
              playerDetails =[]

              #storing each players Details for front Team
              frontTeam.players.each do | player |
                playerDetails << {id: player.id,name: player.name, score: player.score, role: player.roles } 
              end

              #full Details of Front Team Array for storing Front Team Details with player details
              news = "It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using 'Content here, content here', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for 'lorem ipsum' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like)."


              frontTeamDetails = []
              frontTeamDetails << {id: frontTeam.id,name: frontTeam.teamName, players: playerDetails, news: news}


              #finding Opposite Team
              oppTeam = Team.find_by(teamName: match.oppTeam)

              #PlayerDetail Array
              playerDetails =[]
              #storing each players Details for OPPOSITE Team
              oppTeam.players.each do | player |
                playerDetails << {id: player.id,name: player.name, score: player.score }
              end


              news = """It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using 'Content here, content here', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for 'lorem ipsum' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like)."""

              #full Details of Oppositie Team Array for storing OPPOSITE Team Details with player details
              oppTeamDetails = []
              oppTeamDetails << {id: oppTeam.id,name: oppTeam.teamName, players: playerDetails, news: news}

              {message: MSG_SUCCESS,status: 200, front_team: frontTeamDetails, opp_team: oppTeamDetails }
            else
            end
          rescue Exception => e
            puts "API Exception-#{Time.now}-Match-Details-#{params.inspect}-Error-#{e}"
            {message: MSG_ERROR, status: 500}
          end
        end
      end




       resource :ads do
        desc "Ads link are here"
        #before {api_params}
        params do
        end
        post do
          begin
            user = true #valid_user(params['userId'].to_i, params['securityToken'])
            if user
              ads = [ad1: "https://www.tutorialspoint.com/ruby/ruby_hashes.htm", ad2: "https://www.rubyguides.com/ruby-tutorial/loops/", ad2img:"https://zeevector.com/wp-content/uploads/LOGO/Paytm-Cashback-Logo-PNG-Tranparent.png" ]
              {message: 'MSG_SUCCESS', status: 200, ads: ads}
            else
              {message: 'INVALID_USER', status: 500}
            end
          rescue Exception => e
            puts "API Exception-#{Time.now}-SafeAPI-#{params.inspect}-Error-#{e}"
            {message: 'MSG_ERROR', status: 500}
          end
        end
      end


    end 
end
end 