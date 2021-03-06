def select_books_titles_and_years_in_first_series_order_by_year
  "SELECT title, year
   FROM books
   WHERE series_id = 1
   ORDER BY year"
end

def select_name_and_motto_of_char_with_longest_motto
  "SELECT name, motto
   FROM characters
   WHERE motto IN (SELECT motto FROM characters ORDER BY motto LIMIT 1);"
end

def select_value_and_count_of_most_prolific_species
  "SELECT species, COUNT(species)
   FROM characters
   WHERE species IN (SELECT species FROM characters ORDER BY species DESC LIMIT 1);"
end

def select_name_and_series_subgenres_of_authors
  "SELECT authors.name, subgenres.name
   FROM ((authors
   INNER JOIN subgenres ON series.subgenre_id = subgenres.id)
   INNER JOIN series ON authors.id = series.author_id);"
end

def select_series_title_with_most_human_characters
  "SELECT title
   FROM series
   INNER JOIN characters ON series.id = characters.series_id
   WHERE species = 'human'
   ORDER BY species DESC LIMIT 1"
end

def select_character_names_and_number_of_books_they_are_in
  "SELECT characters.name, COUNT(character_books.character_id)
   FROM characters
   INNER JOIN character_books ON characters.id = character_books.character_id
   WHERE character_id IN (SELECT character_id FROM character_books ORDER BY character_id)
   GROUP BY character_id
   ORDER BY COUNT(character_books.character_id) DESC, characters.name"
end
