# frozen_string_literal: true

project 'jruby_noise', 'http://maven.apache.org' do
  model_version '4.0.0'
  id 'monkstone:jruby_noise:0.0.1'
  packaging 'jar'

  description 'A JRuby Wrapper for OpenSimplex2'

  organization 'monkstone', 'https://monkstone.github.io'

  {
    'monkstone' => 'Martin Prout', 'KDotJPG' => 'Kurt Spencer'
  }.each do |key, value|
    developer key do
      name value
      roles 'developer'
    end
  end
  license 'GPL 3', 'http://www.gnu.org/licenses/gpl-3.0-standalone.html'

  issue_management 'https://github.com/monkstone/RubyOpenSimplex/issues', 'Github'
  # Need to update to jogl 2.4.1 as soon as available, then make a dependency
  properties('jruby.api' => 'http://jruby.org/apidocs/',
    'source.directory' => 'src',
    'jruby_noise.basedir' => '${project.basedir}',
    'project.build.sourceEncoding' => 'UTF-8',
    'polyglot.dump.pom' => 'pom.xml')
    pom 'org.jruby:jruby:9.2.17.0'
  end

  plugin(:compiler, '3.8.1',
    'release' => '11')
    plugin(:javadoc, '2.10.4',
      'detectOfflineLinks' => 'false',
      'links' => ['${jruby.api}'])
        plugin(:jar, '3.2.0',
          'archive' => {
            'manifestEntries' => {
              'Automatic-Module-Name' => 'monkstone.noise'
            }
          }
        )
        plugin :jdeps, '3.1.2' do
          execute_goals 'jdkinternals', 'test-jdkinternals'
        end

        overrides do
          build do
            resource do
              directory '${source.directory}/main/java'
            end
          end
        end
