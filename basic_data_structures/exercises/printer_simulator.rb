require_relative '../queue.rb'

# Exercise: model & simulate a printer queue

class Printer

  def initialize(pages_per_minute)
    @pages_per_minute = pages_per_minute
    @current_task = nil
    @time_remaining = 0
  end

  def tick
    if @current_task
      @time_remaining -= 1
      @current_task = nil if @time_remaining <= 0
    end
  end

  def busy?
    !@current_task.nil?
  end

  def start_next(next_task)
    @current_task = next_task
    @time_remaining = next_task.pages * 60/@pages_per_minute
  end

end

class Task

  attr_reader :pages

  def initialize(created_at_time)
    @created_at_time = created_at_time
    @pages = rand(1..21)
  end

  def time_waited_til_start(start_time)
    start_time - @created_at_time
  end

end

class PrinterSimulation

  def initialize(number_of_seconds, pages_per_minute)
    @number_of_seconds = number_of_seconds
    @printer = Printer.new(pages_per_minute)
    @print_queue = Queue.new
    @waiting_times = []
  end

  def run
    seconds = (0..@number_of_seconds).to_a

    seconds.each do |current_second|
      if time_for_new_print_task?
        task = Task.new(current_second)
        @print_queue.enqueue(task)
      end

      if printer_is_free_and_next_task_available?
        next_task = @print_queue.dequeue

        time_waited = next_task.time_waited_til_start(current_second)
        @waiting_times.push(time_waited)

        @printer.start_next(next_task)
      end

      @printer.tick
    end

    average_wait_time = @waiting_times.inject(0, :+) / @waiting_times.size
    puts "Average Wait: #{average_wait_time} seconds, #{@print_queue.size} tasks remain."
  end

  private

  def time_for_new_print_task?
    random_number = rand(1..181)
    random_number >= 180
  end

  def printer_is_free_and_next_task_available?
    !@printer.busy? and !@print_queue.is_empty?
  end

end

puts "Running Printer Simulation..."

10.times do
  PrinterSimulation.new(6_000, 5).run
end
