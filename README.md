# top_hash_map

Ruby implementation of a hash map, built to the specification of The Odin
Project.

## Assignment

Start by creating a HashMap class. Proceed to creaete the following methods:

1. #hash takes a value and produces a hash code with it. We did implement a
fairly good hash method in the previous lesson. You are free to use that, or if
you wish, you can conduct your own research. Beware this is a deep deep rabbit
hole.

2. Hash maps could accommodate various data types for keys like numbers, strings,
and even other hashes. But for this project, only handle keys of type strings.

3. #set takes two arguments, the first is a key and the second is a value that is
assigned to this key. If a key already exists, then the old value is
overwritten.

4. Remember to grow your buckets size when it needs to, by calculating if your
bucket has reached the load factor. #get takes one argument as a key and returns
the value that is assigned to this key. If key is not found, return nil.

5. #key? takes a key as an argument and returns true or false based on whether or
not the key is in the hash map.

6. #remove takes a key as an argument. If the given key is in the hash map, it
should remove the entry with that key and return the deleted entry’s value. If
the key isn’t in the hash map, it should return nil.

7. #length returns the number of stored keys in the hash map.

8. #clear removes all entries in the hash map.

9. #keys returns an array containing all the keys inside the hash map.

10. #values returns an array containing all the values.

11. #entries returns an array that contains each key, value pair. Example:
[[first_key, first_value], [second_key, second_value]]

- Remember that our hash map does not preserve insertion order when you are
retrieving your hash map’s data. It is normal and expected for keys and values
to appear out of the order you inserted them in.

## Extra Credit

Create a class HashSet that behaves the same as a HashMap but only contains keys
with no values.
