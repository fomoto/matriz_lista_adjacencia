#Exercícios 1 ao 2

#Grafo nao-direcionado

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
    @matrix = Matrix.build(n, n) {|row, col| rand(2) }
    build_adjacency_matrix
    @number = n
    (0..n-1).each do |i|
      @nodes << Node.new
    end
  end

  def build_adjacency_matrix
    @matrix.each_with_index do |v,row,col|
      if row > col
        @matrix[row,col] = @matrix[col,row]
      end
    end
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

  def print_list
    @nodes.each do |n|
      print "v#{@nodes.index(n)}"
      n.adjacency.each do |ad|
        print " => v#{ad}"
      end
      print "\n"
    end
  end

  def get_adjacency_nodes(node)
    unless @nodes[node].nil?
      @nodes[node].adjacency.each { |n| print " v#{n}" }
    else
      p 'Não há vértices adjacentes'
    end
  end

  def verify_edge(v1,v2)
    @nodes[v1].adjacency.include?(v2) ? 'Possui aresta' : 'Não possui aresta'
  end

end

op = ''

while op != 'z'
  print "\nSelecione uma opcao\n"
  p 'a - Gerar matriz de adjacencia'
  p 'b - Visualizar em matriz de adjacencia'
  p 'c - Visualizar vertices adjacentes de um vertice'
  p 'd - Verificar a existencia de aresta'
  p 'e - Ver o grau de um vertice'
  p 'f - Visualizar em lista de adjacencia'
  p 'z - Sair'
  op = gets.chomp
  case op
    when 'a'
      p 'Informe o numero de vertices'
      n = gets.chomp.to_i
      g1 = Graph.new(n)
      g1.map_matrix
    when 'b'
      g1.print_matrix
    when 'c'
      print "Selecione o vértice\n"
      (0..g1.nodes.count-1).each do |i|
        print "#{i} - v#{i}\n"
      end
      n = gets.chomp.to_i
      g1.get_adjacency_nodes(n)
    when 'd'
      p 'Selecione o primeiro vertice'
      (0..g1.nodes.count-1).each do |i|
        print "#{i} - v#{i}\n"
      end
      v1 = gets.chomp.to_i
      p 'Selecione o segundo vertice'
      (0..g1.nodes.count-1).each do |i|
        print "#{i} - v#{i}\n"
      end
      v2 = gets.chomp.to_i
      p g1.verify_edge(v1,v2)
    when 'e'
      p 'Selecione o vertice'
      (0..g1.nodes.count-1).each do |i|
        print "#{i} - v#{i}\n"
      end
      v = gets.chomp.to_i
      p "Grau: #{g1.nodes[v].adjacency.count}"
    when 'f'
      g1.print_list
    when 'z'
      break
  end
end
