require 'yaml'
require './lotto.rb'
require './otos_lotto.rb'
require './hatos_lotto.rb'
require './skandi_lotto.rb'

class LottoRunner
  def run args
    begin

      lotto = klasses[args.first].new
      args[1] = YAML::load(args[1])
      p lotto.winner? args[1], args[2], args[3]
    rescue
      p 'error'
    end
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
