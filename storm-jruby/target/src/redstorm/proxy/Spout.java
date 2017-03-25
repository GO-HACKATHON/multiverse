package redstorm.proxy;

import org.jruby.Ruby;
import org.jruby.RubyObject;
import org.jruby.runtime.Helpers;
import org.jruby.runtime.builtin.IRubyObject;
import org.jruby.javasupport.JavaUtil;
import org.jruby.RubyClass;
import backtype.storm.spout.SpoutOutputCollector;
import backtype.storm.task.TopologyContext;
import backtype.storm.topology.IRichSpout;
import backtype.storm.topology.OutputFieldsDeclarer;
import backtype.storm.tuple.Tuple;
import backtype.storm.tuple.Fields;
import backtype.storm.tuple.Values;
import java.util.Map;


public class Spout extends RubyObject implements IRichSpout {
    private static final Ruby __ruby__ = Ruby.getGlobalRuntime();
    private static final RubyClass __metaclass__;

    static {
        String source = new StringBuilder("require 'java'\n" +
            "\n" +
            "java_import 'backtype.storm.spout.SpoutOutputCollector'\n" +
            "java_import 'backtype.storm.task.TopologyContext'\n" +
            "java_import 'backtype.storm.topology.IRichSpout'\n" +
            "java_import 'backtype.storm.topology.OutputFieldsDeclarer'\n" +
            "java_import 'backtype.storm.tuple.Tuple'\n" +
            "java_import 'backtype.storm.tuple.Fields'\n" +
            "java_import 'backtype.storm.tuple.Values'\n" +
            "java_import 'java.util.Map'\n" +
            "module Backtype\n" +
            "  java_import 'backtype.storm.Config'\n" +
            "end\n" +
            "\n" +
            "java_package 'redstorm.proxy'\n" +
            "\n" +
            "# the Spout class is a proxy to the real spout to avoid having to deal with all the\n" +
            "# Java artifacts when creating a spout.\n" +
            "#\n" +
            "# The real spout class implementation must define these methods:\n" +
            "# - open(conf, context, collector)\n" +
            "# - next_tuple\n" +
            "# - declare_output_fields\n" +
            "#\n" +
            "# and optionnaly:\n" +
            "# - ack(msg_id)\n" +
            "# - fail(msg_id)\n" +
            "# - close\n" +
            "#\n" +
            "\n" +
            "class Spout\n" +
            "  java_implements IRichSpout\n" +
            "\n" +
            "  java_signature 'IRichSpout (String base_class_path, String real_spout_class_name)'\n" +
            "  def initialize(base_class_path, real_spout_class_name)\n" +
            "    @real_spout = Object.module_eval(real_spout_class_name).new\n" +
            "  rescue NameError\n" +
            "    require base_class_path\n" +
            "    @real_spout = Object.module_eval(real_spout_class_name).new\n" +
            "  end\n" +
            "\n" +
            "  java_signature 'void open(Map, TopologyContext, SpoutOutputCollector)'\n" +
            "  def open(conf, context, collector)\n" +
            "    @real_spout.open(conf, context, collector)\n" +
            "  end\n" +
            "\n" +
            "  java_signature 'void close()'\n" +
            "  def close\n" +
            "    @real_spout.close if @real_spout.respond_to?(:close)\n" +
            "  end\n" +
            "\n" +
            "  java_signature 'void activate()'\n" +
            "  def activate\n" +
            "    @real_spout.activate if @real_spout.respond_to?(:activate)\n" +
            "  end\n" +
            "\n" +
            "  java_signature 'void deactivate()'\n" +
            "  def deactivate\n" +
            "    @real_spout.deactivate if @real_spout.respond_to?(:deactivate)\n" +
            "  end\n" +
            "\n" +
            "  java_signature 'void nextTuple()'\n" +
            "  def nextTuple\n" +
            "    @real_spout.next_tuple\n" +
            "  end\n" +
            "\n" +
            "  java_signature 'void ack(Object)'\n" +
            "  def ack(msg_id)\n" +
            "    @real_spout.ack(msg_id) if @real_spout.respond_to?(:ack)\n" +
            "  end\n" +
            "\n" +
            "  java_signature 'void fail(Object)'\n" +
            "  def fail(msg_id)\n" +
            "    @real_spout.fail(msg_id) if @real_spout.respond_to?(:fail)\n" +
            "  end\n" +
            "\n" +
            "  java_signature 'void declareOutputFields(OutputFieldsDeclarer)'\n" +
            "  def declareOutputFields(declarer)\n" +
            "    @real_spout.declare_output_fields(declarer)\n" +
            "  end\n" +
            "\n" +
            "  java_signature 'Map<String, Object> getComponentConfiguration()'\n" +
            "  def getComponentConfiguration\n" +
            "    @real_spout.get_component_configuration\n" +
            "  end\n" +
            "\n" +
            "end\n" +
            "").toString();
        __ruby__.executeScript(source, "/root/.rbenv/versions/jruby-1.7.4/lib/ruby/gems/shared/gems/redstorm-0.6.6/lib/red_storm/proxy/spout.rb");
        RubyClass metaclass = __ruby__.getClass("Spout");
        metaclass.setRubyStaticAllocator(Spout.class);
        if (metaclass == null) throw new NoClassDefFoundError("Could not load Ruby class: Spout");
        __metaclass__ = metaclass;
    }

    /**
     * Standard Ruby object constructor, for construction-from-Ruby purposes.
     * Generally not for user consumption.
     *
     * @param ruby The JRuby instance this object will belong to
     * @param metaclass The RubyClass representing the Ruby class of this object
     */
    private Spout(Ruby ruby, RubyClass metaclass) {
        super(ruby, metaclass);
    }

    /**
     * A static method used by JRuby for allocating instances of this object
     * from Ruby. Generally not for user comsumption.
     *
     * @param ruby The JRuby instance this object will belong to
     * @param metaclass The RubyClass representing the Ruby class of this object
     */
    public static IRubyObject __allocate__(Ruby ruby, RubyClass metaClass) {
        return new Spout(ruby, metaClass);
    }

    
    public  Spout(String base_class_path, String real_spout_class_name) {
        this(__ruby__, __metaclass__);
        IRubyObject ruby_base_class_path = JavaUtil.convertJavaToRuby(__ruby__, base_class_path);
        IRubyObject ruby_real_spout_class_name = JavaUtil.convertJavaToRuby(__ruby__, real_spout_class_name);
        Helpers.invoke(__ruby__.getCurrentContext(), this, "initialize", ruby_base_class_path, ruby_real_spout_class_name);

    }

    
    public void open(Map conf, TopologyContext context, SpoutOutputCollector collector) {
        IRubyObject ruby_conf = JavaUtil.convertJavaToRuby(__ruby__, conf);
        IRubyObject ruby_context = JavaUtil.convertJavaToRuby(__ruby__, context);
        IRubyObject ruby_collector = JavaUtil.convertJavaToRuby(__ruby__, collector);
        IRubyObject ruby_result = Helpers.invoke(__ruby__.getCurrentContext(), this, "open", ruby_conf, ruby_context, ruby_collector);
        return;

    }

    
    public void close() {

        IRubyObject ruby_result = Helpers.invoke(__ruby__.getCurrentContext(), this, "close");
        return;

    }

    
    public void activate() {

        IRubyObject ruby_result = Helpers.invoke(__ruby__.getCurrentContext(), this, "activate");
        return;

    }

    
    public void deactivate() {

        IRubyObject ruby_result = Helpers.invoke(__ruby__.getCurrentContext(), this, "deactivate");
        return;

    }

    
    public void nextTuple() {

        IRubyObject ruby_result = Helpers.invoke(__ruby__.getCurrentContext(), this, "nextTuple");
        return;

    }

    
    public void ack(Object msg_id) {
        IRubyObject ruby_msg_id = JavaUtil.convertJavaToRuby(__ruby__, msg_id);
        IRubyObject ruby_result = Helpers.invoke(__ruby__.getCurrentContext(), this, "ack", ruby_msg_id);
        return;

    }

    
    public void fail(Object msg_id) {
        IRubyObject ruby_msg_id = JavaUtil.convertJavaToRuby(__ruby__, msg_id);
        IRubyObject ruby_result = Helpers.invoke(__ruby__.getCurrentContext(), this, "fail", ruby_msg_id);
        return;

    }

    
    public void declareOutputFields(OutputFieldsDeclarer declarer) {
        IRubyObject ruby_declarer = JavaUtil.convertJavaToRuby(__ruby__, declarer);
        IRubyObject ruby_result = Helpers.invoke(__ruby__.getCurrentContext(), this, "declareOutputFields", ruby_declarer);
        return;

    }

    
    public Map<String, Object> getComponentConfiguration() {

        IRubyObject ruby_result = Helpers.invoke(__ruby__.getCurrentContext(), this, "getComponentConfiguration");
        return (Map)ruby_result.toJava(Map.class);

    }

}
