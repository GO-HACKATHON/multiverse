# encoding: utf-8
# Copyright 2014 Aerospike, Inc.
#
# Portions may be licensed to Aerospike, Inc. under one or more contributor
# license agreements.
#
# Licensed under the Apache License, Version 2.0 (the 'License'); you may not
# use this file except in compliance with the License. You may obtain a copy of
# the License at http:#www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an 'AS IS' BASIS, WITHOUT
# WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied. See the
# License for the specific language governing permissions and limitations under
# the License.

require 'aerospike/ldt/large'

module Aerospike

  private

  class LargeList < Large

    def initialize(client, policy, key, bin_name, user_module=nil)
      @PACKAGE_NAME = 'llist'

      super(client, policy, key, bin_name, user_module)

      self
    end

    # Add values to the list.  If the list does not exist, create it using specified user_module configuration.
    #
    # values      values to add
    def add(*values)
      if values.length == 1
        @client.execute_udf(@key, @PACKAGE_NAME, 'add', [@bin_name, values[0], @user_module], @policy)
      else
        @client.execute_udf(@key, @PACKAGE_NAME, 'add_all', [@bin_name, values, @user_module], @policy)
      end
    end

    # Update/Add each value in array depending if key exists or not.
    # If value is a map, the key is identified by "key" entry.  Otherwise, the value is the key.
    # If large list does not exist, create it using specified user_module configuration.
    #
    # values      values to update
    def update(*values)
      if values.length == 1
        @client.execute_udf(@key, @PACKAGE_NAME, 'update', [@bin_name, values[0], @user_module], @policy)
      else
        @client.execute_udf(@key, @PACKAGE_NAME, 'update_all', [@bin_name, values, @user_module], @policy)
      end
    end

    # Delete value from list.
    #
    # value       value to delete
    def remove(value)
      @client.execute_udf(@key, @PACKAGE_NAME, 'remove', [@bin_name, value], @policy)
    end

    # Select values from list.
    #
    # value       value to select
    # returns          list of entries selected
    def find(value)
      begin
        @client.execute_udf(@key, @PACKAGE_NAME, 'find', [@bin_name, value], @policy)
      rescue Aerospike::Exceptions::Aerospike => e
        unless e.result_code == Aerospike::ResultCode::UDF_BAD_RESPONSE && e.message.index("Item Not Found")
          Aerospike.logger.error(e)
          raise e
        end
        nil
      end
    end

    # Select values from list and apply specified Lua filter.
    #
    # value       value to select
    # filter_name    Lua function name which applies filter to returned list
    # filter_args    arguments to Lua function name
    # returns          list of entries selected
    def find_then_filter(value, filter_name, *filter_args)
      @client.execute_udf(@key, @PACKAGE_NAME, 'find_then_filter', [@bin_name, value, @user_module, filter_name, filter_args], @policy)
    end

    # Select values from list and apply specified Lua filter.
    #
    # filter_name    Lua function name which applies filter to returned list
    # filter_args    arguments to Lua function name
    # returns          list of entries selected
    def filter(filter_name, *filter_args)
      @client.execute_udf(@key, @PACKAGE_NAME, 'filter', [@bin_name, @user_module, filter_name, filter_args], @policy)
    end

  end # class

end #class
