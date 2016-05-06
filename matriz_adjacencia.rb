require 'pry'
require 'matrix'

#Matriz de adjacencia de um Grafo Direcionado

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
  attr_reader :nodes, :matrix

  def initialize(n)
    @nodes = []
    @matrix = Matrix.build(n, n) {|row, col| rand(2) }
    @number = n
  end

  def map_matrix
    (0..@number-1).each do |n|
      @nodes << Node.new
      @matrix.row(n).each_with_index do |value, i|
        if value == 1
          @nodes[n].set_edge(i)
        end
      end    
    end
  end

  def print_matrix
    matrix.each_slice(matrix.column_size) {|r| p r}
  end

  def get_adjacency_nodes(node)
    @nodes[node].adjacency.each { |n| p n.to_s.prepend('v') }
  end



end

binding.pry
