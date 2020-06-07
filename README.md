### The problem consist to find the lowest cost to cover a set of buildings with different heights using banners. You can cover the buildings with one or two banners.

### The set of buildings is represented with an array where each value is the height of the building. Your job is to find the lowest cost to cover the buildings.

Input example:

```bash
[5, 3, 2, 4]
```

The cost to cover the buildings using a single banner is:

```bash
biggest_height * amount of buildings
```

Which is:

```bash
5 * 4 = 20
```

For two banner your challange is to find the lowest cost, in this case, getting the first building and cover it with the first banner and the other buildings with the second banner:

```bash
(biggest_height * buildings_covered) + (biggest_height * buildings_covered)
```

```bash
first_banner_cost = 5 * 1
second_banner_cost = 4 * 3
total_cost = 17
```

In this case, using two banner the cost is 17 and one banner 20, thus the lowest cost is 17

Another test cases:

```bash
[5, 3, 2, 4]               == 17
[7, 7, 3, 7, 7]            == 35
[5, 3, 5, 2, 1]            == 19
[3, 1, 4]                  == 10
[3, 5, 7, 5, 10, 5, 3, 5]  == 65
[1, 1, 7, 6, 6, 6]         == 30
```

### Run the code:

```bash
ruby main.rb
```
