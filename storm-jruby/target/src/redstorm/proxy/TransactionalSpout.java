package redstorm.proxy;

import org.jruby.Ruby;
import org.jruby.RubyObject;
import org.jruby.runtime.Helpers;
import org.jruby.runtime.builtin.IRubyObject;
import org.jruby.javasupport.JavaUtil;
import org.jruby.RubyClass;
import backtype.storm.task.TopologyContext;
import backtype.storm.transactional.ITransactionalSpout;
import backtype.storm.topology.OutputFieldsDeclarer;
import java.util.Map;


public class TransactionalSpout extends RubyObject implements ITransactionalSpout {
    private static final Ruby __ruby__ = Ruby.getGlobalRuntime();
    private static final RubyClass __metaclass__;

    static {
        String source = new StringBuilder("require 'java'\n" +
            "\n" +
            "java_import 'backtype.storm.task.TopologyContext'\n" +
            "java_import 'backtype.storm.transactional.ITransactionalSpout'\n" +
            "java_import 'backtype.storm.topology.OutputFieldsDeclarer'\n" +
            "java_import 'java.util.Map'\n" +
            "\n" +
            "module Backtype\n" +
            "  java_import 'backtype.storm.Config'\n" +
            "end\n" +
            "\n" +
            "java_package 'redstorm.proxy'\n" +
            "\n" +
            "\n" +
            "class TransactionalSpout\n" +
            "  java_implements 'ITransactionalSpout'\n" +
            "\n" +
            "  java_signature 'ITransactionalSpout (String base_class_path, String real_spout_class_name)'\n" +
            "  def initialize(base_class_path, real_spout_class_name)\n" +
            "    @real_spout = Object.module_eval(real_spout_class_name).new\n" +
            "  rescue NameError\n" +
            "    require base_class_path\n" +
            "    @real_spout = Object.module_eval(real_spout_class_name).new\n" +
            "  end\n" +
            "\n" +
            "  java_signature 'ITransactionalSpout.Emitter getEmitter(Map, TopologyContext)'\n" +
            "  def getEmitter(conf, context)\n" +
            "    @real_spout.get_emitter(conf, context)\n" +
            "  end\n" +
            "\n" +
            "  java_signature 'ITransactionalSpout.Coordinator getCoordinator(Map, TopologyContext)'\n" +
            "  def getCoordinator(conf, context)\n" +
            "    @real_spout.get_coordinator(conf, context)\n" +
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
            "end").toString();
        __ruby__.executeScript(source, "/root/.rbenv/versions/jruby-1.7.4/lib/ruby/gems/shared/gems/redstorm-0.6.6/lib/red_storm/proxy/transactional_spout.rb");
        RubyClass metaclass = __ruby__.getClass("TransactionalSpout");
        metaclass.setRubyStaticAllocator(TransactionalSpout.class);
        if (metaclass == null) throw new NoClassDefFoundError("Could not load Ruby class: TransactionalSpout");
        __metaclass__ = metaclass;
    }

    /**
     * Standard Ruby object constructor, for construction-from-Ruby purposes.
     * Generally not for user consumption.
     *
     * @param ruby The JRuby instance this object will belong to
     * @param metaclass The RubyClass representing the Ruby class of this object
     */
    private TransactionalSpout(Ruby ruby, RubyClass metaclass) {
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
        return new TransactionalSpout(ruby, metaClass);
    }

    
    public  TransactionalSpout(String base_class_path, String real_spout_class_name) {
        this(__ruby__, __metaclass__);
        IRubyObject ruby_base_class_path = JavaUtil.convertJavaToRuby(__ruby__, base_class_path);
        IRubyObject ruby_real_spout_class_name = JavaUtil.convertJavaToRuby(__ruby__, real_spout_class_name);
        Helpers.invoke(__ruby__.getCurrentContext(), this, "initialize", ruby_base_class_path, ruby_real_spout_class_name);

    }

    
    public ITransactionalSpout.Emitter getEmitter(Map conf, TopologyContext context) {
        IRubyObject ruby_conf = JavaUtil.convertJavaToRuby(__ruby__, conf);
        IRubyObject ruby_context = JavaUtil.convertJavaToRuby(__ruby__, context);
        IRubyObject ruby_result = Helpers.invoke(__ruby__.getCurrentContext(), this, "getEmitter", ruby_conf, ruby_context);
        return (ITransactionalSpout.Emitter)ruby_result.toJava(ITransactionalSpout.Emitter.class);

    }

    
    public ITransactionalSpout.Coordinator getCoordinator(Map conf, TopologyContext context) {
        IRubyObject ruby_conf = JavaUtil.convertJavaToRuby(__ruby__, conf);
        IRubyObject ruby_context = JavaUtil.convertJavaToRuby(__ruby__, context);
        IRubyObject ruby_result = Helpers.invoke(__ruby__.getCurrentContext(), this, "getCoordinator", ruby_conf, ruby_context);
        return (ITransactionalSpout.Coordinator)ruby_result.toJava(ITransactionalSpout.Coordinator.class);

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
