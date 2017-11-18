#!/usr/bin/env groovy

import java.util.regex.Matcher;

try {
  def jobId = "${env.JOB_NAME.replaceAll('/','-')}_${env.BUILD_NUMBER}"

  node {
    def nodePath = "${tool 'NodeJS_8.8.1'}"

    docker.image("postgres").withRun("--name postgres-${jobId} --env POSTGRES_PASSWORD=postgres") { postgresContainer ->
      docker.image("redis").withRun("--name redis-${jobId}") { redisContainer ->
  docker.image('roundforest/ruby-builder').inside("--link ${postgresContainer.id}:postgres --link ${redisContainer.id}:redis -v /home/jenkins/gems:/jenkins/gems -v ${nodePath}:/jenkins/nodejs") {

    stage('Checkout the source code') {
      checkout scm
    }

    stage('Setup the application') {
      env.PATH="/jenkins/nodejs/bin:${env.PATH}"

      sh 'cp config/database.yml.jenkins config/database.yml'

      rvm 'bundle install --path=/jenkins/gems/' + parentJobName()
      rvm 'bundle show rake'

      withEnv(['RAILS_ENV=test']) {
        rvm 'bundle exec rake db:drop db:create db:migrate'
      }

      rvm 'bundle exec rake tmp:create'
      sh 'echo "--no-color" >> .rspec'
    }

    stage('Run the tests') {
      withEnv(["TRACKING_REDIS_URL=" + redisURL(),
        "SETTINGS__SIDEKIQ__REDIS_URL=" + redisURL(),
        'GENERATE_REPORTS=true',
        'RUN_ALL_SPECS=1'
        ]) {
        rvm 'xvfb-run -s "-screen 0 1024x768x16" -a bundle exec rake || true'
      }

      junit 'spec/reports/*.xml'
    }
  }
      }
    }
  }
} catch (err) {
  throw err
}

String parentJobName() {
  return env.JOB_NAME.split("/")[0]
}

/* Small helper command to execute a `sh` step with RVM pre-loaded and our
 * proper Ruby selected
 */
def rvm(String commands) {
  sh "bash -l -c 'rvm use 2.3.4 && ${commands}'"
}

String redisURL() {
  // return "redis://" + env.REDIS_PORT_6379_TCP_ADDR + ":6379"
  return "redis://redis:6379"
}
