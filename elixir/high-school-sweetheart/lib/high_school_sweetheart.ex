defmodule HighSchoolSweetheart do
  def first_letter(name) do
    name
    |> String.trim
    |> String.first
  end

  def initial(name) do
    name
    |> first_letter
    |> String.capitalize
    |> Kernel.<>(".")
  end

  def initials(full_name) do
    [first, last] = String.split(full_name)
    initial(first) <> " " <> initial(last)
  end

  def pair(full_name1, full_name2) do
    heart = """
         ******       ******
       **      **   **      **
     **         ** **         **
    **            *            **
    **                         **
    **     X. X.  +  X. X.     **
     **                       **
       **                   **
         **               **
           **           **
             **       **
               **   **
                 ***
                  *
    """

    heart
    |> String.replace("X. X.  +  X. X.", "#{initials(full_name1)}  +  #{initials(full_name2)}")
  end
end
