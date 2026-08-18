# From the Deep

In this problem, you'll write freeform responses to the questions provided in the specification.

## Random Partitioning

Random partitioning would spread the observations across the boats, so the workload would be more evenly distributed even if AquaByte collects more observations at certain times. The downside is that a query for a specific time range could require checking all three boats, since the observations could be anywhere.

## Partitioning by Hour

Partitioning by hour makes it easier to find observations from a specific time range because we know which boat has them. However, the boats would not necessarily have the same amount of data, since AquaByte collects many observations between midnight and 1am, which would put more of the workload on Boat A.

## Partitioning by Hash Value

Partitioning by hash value would spread the observations more evenly across the boats, even when AquaByte collects more observations at certain times. The downside is that a query for a range of timestamps would probably need to check all three boats, although a query for one specific timestamp could use its hash value to find the correct boat.
