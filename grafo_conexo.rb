#Exercicio 3

#Gera um grafo conexo orientado

require 'pry'
require 'matrix'

class Matrix
  public :"[]=", :set_element, :set_component
end

class Node
  attr_reader :adjacency

  def initialize
    @adjacency = []
  end

  def set_edge(node)
    @adjacency << node
  end
end

class Graph
  attr_accessor :nodes, :matrix

  def initialize(n)
    @nodes = []
    @number = n
    @matrix = generate_graph
    (0..n-1).each do |i|
      @nodes << Node.new
    end
  end

  def generate_graph
    m1 = Matrix[]
    (0..@number-1).each do |n|
      a = Array.new(@number-1) { rand(0..1) }
      a << 1
      m1 = Matrix.rows(m1.to_a << a.shuffle )
    end
    return m1
  end

  def map_matrix
    (0..@number-1).each do |n|
      @matrix.row(n).each_with_index do |value, i|
        if value == 1
          @nodes[n].set_edge(i)
        end
      end    
    end
  end

  def print_matrix
    matrix.each_slice(matrix.column_size) {|r| p "#{r}"}
  end

end

op = ''

while op != 0
  p 'Selecione uma opcao'  
  p '1 - Gerar grafo conexo orientado'
  p '2 - Visualizar em matriz'
  p '0 - Sair'
  op = gets.chomp.to_i
  case op
  when 1
    p 'Informe o numero de vertices'
    n = gets.chomp.to_i
    g1 = Graph.new(n)
  when 2
    g1.print_matrix
  when 0
    break
  end
end