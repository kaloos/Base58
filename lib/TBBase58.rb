#Base58 is a set of lower and capital letters and numbers without the four (0, O, l, I)

#Base58Check (note the "Check") is a Base58 encoding format, frequently used in bitcoin,
#which has a built-in error-checking code

B58SC = "123456789ABCDEFGHJKLMNPQRSTUVWXYZabcdefghijkmnopqrstuvwxyz"
B58SC_LENGTH = B58SC.length

class TBBase58
  attr_reader     :num_in

  def initialize(str_in)
    num_in = convert_bytes_to_integer(str_in.bytes)
    raise ArgumentError, 'Value passed is not an Integer.' unless num_in.is_a?(Integer)
    if num_in != nil then
        @num_in = num_in
    end
  end
  def encode()
    if @num_in == nil then
        return nil
    end
    num_in = @num_in
    str_bytes_out = ""
    while num_in >= B58SC_LENGTH
      rem = num_in % B58SC_LENGTH
      str_bytes_out = B58SC[rem] + str_bytes_out
      #puts "#{num_in.to_s} #{rem.to_s} #{str_bytes_out}"
      num_in = (num_in-rem)/B58SC_LENGTH
    end
    str_bytes_out = B58SC[num_in] + str_bytes_out
    #puts "Output is: #{str_bytes_out}"
    str_bytes_out
  end
  def decode ()
    # this is not done yet
  end

  def convert_bytes_to_integer(arr_bytes_in)
    aux_arr_bytes = arr_bytes_in.reverse
    out_in = 0
    aux_count = 0
    aux_arr_bytes.each do |a_byte|
      out_in = out_in + a_byte*(256 ** aux_count)
      aux_count = aux_count +1
    end
    out_in
  end

end



#tb = TBBase58.new("00010966776006953D5567439E5E39F86A0D273BEED61967F6".to_i(16))
#tb.encode()
