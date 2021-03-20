
# We have a listening device. lets us record something that is said and store it for later use.
# Listen for something, if anything is said, record it for later use. If nothing is said, then 
# do not record anything.
# Said things are retrieved by this listening device via a block.  If nothing is said, then no 
# block will be passed in. The listening device can also output the most recent recording using 
# a Device#play method.
# finish program so these specifications are met:

# listener = Device.new
# listener.listen { "Hello World!" }
# listener.listen
# listener.play # Outputs "Hello World!"


class Device
  def initialize
    @recordings = []
  end

  def record(recording)
    @recordings << recording
  end

  def listen
    if block_given?
      record(yield)
    end
  end

  def play
    puts @recordings.last
  end
end

listener = Device.new
listener.listen { "Hello World" }
listener.listen
listener.play# Hello World

# LS: similar
class Device
  def initialize
    @recordings = []
  end

  def record(recording)
    @recordings << recording
  end

  def listen
    return unless block_given?
    recording = yield
    record(recording)
  end

  # def listen
  #   recording = yield if block_given?
  #   record(recording) if recording
  # end
  # another option/type of guard clause

  def play
    puts @recordings.last
  end
  # if nothing was recorded, then the output will be nothing, if something was, then the string will be
  # outputted.
end

listener2 = Device.new
listener2.listen { "This is the Launch School example"}
listener2.play# This is the Launch School example

