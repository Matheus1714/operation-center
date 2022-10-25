# encoding: ascii-8bit

# Copyright 2022 Ball Aerospace & Technologies Corp.
# All Rights Reserved.
#
# This program is free software; you can modify and/or redistribute it
# under the terms of the GNU Affero General Public License
# as published by the Free Software Foundation; version 3 with
# attribution addendums as found in the LICENSE.txt
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU Affero General Public License for more details.
#
# This program may also be used under the terms of a commercial or
# enterprise edition license of COSMOS if purchased from the
# copyright holder

require 'cosmos/models/plugin_model'
require 'fileutils'
require 'tmpdir'

class PluginsController < ModelController
  def initialize
    @model_class = Cosmos::PluginModel
  end

  # Add a new plugin
  def create(update = false)
    return unless authorization('admin')
    file = params[:plugin]
    if file
      temp_dir = Dir.mktmpdir
      begin
        gem_file_path = temp_dir + '/' + file.original_filename
        FileUtils.cp(file.tempfile.path, gem_file_path)
        if @existing_model
          result = Cosmos::PluginModel.install_phase1(gem_file_path, existing_variables: @existing_model['variables'], existing_plugin_txt_lines: @existing_model['plugin_txt_lines'], scope: params[:scope])
        else
          result = Cosmos::PluginModel.install_phase1(gem_file_path, scope: params[:scope])
        end
        render :json => result
      rescue => err
        logger.error(err.formatted)
        head :internal_server_error
      ensure
        FileUtils.remove_entry(temp_dir) if temp_dir and File.exist?(temp_dir)
      end
    else
      logger.error("No file received")
      head :internal_server_error
    end
  end

  def update
    return unless authorization('admin')
    # Grab the existing plugin we're updating so we can display existing variables
    @existing_model = @model_class.get(name: params[:id], scope: params[:scope])
    create(true)
  end

  def install
    return unless authorization('admin')
    begin
      temp_dir = Dir.mktmpdir
      variables_filename = Dir::Tmpname.create(['variables-', '.json']) {}
      variables_file_path = File.join(temp_dir, File.basename(variables_filename))
      File.open(variables_file_path, 'wb') do |file|
        file.write(params[:plugin_hash])
      end

      result = Cosmos::ProcessManager.instance.spawn(["ruby", "/cosmos/bin/cosmos", "load", params[:id], params[:scope], variables_file_path], "plugin_install", params[:id], Time.now + 1.hour, temp_dir: temp_dir, scope: params[:scope])
      render :json => result
    rescue Exception => e
      render(:json => { :status => 'error', :message => e.message }, :status => 500) and return
    end
  end
end
