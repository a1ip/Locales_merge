# encoding: UTF-8
class Hash
  def deep_merge(other_hash)
    dup.deep_merge!(other_hash)
  end

  def deep_merge!(other_hash)
    other_hash.each_pair do |k,v|
      tv = self[k]
      if tv.is_a?(Hash) then
        self[k] =  v.is_a?(Hash) ? tv.deep_merge(v) : tv
      else
        self[k] = v
      end
    end
    self
  end
end

ruI18n = {:hey => "Привет", :bye => "Пока", :oh =>"Эх"}
enI18n = {:hey => {:morning => "Good morning", :day => "Good day", :evening => {:early => "Good evening", :late => "Good night"}}, :bye => "Bye", :cava => "Ca va"}
enI18n.deep_merge(ruI18n).each { |k,v| puts "#{k} => #{v}"}
