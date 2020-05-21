#!/usr/bin/env python3
import sys
sys.path.append('gen-py')

from thrift.transport import TSocket
from thrift.transport import TTransport
from thrift.protocol import TBinaryProtocol
from thrift.server import TServer

from Calculator import CalculatorService
from Calculator.ttypes import OperationResult

class CalculatorHandler(CalculatorService.Iface):
    def Sum(self,firstNumber,secondNumber):
        operationResult = OperationResult()
        operationResult.result = firstNumber + secondNumber
        operationResult.codeResult = 200
        return operationResult
    
    def Subtraction(self,firstNumber,secondNumber):
        operationResult = OperationResult()
        operationResult.result = firstNumber - secondNumber
        operationResult.codeResult = 200
        return operationResult 
    
    def Division(self,firstNumber,secondNumber):
        operationResult = OperationResult()
        if secondNumber == 0:
            operationResult.result = 0
            operationResult.codeResult = 300
        else:
            operationResult.result = firstNumber/secondNumber
            operationResult.codeResult = 200
        return operationResult 

    def Multiplication(self,firstNumber,secondNumber):
        operationResult = OperationResult()
        operationResult.result = firstNumber * secondNumber
        operationResult.codeResult = 200
        return operationResult 



if __name__ == '__main__':
    handler = CalculatorHandler()
    processor = CalculatorService.Processor(handler)
    transport = TSocket.TServerSocket(host='127.0.0.1', port=9090)
    tfactory = TTransport.TBufferedTransportFactory()
    pfactory = TBinaryProtocol.TBinaryProtocolFactory()

    server = TServer.TSimpleServer(processor, transport, tfactory, pfactory)
    print("Server running...")
    server.serve()