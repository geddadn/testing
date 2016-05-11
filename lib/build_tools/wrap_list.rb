require 'json'

module BuildTools
  class << self

    # @param [Array<String>] items
    # @param [String] indent
    # @return [String]
    def wrap_list(items:, indent:, max_length: 80)
      lines = [indent]
      items.each.with_index do |item, n|
        if n == 0
          lines[-1] += "#{item},"
        elsif (lines[-1] + " #{item}#{comma(n, items)}").length < max_length
          lines[-1] += " #{item}#{comma(n, items)}"
        else
          lines[-1] += "\n"
          lines << indent
          lines[-1] += "#{item}#{comma(n, items)}"
        end
      end
      lines.join.rstrip
    end

    private

    def comma(n, items)
      n < items.length - 1 ? ',' : ''
    end

  end
end
