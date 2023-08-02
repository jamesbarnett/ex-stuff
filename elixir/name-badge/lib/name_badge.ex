defmodule NameBadge do
  def print(id, name, department) do
    id_string = if id != nil do
      "[#{id}] - "
    else
      ""
    end

    dept_string = if department != nil do
      "#{String.upcase(department)}"
    else
      "OWNER"
    end

    "#{id_string}#{name} - #{dept_string}"
  end
end
