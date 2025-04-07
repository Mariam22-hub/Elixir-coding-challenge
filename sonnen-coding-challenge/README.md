Dear comic fan,

You're invited to a carnival party with the motto "comic-heroes". Some guests
dressed up as all the heroes you've admired being a child, especially as Donald
Duck. Other guests obviously celebrate the comic villains. That can't be! 

Your skills and knowledge of cream pies and physics are remarkable. That is why
we need your help to modify a cream pie thrower to show the villains who is
winning tonight. :) 

Your **mission** will consist of reprogramming the **villains selection
module**. This module is responsible for selecting the next position to attack
given several possible attack positions. 

The objective of the mission is to develop `VillainSelection.select/1` function
that accepts a json string and returns a json string.

This is an example of a request from the control unit to your module:

```json
{
  "attack_modes": [
    "closest-first"
  ],
  "radar": [
    {
      "position": {
        "x": 0,
        "y": 40
      },
      "villains": [
        {
          "costume": "Shir Khan",
          "malice": 30
        },
        {
          "costume": "Darth Vader",
          "malice": 80
        },
        {
          "costume": "Donald Duck"
        }
      ]
    },
    {
      "position": {
        "x": 0,
        "y": 60
      },
      "villains": [
        {
          "costume": "Darth Vader",
          "malice": 80
        }
      ]
    },
    ...
  ]
}
```

And here's a definition of the properties:

- **attack_modes**: Chosen mode(s) for the attack.
- **radar**
  - **position**: Target group position.
    - **x**: X coordinate.
    - **y**: Y coordinate.
  - **villains**: Found villains.
    - **costume**: Costume type.
    - **malice**: The malice of the villain (0-100). 

Given the previous request, your module should return a json string like this:

```json
{"position": {"x": 0, "y": 40}, "villains": ["Shir Khan", "Voldemort"]}
```

The attack modes we have implemented in the cream pie thrower are:

- **closest-first**: Attack the nearest area.
- **furthest-first**: Attack the furthest area.
- **avoid-crossfire**: Do not attack any area where Donald Duck costume is present.
- **prioritize-vader**: The attack must always prioritize Darth Vader costumes.

Costumes that the vision system will detect are:

- **Donald Duck**
- **Shir Khan**
- **Joker**
- **Darth Vader**
- **Lucifer**
- **Captain Hook**
- **Voldemort**

Keep in mind that attack modes can be chained but you should not chain opposite
attack modes, like closest-first and furthest-first. Example

```elixir
[%{"attack_modes" => ["closest-first", "prioritize-vader"], "radar" => ...
```

New guests will show up at the party and dress like other comic villains; the
system should be prepared to add new attack modes.

By running `mix test` on your machine, you will have access to a set of cases to 
prove your villains selection module, present in the
`test/villain_selection_test.exs` file. Feel free to add more unit tests.

## Submission

Please clone the repository locally. Then create a new private repository inside
your own account and push your solution there. To submit, add the Github accounts
mentioned in the mail as [collaborators][1].

Please add to repository any document that you have generated to solve the
problem even if it is just a text file, a diagram, git commits etc. because we
would like to see your problem-solving approach, not only the final solution.

[1]: https://docs.github.com/en/account-and-profile/setting-up-and-managing-your-personal-account-on-github/managing-access-to-your-personal-repositories/inviting-collaborators-to-a-personal-repository
