package redstorm.proxy;

import org.jruby.Ruby;
import org.jruby.RubyObject;
import org.jruby.runtime.Helpers;
import org.jruby.runtime.builtin.IRubyObject;
import org.jruby.javasupport.JavaUtil;
import org.jruby.RubyClass;
import storm.trident.tuple.TridentTuple;
import storm.trident.operation.TridentCollector;
import storm.trident.operation.TridentOperationContext;
import storm.trident.operation.Function;
import java.util.Map;


public class ProxyFunction extends RubyObject implements Function {
    private static final Ruby __ruby__ = Ruby.getGlobalRuntime();
    private static final RubyClass __metaclass__;

    static {
        String source = new StringBuilder("require 'java'\n" +
            "\n" +
            "java_import 'storm.trident.tuple.TridentTuple'\n" +
            "java_import 'storm.trident.operation.TridentCollector'\n" +
            "java_import 'storm.trident.operation.TridentOperationContext'\n" +
            "java_import 'storm.trident.operation.Function'\n" +
            "java_import 'java.util.Map'\n" +
            "\n" +
            "module Backtype\n" +
            "  java_import 'backtype.storm.Config'\n" +
            "end\n" +
            "\n" +
            "java_package 'redstorm.proxy'\n" +
            "\n" +
            "class ProxyFunction\n" +
            "  java_implements Function\n" +
            "\n" +
            "  java_signature 'Function (String base_class_path, String real_class_name)'\n" +
            "  def initialize(base_class_path, real_class_name)\n" +
            "    @real = Object.module_eval(real_class_name).new\n" +
            "  rescue NameError\n" +
            "    require base_class_path\n" +
            "    @real = Object.module_eval(real_class_name).new\n" +
            "  end\n" +
            "\n" +
            "  java_signature 'void execute(TridentTuple, TridentCollector)'\n" +
            "  def execute(_trident_tuple, _trident_collector)\n" +
            "    @real.execute(_trident_tuple, _trident_collector)\n" +
            "  end\n" +
            "\n" +
            "  java_signature 'void cleanup()'\n" +
            "  def cleanup()\n" +
            "    @real.cleanup()\n" +
            "  end\n" +
            "\n" +
            "  java_signature 'void prepare(Map, TridentOperationContext)'\n" +
            "  def prepare(_map, _trident_operation_context)\n" +
            "    @real.prepare(_map, _trident_operation_context)\n" +
            "  end\n" +
            "end\n" +
            "").toString();
        __ruby__.executeScript(source, "/root/.rbenv/versions/jruby-1.7.4/lib/ruby/gems/shared/gems/redstorm-0.6.6/lib/red_storm/proxy/proxy_function.rb");
        RubyClass metaclass = __ruby__.getClass("ProxyFunction");
        metaclass.setRubyStaticAllocator(ProxyFunction.class);
        if (metaclass == null) throw new NoClassDefFoundError("Could not load Ruby class: ProxyFunction");
        __metaclass__ = metaclass;
    }

    /**
     * Standard Ruby object constructor, for construction-from-Ruby purposes.
     * Generally not for user consumption.
     *
     * @param ruby The JRuby instance this object will belong to
     * @param metaclass The RubyClass representing the Ruby class of this object
     */
    private ProxyFunction(Ruby ruby, RubyClass metaclass) {
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
        return new ProxyFunction(ruby, metaClass);
    }

    
    public  ProxyFunction(String base_class_path, String real_class_name) {
        this(__ruby__, __metaclass__);
        IRubyObject ruby_base_class_path = JavaUtil.convertJavaToRuby(__ruby__, base_class_path);
        IRubyObject ruby_real_class_name = JavaUtil.convertJavaToRuby(__ruby__, real_class_name);
        Helpers.invoke(__ruby__.getCurrentContext(), this, "initialize", ruby_base_class_path, ruby_real_class_name);

    }

    
    public void execute(TridentTuple _trident_tuple, TridentCollector _trident_collector) {
        IRubyObject ruby__trident_tuple = JavaUtil.convertJavaToRuby(__ruby__, _trident_tuple);
        IRubyObject ruby__trident_collector = JavaUtil.convertJavaToRuby(__ruby__, _trident_collector);
        IRubyObject ruby_result = Helpers.invoke(__ruby__.getCurrentContext(), this, "execute", ruby__trident_tuple, ruby__trident_collector);
        return;

    }

    
    public void cleanup() {

        IRubyObject ruby_result = Helpers.invoke(__ruby__.getCurrentContext(), this, "cleanup");
        return;

    }

    
    public void prepare(Map _map, TridentOperationContext _trident_operation_context) {
        IRubyObject ruby__map = JavaUtil.convertJavaToRuby(__ruby__, _map);
        IRubyObject ruby__trident_operation_context = JavaUtil.convertJavaToRuby(__ruby__, _trident_operation_context);
        IRubyObject ruby_result = Helpers.invoke(__ruby__.getCurrentContext(), this, "prepare", ruby__map, ruby__trident_operation_context);
        return;

    }

}
