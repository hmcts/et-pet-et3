require 'rails_helper'

feature 'Save and Return' do

  scenario 'ending the session actually ends the session' do

    end

  scenario 'ending the session with email address' do

    end

  scenario 'ending the session when email address previously entered', js: true do

    end

  scenario 'ending the session when current page invalid' do

    end

  scenario 'returning to existing application', js: true do

  end

  scenario 'returning to an existing application after session expiration' do

    end

  context 'memorable word not set' do
    scenario 'returning to an existing application' do

    end
  end

  context 'forgotten memorable word', js:true do
    it 'recovers correctly when the email is not used at the beginning but when saved' do

    end

    it 'recovers correctly when the email used at the beginning' do

    end

    it 'allows a second claim to be used against the same email' do

    end

    it 'provides valid feedback if claim number not given' do

    end
  end
end