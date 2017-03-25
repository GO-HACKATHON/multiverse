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

##############################################################
#
# NOTICE:
#      THIS FEATURE HAS BEEN DEPRECATED ON SERVER.
#      THE API WILL BE REMOVED FROM THE CLIENT IN THE FUTURE.
#
##############################################################

require 'aerospike/ldt/large'

module Aerospike

  private

  class LargeStack < Large

    def initialize(client, policy, key, bin_name, user_module=nil)
      @PACKAGE_NAME = 'lstack'

      super(client, policy, key, bin_name, user_module)

      self
    end

    # Push values onto stack.  If the stack does not exist, create it using specified user_module configuration.
    #
    # values      values to push
    def push(*values)
      if values.length == 1
        @client.execute_udf(@key, @PACKAGE_NAME, 'push', [@bin_name, values[0], @user_module], @policy)
      else
        @client.execute_udf(@key, @PACKAGE_NAME, 'push_all', [@bin_name, values, @user_module], @policy)
      end
    end

    # Select items from top of stack.
    #
    # peek_count     number of items to select.
    # returns          list of items selected
    def peek(peek_count)
      @client.execute_udf(@key, @PACKAGE_NAME, 'peek', [@bin_name, peek_count], @policy)
    end

    # Select items from top of stack.
    #
    # peek_count     number of items to select.
    # returns          list of items selected
    def pop(count)
      @client.execute_udf(@key, @PACKAGE_NAME, 'pop', [@bin_name, count], @policy)
    end

    # Select items from top of stack.
    #
    # peek_count     number of items to select.
    # filter_name    Lua function name which applies filter to returned list
    # filter_args    arguments to Lua function name
    # returns          list of items selected
    def filter(peek_count, filter_name, *filter_args)
      @client.execute_udf(@key, @PACKAGE_NAME, 'filter', [@bin_name, peek_count, @user_module, filter_name, filter_args], @policy)
    end

  end # class

end #class
