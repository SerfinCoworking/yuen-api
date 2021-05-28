offset = rand(Company.count)

User.create({
              email_verified: true,
              email: 'eugesma@gmail.com',
              auth0_id: 'google-oauth2|108264278173239611259',
              username: 'eugesma',
              picture: 'https://lh3.googleusercontent.com/a-/AOh14GhAsswbuu2e7rz-0hOeW8VCMhUo2szjZzZ9rR2-=s96-c',
              name: 'Eugenio Gomez',
              nickname: 'eugesma',
              blocked: false,
              given_name: 'Eugenio',
              family_name: 'Gomez'
            })

offset = rand(Company.count)

User.create({
              email_verified: true,
              email: 'shaaamsuu@gmail.com',
              auth0_id: 'google-oauth2|113352769495053696986',
              username: 'shaaamsuu',
              picture: 'https://lh3.googleusercontent.com/a-/AOh14GhoCOt2EUwFE5QEOUxwL3sOZZjKjuBXQB_lQGvX9w=s96-c',
              name: 'Ali Rigol',
              nickname: 'shaaamsuu',
              blocked: false,
              given_name: 'Ali',
              family_name: 'Rigol'
            })

offset = rand(Company.count)

User.create({
              email_verified: true,
              email: 'rodrigo.chavez@est.fi.uncoma.edu.ar',
              auth0_id: 'google-oauth2|107603847677615767228',
              username: 'rodrigo.chavez',
              picture: 'https://lh3.googleusercontent.com/a/AATXAJwCc1en_GHKxkpo8M6bKJsDZ9gVNEoFCv-9kzlE=s96-c',
              name: 'Rodrigo Matias Chavez',
              nickname: 'rodrigo.chavez',
              blocked: false,
              given_name: 'Rodrigo Matias',
              family_name: 'Chavez'
            })

offset = rand(Company.count)

User.create({
              email_verified: true,
              email: 'paul.18.sma@gmail.com',
              auth0_id: 'google-oauth2|115458466953836883321',
              username: 'paul.18.sma',
              picture: 'https://lh3.googleusercontent.com/a-/AOh14GiD9LmCRXUS7qNxxP2sjNif6Clc7yoOy45NpAyAVA=s96-c',
              name: 'Paul Ibaceta',
              nickname: 'paul.18.sma',
              blocked: false,
              given_name: 'Paul',
              family_name: 'Ibaceta'
            })

User.create({
              email_verified: false,
              email: 'paul.18.sma@gmail.com',
              auth0_id: 'auth0|60b027a463019d0069dba1a4',
              username: 'paul.18.sma',
              picture: 'https://s.gravatar.com/avatar/c78f297b4f532c4a10189344a7256e55?s=480&r=pg&d=https%3A%2F%2Fcdn.auth0.com%2Favatars%2Fpa.png',
              name: 'paul.18.sma@gmail.com',
              nickname: 'paul.18.sma',
              blocked: false
            })
