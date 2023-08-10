defmodule RobotSimulator do
  @type robot() :: any()
  @type direction() :: :north | :east | :south | :west
  @type position() :: {integer(), integer()}
  
  defmodule Robot do
    defstruct direction: :north, position: {0, 0}
  end

  @doc """
  Create a Robot Simulator given an initial direction and position.

  Valid directions are: `:north`, `:east`, `:south`, `:west`
  """
  @spec create(direction, position) :: robot() | {:error, String.t()}
  def create(direction \\ :north, position \\ {0, 0}) do
    if not is_nil(direction) and direction not in [:north, :east, :south, :west] do
      {:error, "invalid direction"}
    else
      if not position_valid?(position) do
        {:error, "invalid position"}
      else
        %Robot{ direction: direction, position: position }
      end
    end
  end

  @doc """
  Simulate the robot's movement given a string of instructions.

  Valid instructions are: "R" (turn right), "L", (turn left), and "A" (advance)
  """
  @spec simulate(robot, instructions :: String.t()) :: robot() | {:error, String.t()}
  def simulate(robot, instructions) do
    if instructions_valid?(instructions) do
      List.foldl(String.graphemes(instructions),
        %Robot{ direction: robot.direction, position: robot.position }, fn ch, acc -> 
        case ch do
          "R" -> turn_right(acc)
          "L" -> turn_left(acc)
          "A" -> advance(acc)
        end
      end)
    else
      {:error, "invalid instruction"}
    end
  end

  @doc """
  Return the robot's direction.

  Valid directions are: `:north`, `:east`, `:south`, `:west`
  """
  @spec direction(robot) :: direction()
  def direction(robot) do
    Map.fetch!(robot, :direction)
  end

  @doc """
  Return the robot's position.
  """
  @spec position(robot) :: position()
  def position(robot) do
    Map.fetch!(robot, :position)
  end

  defp turn_right(robot) do
    case robot.direction do
      :north -> %Robot{ robot | direction: :east }
      :east -> %Robot{ robot | direction: :south }
      :south -> %Robot{ robot | direction: :west }
      :west -> %Robot{ robot | direction: :north }
    end
  end

  defp turn_left(robot) do
    case robot.direction do
      :north -> %Robot{ robot | direction: :west }
      :east -> %Robot{ robot | direction: :north }
      :south -> %Robot{ robot | direction: :east }
      :west -> %Robot{ robot | direction: :south }
    end
  end

  defp advance(robot) do
    case robot.direction do
      :north -> 
        %{ robot | position: {elem(robot.position, 0), elem(robot.position, 1) + 1}}
      :east -> 
        %{ robot | position: {elem(robot.position, 0) + 1, elem(robot.position, 1)}}
      :south -> 
        %{ robot | position: {elem(robot.position, 0), elem(robot.position, 1) - 1}}
      :west -> 
        %{ robot | position: {elem(robot.position, 0) - 1, elem(robot.position, 1)}}
    end 
  end

  defp position_valid?(position) do
    is_tuple(position) and tuple_size(position) == 2
      and is_integer(elem(position, 0)) and is_integer(elem(position, 1))
  end

  defp instructions_valid?(instructions) do
    instructions
    |> String.graphemes()
    |> Enum.all?(fn ch -> ch in ["R", "L", "A"] end)
  end
end
