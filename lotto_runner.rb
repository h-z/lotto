require 'yaml'
require './lotto.rb'
require './otos_lotto.rb'
require './hatos_lotto.rb'
require './skandi_lotto.rb'

class LottoRunner
  def initialize
    @lottos = {}
  end
  def run args
    begin
      args[1] = YAML::load(args[1])
      l = lotto(args.first).new(args[1], args[2], args[3])
      p l.winner?
    rescue
      p 'error'
    end
  end
  
  def lotto klass
    #return @lottos[klass] unless @lottos[klass].nil?
    #@lottos[klass] = klasses[klass]
    klasses[klass]
    #@lottos[klass]
  end

  def klasses
    {'o' => OtosLotto,
     'h' => HatosLotto,
     's' => SkandiLotto,
     '5' => OtosLotto,
     '6' => HatosLotto,
     '7' => SkandiLotto}
  end
end

LottoRunner.new.run ARGV
