$:.push('gen-rb')

require 'thrift'
require 'calculator_service'
require 'optparse'
require 'ostruct'

# transporte.open()

# result = client.Division(6, 0)
# puts "Sub de 6 + 4: " + result.result.to_s

# transporte.close()
def process_argv(option, num1, num2)
    port = 9090

    transporte = Thrift::Socket.new('localhost', port)
    transporte = Thrift::BufferedTransport.new(transporte)
    protocolo = Thrift::BinaryProtocol.new(transporte)

    client = CalculatorService::Client.new(protocolo)
    transporte.open()
    case option
        when "-h"
        puts "This is the help menu."
        puts "Example: [command] num1 num2"
        puts "  --sum sum two numbers"
        puts "  --substract substract two numbers"
        puts "  --division divide two numbers"
        puts "  --multiply multiply two numbers"
        exit
        when "--sum"
            result = client.Sum(num1.to_f, num2.to_f)
            puts "Result: " + result.result.to_s
            
        when "--substract"
            result = client.Subtraction(num1.to_f, num2.to_f)
            puts "Result: " + result.result.to_s
        when "--division"
            result = client.Division(num1.to_f, num2.to_f)
            puts "Result: " + result.result.to_s
        when "--multiply"
            result = client.Multiplication(num1.to_f, num2.to_f)
            puts "Result: " + result.result.to_s
    end
    transporte.close()
end

@options = {}


process_argv(ARGV[0],ARGV[1], ARGV[2])
  

# p options