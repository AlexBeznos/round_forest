#!/usr/bin/env groovy

import java.util.regex.Matcher;

try {
  def jobId = "${env.JOB_NAME.replaceAll('/','-')}_${env.BUILD_NUMBER}"

  node {
    docker.image('postgres').withRun('--name postgres-${jobId}') { postgresContainer ->
      docker.image('ruby:2.3.4-jessie').inside("--link=${postgresContainer.id}:postgres") {
        stage('Checkout the source code') {
          checkout scm
        }

        stage 'Prepare Container' {
          sh 'sudo apt-get install -qy xvfb node libxslt-dev libxml2-dev libpq-dev postgresql-client qt5-default qt5-qmake libqt5webkit5-dev qtdeclarative5-dev'
        }

        stage 'Install Gems' {
          sh 'gem install bundler -N'

          withEnv(['NOKOGIRI_USE_SYSTEM_LIBRARIES=true']) {
            sh 'bundle install'
          }
        }

        withEnv(['DATABASE_URL=postgres://postgres@postgres:5432/']) {
          stage 'Prepare Database' {
            sh 'bundle exec rake db:create db:schema:load'
          }

          stage 'Run specs' {
            sh 'xvfb-run bundle exec rake || true'
          }
        }
      }
    }
  }
} catch (err) {
  throw err
}
