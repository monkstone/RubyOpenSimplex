/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package monkstone;

import monkstone.noise.OpenSimplex2F;
import org.jruby.Ruby;
import org.jruby.RubyFloat;
import org.jruby.RubyModule;
import org.jruby.RubyNumeric;
import org.jruby.anno.JRubyMethod;
import org.jruby.anno.JRubyModule;
import org.jruby.runtime.ThreadContext;
import org.jruby.runtime.builtin.IRubyObject;

/**
 *
 * @author Martin Prout
 */
@JRubyModule(name = "FastNoise")
public class FastNoiseModuleJava {

    static OpenSimplex2F ng = new OpenSimplex2F(System.currentTimeMillis());

    /**
     *
     * @param runtime Ruby
     */
    public static void createNoiseModule(Ruby runtime) {
        RubyModule noiseModule = runtime.defineModule("NoiseModule");
        noiseModule.defineAnnotatedMethods(FastNoiseModuleJava.class);
    }

    /**
     *
     * @param context ThreadContext
     * @param recv IRubyObject
     * @param args array of numeric values
     * @return mapped value RubyFloat
     */
    @JRubyMethod(name = "noise", rest = true, module = true)
    public static IRubyObject noiseImpl(ThreadContext context, IRubyObject recv, IRubyObject[] args) {
        double result = 0;
        double one;
        double two;
        double three;
        double four;
        switch (args.length) {
            case 1:
                if (args[0] instanceof RubyFloat) {
                    one = ((RubyFloat) args[0]).getValue();
                    result = ng.noise2(one, 0);
                }
                break;
            case 2:
                if (args[1] instanceof RubyFloat) {
                    two = ((RubyFloat) args[1]).getValue();
                    one = ((RubyFloat) args[0]).getValue();
                    result = ng.noise2(one, two);
                }
                break;
            case 3:
                if (args[2] instanceof RubyFloat) {
                    three = ((RubyFloat) args[2]).getValue();
                    two = ((RubyFloat) args[1]).getValue();
                    one = ((RubyFloat) args[0]).getValue();
                    result = ng.noise3_Classic(one, two, three);
                }
                break;
            case 4:
                if (args[3] instanceof RubyFloat) {
                    four = ((RubyFloat) args[3]).getValue();
                    three = ((RubyFloat) args[2]).getValue();
                    two = ((RubyFloat) args[1]).getValue();
                    one = ((RubyFloat) args[0]).getValue(); 
                    result = ng.noise4_Classic(one, two, three, four);
                }
                break;
            default:
                throw new RuntimeException("Maximum of 4D Noise");
        }        
        return RubyFloat.newFloat(context.runtime, result);
    }

    @JRubyMethod(name = "noise_seed", rest = true, module = true)
    public static IRubyObject noiseSeedImpl(ThreadContext context, IRubyObject recv, IRubyObject arg) {
        long seed;
        if (arg instanceof RubyNumeric){
            seed = ((RubyNumeric)arg).getLongValue();
            ng = new OpenSimplex2F(seed);
        }
        return (IRubyObject) ng;
    }
}
