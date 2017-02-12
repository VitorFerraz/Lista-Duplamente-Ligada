//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

public class Node{
    var valor:Int
    weak var anterior: Node?
    var proximo: Node?

    
    init(valor:Int){
        self.valor = valor
    }
    
}

public class ListaLigada{
    //head
    var inicioLista:Node?
    //tail
    var fimLista:Node?
    
    public var listaVazia:Bool{
        return fimLista == nil
    }
    
    public var primeiro:Node?{
        //retorna o primeiro nó da lista
        return inicioLista
    }
    
    public var ultimo:Node?{
        //retorna o ultimo nó da lista
        return fimLista
    }
    
    public func adicionar(valor:Int){
        // 1
        let novoNode = Node(valor: valor)
        
        // 2
        //se o fim da lista nao for nil, existe algum item na lista, entao devemos mudar os ponteiros.
        if let ultimoNode = fimLista{
            novoNode.anterior = ultimoNode
            ultimoNode.proximo = novoNode
            
        }
            // 3
        else{
            inicioLista = novoNode
        }
        // 4
        fimLista = novoNode
    }
    
    func removerTodos(){
        inicioLista = nil
        fimLista = nil
    }
    
    func removerNode(node:Node) ->Int{
        let prev = node.anterior
        let next = node.proximo
        
        
        if let prev = prev{
          // atualiza o ponteiro do proximo node se vc nao esta removendo o primeiro node
          prev.proximo = next
        
        }else{
            //atualiza o ponteiro do inicio da lista se vc esta removendo o primeiro node
            inicioLista = next
        }
        //atualiza o ponteiro anteriror do node para o ponteiro anterior do node que foi removido
        next?.anterior = prev
        
        
        if next == nil{
            //atualiza o fim da lista se vc esta removendo o ultimo node
            fimLista = prev
        }
        
        // colocar nil para os ponteiros do node que estamos removendo
        node.anterior = nil
        node.proximo = nil
        
        //retorna o valor do node removido
        return node.valor
    }
}

extension ListaLigada: CustomStringConvertible{
    public var description: String {
        var text = "["
        var node = inicioLista
        
        while node != nil{
            text += "\(node!.valor)"
            node = node!.proximo
            
            if node != nil {text += ", "}
        }
        return text + "]"
    }
    
    //retorno opcional pois podemos acessar um posicao que nao existe nó
    public func nodeEm(index: Int) -> Node?{
        if index >= 0 {
            var node = inicioLista
            var i = index
            
            while node != nil{
                //primeiro elemento
                if i == 0 {return node}
                i -= 1
                node = node!.proximo
            }
        }
     return nil
    }

}

let lista = ListaLigada()
lista.adicionar(valor: 2)
lista.adicionar(valor: 4)
lista.adicionar(valor: 7)
lista.adicionar(valor: 6)
lista.adicionar(valor: 4)
lista.adicionar(valor: 9)


var node = lista.nodeEm(index: 1)
node?.valor
lista.removerNode(node: node!)
print(lista)

lista.removerTodos()
print(lista)
