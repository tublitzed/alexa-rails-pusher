<!-- START doctoc generated TOC please keep comment here to allow auto update -->
<!-- DON'T EDIT THIS SECTION, INSTEAD RE-RUN doctoc TO UPDATE -->
<!-- **Table of Contents**  *generated with [DocToc](https://github.com/thlorenz/doctoc)* -->

- [Alexa/Rails/Pusher](#alexarailspusher)
- [Prerequisites](#prerequisites)
- [Setup](#setup)
  - [1. Pusher](#1-pusher)
  - [2. Alexa](#2-alexa)
  - [3. Rails](#3-rails)
  - [4. Try it out!](#4-try-it-out)

<!-- END doctoc generated TOC please keep comment here to allow auto update -->

# Alexa/Rails/Pusher

This is a sample application showing how you can talk(literally!) to the front-end of a [Rails](http://rubyonrails.org/) application using the [Alexa Skills Kit API](https://developer.amazon.com/alexa-skills-kit) and the [Pusher API](https://pusher.com/).

# Prerequisites

- You should have access to a server that can serve content via https. Amazon's Alexa API requires an SSL enabled endpoint.
- You'll want to create an account with [Pusher](https://pusher.com/) and an [Amazon Developer Account](https://developer.amazon.com/) if you don't have them already.
- You will need `Rails 5.0.0` and `Ruby 2.2.4` installed locally.
- You will need to handle deploying your app, which is not covered in this tutorial.

# Setup

## 1. Pusher

Login to your Pusher account, and create a new app. Take note of the app id, key, and secret, as you'll need them for the rails app.

## 2. Alexa

Login to the [Alexa developer's portal](https://developer.amazon.com/edw/home.html#/) and follow the instructions to create a new `Alexa Skills Kit`:

1. *Skill Information*: pick any names you want. Do not enable the audio player.
2. *Interaction Model*: copy and paste the contents `aws/intent_schema.json` and `aws/sample_utterances.txt` into the appropriate fields.
3. *Configuration*: select `https` and enter your endpoint, ie `https://your-website.com/api/alexa`
4. *SSL Certificate*:
    You will need to provide an SSL certificate here. One option is to follow [Amazon's instructions](https://developer.amazon.com/public/solutions/alexa/alexa-skills-kit/docs/testing-an-alexa-skill#create-a-private-key-and-self-signed-certificate-for-testing) for how to generate a certificate for testing.

    I did not do this. Instead, I copied and pasted an existing SSL certificate from my server. I used [let's encrypt](https://letsencrypt.org/) to configure SSL. If you are also using let's encrypt, your SSL cert should live here: `/etc/letsencrypt/archive/{name-of-your-website.com}/{your-certname-here}.pem`. All you need to do is copy and paste the contents when asked for an SSL cert.
5. *Test*: You should now be ready to test your app. If you have not yet setup and deployed the rails app, do that first. Otherwise, try it out.

## 3. Rails

Before starting this, make sure you have the required Ruby version and Rails versions installed as specfied in the `Gemfile`.

 - 1. `$ bundle install` install required gems
 - 2. `$ cp application.yml.example application.yml`
 - 3. Replace the placeholder values in `application.yml` with your Pusher app id, key, and secret.
 - 4. `$ mkdir -p shared/pids shared/sockets shared/log` - add dirs for Puma
 - 4. `$ cp database.yml.example database.yml`
 - 5. `$ rake db:create` - this is just to get the app running, we're not using a database for anything in this demo.


## 4. Try it out!

Once you've completed steps 1-3 and have deployed the application to your SSL enabled production server, you're ready to try it out. Either use the Alexa service simulator, or try it out with your alexa device.

