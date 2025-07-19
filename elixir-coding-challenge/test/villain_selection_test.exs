defmodule VillainSelectionTest do
  use ExUnit.Case

  describe "Scenario:" do
    test "case_1" do
      input = """
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
          }
        ]
      }
      """

      actual_result = VillainSelection.select(input)

      expected_result =
        {:ok, "{\"position\":{\"x\":0,\"y\":40},\"villains\":[\"Darth Vader\",\"Shir Khan\"]}"}

      assert actual_result == expected_result
    end

    test "case_2" do
      input = """
      {
        "attack_modes": [
          "furthest-first"
        ],
        "radar": [
          {
            "position": {
              "x": 0,
              "y": 20
            },
            "villains": [
              {
                "costume": "Joker",
                "malice": 30
              },
              {
                "costume": "Captain Hook",
                "malice": 80
              }
            ]
          },
          {
            "position": {
              "x": 0,
              "y": 80
            },
            "villains": [
              {
                "costume": "Voldemort",
                "malice": 20
              }
            ]
          }
        ]
      }
      """

      actual_result = VillainSelection.select(input)

      expected_result = {:ok, "{\"position\":{\"x\":0,\"y\":80},\"villains\":[\"Voldemort\"]}"}

      assert actual_result == expected_result
    end

    test "case_3" do
      input = """
      {
        "attack_modes": [
          "prioritize-vader"
        ],
        "radar": [
          {
            "position": {
              "x": 0,
              "y": 20
            },
            "villains": [
              {
                "costume": "Joker",
                "malice": 30
              },
              {
                "costume": "Captain Hook",
                "malice": 80
              }
            ]
          },
          {
            "position": {
              "x": 0,
              "y": 80
            },
            "villains": [
              {
                "costume": "Voldemort",
                "malice": 20
              }
            ]
          },
          {
            "position": {
              "x": 0,
              "y": 90
            },
            "villains": [
              {
                "costume": "Darth Vader",
                "malice": 20
              },
              {
                "costume": "Joker",
                "malice": 30
              },
              {
                "costume": "Captain Hook",
                "malice": 80
              }
            ]
          }
        ]
      }
      """

      actual_result = VillainSelection.select(input)

      expected_result =
        {:ok,
         "{\"position\":{\"x\":0,\"y\":90},\"villains\":[\"Darth Vader\",\"Captain Hook\",\"Joker\"]}"}

      assert actual_result == expected_result
    end

    test "case_4" do
      input = """
      {
        "attack_modes": [
          "avoid-crossfire"
        ],
        "radar": [
          {
            "position": {
              "x": 0,
              "y": 20
            },
            "villains": [
              {
                "costume": "Joker",
                "malice": 30
              },
              {
                "costume": "Captain Hook",
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
              "y": 80
            },
            "villains": [
              {
                "costume": "Voldemort",
                "malice": 20
              }
            ]
          },
          {
            "position": {
              "x": 0,
              "y": 70
            },
            "villains": [
              {
                "costume": "Darth Vader",
                "malice": 20
              },
              {
                "costume": "Joker",
                "malice": 90
              },
              {
                "costume": "Captain Hook",
                "malice": 80
              }
            ]
          }
        ]
      }
      """

      actual_result = VillainSelection.select(input)

      expected_result =
        {:ok,
         "{\"position\":{\"x\":0,\"y\":70},\"villains\":[\"Joker\",\"Captain Hook\",\"Darth Vader\"]}"}

      assert actual_result == expected_result
    end

    test "case_5" do
      input = """
      {
        "attack_modes": [
          "closest-first"
        ],
        "radar": [
          {
            "position": {
              "x": 89,
              "y": 13
            },
            "villains": [
              {
                "costume": "Darth Vader",
                "malice": 20
              },
              {
                "costume": "Joker",
                "malice": 90
              }
            ]
          },
          {
            "position": {
              "x": 11,
              "y": 35
            },
            "villains": [
              {
                "costume": "Darth Vader",
                "malice": 20
              },
              {
                "costume": "Joker",
                "malice": 90
              }
            ]
          },
          {
            "position": {
              "x": 19,
              "y": 49
            },
            "villains": [
              {
                "costume": "Darth Vader",
                "malice": 20
              },
              {
                "costume": "Joker",
                "malice": 90
              }
            ]
          },
          {
            "position": {
              "x": 38,
              "y": 21
            },
            "villains": [
              {
                "costume": "Darth Vader",
                "malice": 20
              },
              {
                "costume": "Joker",
                "malice": 90
              }
            ]
          },
          {
            "position": {
              "x": 10,
              "y": 39
            },
            "villains": [
              {
                "costume": "Darth Vader",
                "malice": 20
              },
              {
                "costume": "Joker",
                "malice": 90
              }
            ]
          },
          {
            "position": {
              "x": 13,
              "y": 38
            },
            "villains": [
              {
                "costume": "Darth Vader",
                "malice": 20
              },
              {
                "costume": "Joker",
                "malice": 90
              }
            ]
          },
          {
            "position": {
              "x": 13,
              "y": 15
            },
            "villains": [
              {
                "costume": "Darth Vader",
                "malice": 20
              },
              {
                "costume": "Joker",
                "malice": 90
              }
            ]
          },
          {
            "position": {
              "x": 30,
              "y": 19
            },
            "villains": [
              {
                "costume": "Darth Vader",
                "malice": 20
              },
              {
                "costume": "Joker",
                "malice": 90
              }
            ]
          },
          {
            "position": {
              "x": 30,
              "y": 11
            },
            "villains": [
              {
                "costume": "Darth Vader",
                "malice": 20
              },
              {
                "costume": "Joker",
                "malice": 90
              }
            ]
          },
          {
            "position": {
              "x": 15,
              "y": 19
            },
            "villains": [
              {
                "costume": "Darth Vader",
                "malice": 20
              },
              {
                "costume": "Joker",
                "malice": 90
              }
            ]
          },
          {
            "position": {
              "x": 22,
              "y": 15
            },
            "villains": [
              {
                "costume": "Darth Vader",
                "malice": 20
              },
              {
                "costume": "Joker",
                "malice": 90
              }
            ]
          },
          {
            "position": {
              "x": 10,
              "y": 19
            },
            "villains": [
              {
                "costume": "Darth Vader",
                "malice": 20
              },
              {
                "costume": "Joker",
                "malice": 90
              }
            ]
          },
          {
            "position": {
              "x": 94,
              "y": 11
            },
            "villains": [
              {
                "costume": "Darth Vader",
                "malice": 20
              },
              {
                "costume": "Joker",
                "malice": 90
              }
            ]
          },
          {
            "position": {
              "x": 10,
              "y": 19
            },
            "villains": [
              {
                "costume": "Darth Vader",
                "malice": 20
              },
              {
                "costume": "Joker",
                "malice": 90
              }
            ]
          },
          {
            "position": {
              "x": 90,
              "y": 18
            },
            "villains": [
              {
                "costume": "Darth Vader",
                "malice": 20
              },
              {
                "costume": "Joker",
                "malice": 90
              }
            ]
          },
          {
            "position": {
              "x": 80,
              "y": 51
            },
            "villains": [
              {
                "costume": "Darth Vader",
                "malice": 20
              },
              {
                "costume": "Joker",
                "malice": 90
              }
            ]
          },
          {
            "position": {
              "x": 70,
              "y": 91
            },
            "villains": [
              {
                "costume": "Darth Vader",
                "malice": 20
              },
              {
                "costume": "Joker",
                "malice": 90
              }
            ]
          },
          {
            "position": {
              "x": 30,
              "y": 11
            },
            "villains": [
              {
                "costume": "Darth Vader",
                "malice": 20
              },
              {
                "costume": "Joker",
                "malice": 90
              }
            ]
          },
          {
            "position": {
              "x": 30,
              "y": 95
            },
            "villains": [
              {
                "costume": "Darth Vader",
                "malice": 20
              },
              {
                "costume": "Joker",
                "malice": 90
              }
            ]
          },
          {
            "position": {
              "x": 1,
              "y": 89
            },
            "villains": [
              {
                "costume": "Darth Vader",
                "malice": 20
              },
              {
                "costume": "Joker",
                "malice": 90
              }
            ]
          },
          {
            "position": {
              "x": 3,
              "y": 11
            },
            "villains": [
              {
                "costume": "Darth Vader",
                "malice": 20
              },
              {
                "costume": "Joker",
                "malice": 90
              }
            ]
          },
          {
            "position": {
              "x": 54,
              "y": 19
            },
            "villains": [
              {
                "costume": "Darth Vader",
                "malice": 20
              },
              {
                "costume": "Joker",
                "malice": 90
              }
            ]
          },
          {
            "position": {
              "x": 22,
              "y": 38
            },
            "villains": [
              {
                "costume": "Darth Vader",
                "malice": 20
              },
              {
                "costume": "Joker",
                "malice": 90
              }
            ]
          },
          {
            "position": {
              "x": 3,
              "y": 10
            },
            "villains": [
              {
                "costume": "Darth Vader",
                "malice": 20
              },
              {
                "costume": "Joker",
                "malice": 90
              }
            ]
          },
          {
            "position": {
              "x": 43,
              "y": 13
            },
            "villains": [
              {
                "costume": "Darth Vader",
                "malice": 20
              },
              {
                "costume": "Joker",
                "malice": 90
              }
            ]
          },
          {
            "position": {
              "x": 51,
              "y": 13
            },
            "villains": [
              {
                "costume": "Darth Vader",
                "malice": 20
              },
              {
                "costume": "Joker",
                "malice": 90
              }
            ]
          },
          {
            "position": {
              "x": 91,
              "y": 30
            },
            "villains": [
              {
                "costume": "Darth Vader",
                "malice": 20
              },
              {
                "costume": "Joker",
                "malice": 90
              }
            ]
          },
          {
            "position": {
              "x": 11,
              "y": 30
            },
            "villains": [
              {
                "costume": "Darth Vader",
                "malice": 20
              },
              {
                "costume": "Joker",
                "malice": 90
              }
            ]
          },
          {
            "position": {
              "x": 91,
              "y": 15
            },
            "villains": [
              {
                "costume": "Darth Vader",
                "malice": 20
              },
              {
                "costume": "Joker",
                "malice": 90
              }
            ]
          },
          {
            "position": {
              "x": 51,
              "y": 22
            },
            "villains": [
              {
                "costume": "Darth Vader",
                "malice": 20
              },
              {
                "costume": "Joker",
                "malice": 90
              }
            ]
          },
          {
            "position": {
              "x": 91,
              "y": 10
            },
            "villains": [
              {
                "costume": "Darth Vader",
                "malice": 20
              },
              {
                "costume": "Joker",
                "malice": 90
              }
            ]
          },
          {
            "position": {
              "x": 11,
              "y": 84
            },
            "villains": [
              {
                "costume": "Darth Vader",
                "malice": 20
              },
              {
                "costume": "Joker",
                "malice": 90
              }
            ]
          },
          {
            "position": {
              "x": 91,
              "y": 65
            },
            "villains": [
              {
                "costume": "Darth Vader",
                "malice": 20
              },
              {
                "costume": "Joker",
                "malice": 90
              }
            ]
          },
          {
            "position": {
              "x": 81,
              "y": 53
            },
            "villains": [
              {
                "costume": "Darth Vader",
                "malice": 20
              },
              {
                "costume": "Joker",
                "malice": 90
              }
            ]
          },
          {
            "position": {
              "x": 15,
              "y": 70
            },
            "villains": [
              {
                "costume": "Darth Vader",
                "malice": 20
              },
              {
                "costume": "Joker",
                "malice": 90
              }
            ]
          },
          {
            "position": {
              "x": 19,
              "y": 83
            },
            "villains": [
              {
                "costume": "Darth Vader",
                "malice": 20
              },
              {
                "costume": "Joker",
                "malice": 90
              }
            ]
          },
          {
            "position": {
              "x": 11,
              "y": 46
            },
            "villains": [
              {
                "costume": "Darth Vader",
                "malice": 20
              },
              {
                "costume": "Joker",
                "malice": 90
              }
            ]
          },
          {
            "position": {
              "x": 59,
              "y": 26
            },
            "villains": [
              {
                "costume": "Darth Vader",
                "malice": 20
              },
              {
                "costume": "Joker",
                "malice": 90
              }
            ]
          },
          {
            "position": {
              "x": 98,
              "y": 57
            },
            "villains": [
              {
                "costume": "Darth Vader",
                "malice": 20
              },
              {
                "costume": "Joker",
                "malice": 90
              }
            ]
          },
          {
            "position": {
              "x": 11,
              "y": 58
            },
            "villains": [
              {
                "costume": "Darth Vader",
                "malice": 20
              },
              {
                "costume": "Joker",
                "malice": 90
              }
            ]
          },
          {
            "position": {
              "x": 91,
              "y": 39
            },
            "villains": [
              {
                "costume": "Darth Vader",
                "malice": 20
              },
              {
                "costume": "Joker",
                "malice": 90
              }
            ]
          },
          {
            "position": {
              "x": 83,
              "y": 37
            },
            "villains": [
              {
                "costume": "Darth Vader",
                "malice": 20
              },
              {
                "costume": "Joker",
                "malice": 90
              }
            ]
          },
          {
            "position": {
              "x": 0,
              "y": 11
            },
            "villains": [
              {
                "costume": "Darth Vader",
                "malice": 20
              },
              {
                "costume": "Joker",
                "malice": 90
              }
            ]
          }
        ]
      }
      """

      actual_result = VillainSelection.select(input)

      expected_result =
        {:ok, "{\"position\":{\"x\":3,\"y\":10},\"villains\":[\"Joker\",\"Darth Vader\"]}"}

      assert actual_result == expected_result
    end

    test "case_6" do
      input = """
      {
        "attack_modes": [
          "furthest-first"
        ],
        "radar": [
          {
            "position": {
              "x": 89,
              "y": 13
            },
            "villains": [
              {
                "costume": "Darth Vader",
                "malice": 20
              },
              {
                "costume": "Joker",
                "malice": 90
              }
            ]
          },
          {
            "position": {
              "x": 11,
              "y": 35
            },
            "villains": [
              {
                "costume": "Darth Vader",
                "malice": 20
              },
              {
                "costume": "Joker",
                "malice": 90
              }
            ]
          },
          {
            "position": {
              "x": 19,
              "y": 49
            },
            "villains": [
              {
                "costume": "Darth Vader",
                "malice": 20
              },
              {
                "costume": "Joker",
                "malice": 90
              }
            ]
          },
          {
            "position": {
              "x": 38,
              "y": 21
            },
            "villains": [
              {
                "costume": "Darth Vader",
                "malice": 20
              },
              {
                "costume": "Joker",
                "malice": 90
              }
            ]
          },
          {
            "position": {
              "x": 10,
              "y": 39
            },
            "villains": [
              {
                "costume": "Darth Vader",
                "malice": 20
              },
              {
                "costume": "Joker",
                "malice": 90
              }
            ]
          },
          {
            "position": {
              "x": 13,
              "y": 38
            },
            "villains": [
              {
                "costume": "Darth Vader",
                "malice": 20
              },
              {
                "costume": "Joker",
                "malice": 90
              }
            ]
          },
          {
            "position": {
              "x": 13,
              "y": 15
            },
            "villains": [
              {
                "costume": "Darth Vader",
                "malice": 20
              },
              {
                "costume": "Joker",
                "malice": 90
              }
            ]
          },
          {
            "position": {
              "x": 30,
              "y": 19
            },
            "villains": [
              {
                "costume": "Darth Vader",
                "malice": 20
              },
              {
                "costume": "Joker",
                "malice": 90
              }
            ]
          },
          {
            "position": {
              "x": 30,
              "y": 11
            },
            "villains": [
              {
                "costume": "Darth Vader",
                "malice": 20
              },
              {
                "costume": "Joker",
                "malice": 90
              }
            ]
          },
          {
            "position": {
              "x": 15,
              "y": 19
            },
            "villains": [
              {
                "costume": "Darth Vader",
                "malice": 20
              },
              {
                "costume": "Joker",
                "malice": 90
              }
            ]
          },
          {
            "position": {
              "x": 22,
              "y": 15
            },
            "villains": [
              {
                "costume": "Darth Vader",
                "malice": 20
              },
              {
                "costume": "Joker",
                "malice": 90
              }
            ]
          },
          {
            "position": {
              "x": 10,
              "y": 19
            },
            "villains": [
              {
                "costume": "Darth Vader",
                "malice": 20
              },
              {
                "costume": "Joker",
                "malice": 90
              }
            ]
          },
          {
            "position": {
              "x": 94,
              "y": 11
            },
            "villains": [
              {
                "costume": "Darth Vader",
                "malice": 20
              },
              {
                "costume": "Joker",
                "malice": 90
              }
            ]
          },
          {
            "position": {
              "x": 10,
              "y": 19
            },
            "villains": [
              {
                "costume": "Darth Vader",
                "malice": 20
              },
              {
                "costume": "Joker",
                "malice": 90
              }
            ]
          },
          {
            "position": {
              "x": 90,
              "y": 18
            },
            "villains": [
              {
                "costume": "Darth Vader",
                "malice": 20
              },
              {
                "costume": "Joker",
                "malice": 90
              }
            ]
          },
          {
            "position": {
              "x": 80,
              "y": 51
            },
            "villains": [
              {
                "costume": "Darth Vader",
                "malice": 20
              },
              {
                "costume": "Joker",
                "malice": 90
              }
            ]
          },
          {
            "position": {
              "x": 70,
              "y": 91
            },
            "villains": [
              {
                "costume": "Darth Vader",
                "malice": 20
              },
              {
                "costume": "Joker",
                "malice": 90
              }
            ]
          },
          {
            "position": {
              "x": 30,
              "y": 11
            },
            "villains": [
              {
                "costume": "Darth Vader",
                "malice": 20
              },
              {
                "costume": "Joker",
                "malice": 90
              }
            ]
          },
          {
            "position": {
              "x": 30,
              "y": 95
            },
            "villains": [
              {
                "costume": "Lucifer",
                "number": 20
              }
            ]
          },
          {
            "position": {
              "x": 1,
              "y": 89
            },
            "villains": [
              {
                "costume": "Darth Vader",
                "malice": 20
              },
              {
                "costume": "Joker",
                "malice": 90
              }
            ]
          },
          {
            "position": {
              "x": 3,
              "y": 11
            },
            "villains": [
              {
                "costume": "Darth Vader",
                "malice": 20
              },
              {
                "costume": "Joker",
                "malice": 90
              }
            ]
          },
          {
            "position": {
              "x": 54,
              "y": 19
            },
            "villains": [
              {
                "costume": "Darth Vader",
                "malice": 20
              },
              {
                "costume": "Joker",
                "malice": 90
              }
            ]
          },
          {
            "position": {
              "x": 22,
              "y": 38
            },
            "villains": [
              {
                "costume": "Darth Vader",
                "malice": 20
              },
              {
                "costume": "Joker",
                "malice": 90
              }
            ]
          },
          {
            "position": {
              "x": 3,
              "y": 10
            },
            "villains": [
              {
                "costume": "Darth Vader",
                "malice": 20
              },
              {
                "costume": "Joker",
                "malice": 90
              }
            ]
          },
          {
            "position": {
              "x": 43,
              "y": 13
            },
            "villains": [
              {
                "costume": "Darth Vader",
                "malice": 20
              },
              {
                "costume": "Joker",
                "malice": 90
              }
            ]
          },
          {
            "position": {
              "x": 51,
              "y": 13
            },
            "villains": [
              {
                "costume": "Darth Vader",
                "malice": 20
              },
              {
                "costume": "Joker",
                "malice": 90
              }
            ]
          },
          {
            "position": {
              "x": 91,
              "y": 30
            },
            "villains": [
              {
                "costume": "Darth Vader",
                "malice": 20
              },
              {
                "costume": "Joker",
                "malice": 90
              }
            ]
          },
          {
            "position": {
              "x": 11,
              "y": 30
            },
            "villains": [
              {
                "costume": "Darth Vader",
                "malice": 20
              },
              {
                "costume": "Joker",
                "malice": 90
              }
            ]
          },
          {
            "position": {
              "x": 91,
              "y": 15
            },
            "villains": [
              {
                "costume": "Darth Vader",
                "malice": 20
              },
              {
                "costume": "Joker",
                "malice": 90
              }
            ]
          },
          {
            "position": {
              "x": 51,
              "y": 22
            },
            "villains": [
              {
                "costume": "Darth Vader",
                "malice": 20
              },
              {
                "costume": "Joker",
                "malice": 90
              }
            ]
          },
          {
            "position": {
              "x": 91,
              "y": 10
            },
            "villains": [
              {
                "costume": "Darth Vader",
                "malice": 20
              },
              {
                "costume": "Joker",
                "malice": 90
              }
            ]
          },
          {
            "position": {
              "x": 11,
              "y": 84
            },
            "villains": [
              {
                "costume": "Darth Vader",
                "malice": 20
              },
              {
                "costume": "Joker",
                "malice": 90
              }
            ]
          },
          {
            "position": {
              "x": 91,
              "y": 65
            },
            "villains": [
              {
                "costume": "Darth Vader",
                "malice": 20
              },
              {
                "costume": "Joker",
                "malice": 90
              }
            ]
          },
          {
            "position": {
              "x": 81,
              "y": 53
            },
            "villains": [
              {
                "costume": "Darth Vader",
                "malice": 20
              },
              {
                "costume": "Joker",
                "malice": 90
              }
            ]
          },
          {
            "position": {
              "x": 15,
              "y": 70
            },
            "villains": [
              {
                "costume": "Darth Vader",
                "malice": 20
              },
              {
                "costume": "Joker",
                "malice": 90
              }
            ]
          },
          {
            "position": {
              "x": 19,
              "y": 83
            },
            "villains": [
              {
                "costume": "Darth Vader",
                "malice": 20
              },
              {
                "costume": "Joker",
                "malice": 90
              }
            ]
          },
          {
            "position": {
              "x": 11,
              "y": 46
            },
            "villains": [
              {
                "costume": "Darth Vader",
                "malice": 20
              },
              {
                "costume": "Joker",
                "malice": 90
              }
            ]
          },
          {
            "position": {
              "x": 59,
              "y": 26
            },
            "villains": [
              {
                "costume": "Darth Vader",
                "malice": 20
              },
              {
                "costume": "Joker",
                "malice": 90
              }
            ]
          },
          {
            "position": {
              "x": 98,
              "y": 57
            },
            "villains": [
              {
                "costume": "Darth Vader",
                "malice": 20
              },
              {
                "costume": "Joker",
                "malice": 90
              }
            ]
          },
          {
            "position": {
              "x": 11,
              "y": 58
            },
            "villains": [
              {
                "costume": "Darth Vader",
                "malice": 20
              },
              {
                "costume": "Joker",
                "malice": 90
              }
            ]
          },
          {
            "position": {
              "x": 91,
              "y": 39
            },
            "villains": [
              {
                "costume": "Darth Vader",
                "malice": 20
              },
              {
                "costume": "Joker",
                "malice": 90
              }
            ]
          },
          {
            "position": {
              "x": 83,
              "y": 37
            },
            "villains": [
              {
                "costume": "Darth Vader",
                "malice": 20
              },
              {
                "costume": "Joker",
                "malice": 90
              }
            ]
          },
          {
            "position": {
              "x": 0,
              "y": 11
            },
            "villains": [
              {
                "costume": "Darth Vader",
                "malice": 20
              },
              {
                "costume": "Joker",
                "malice": 90
              }
            ]
          }
        ]
      }
      """

      actual_result = VillainSelection.select(input)

      expected_result =
        {:ok, "{\"position\":{\"x\":70,\"y\":91},\"villains\":[\"Joker\",\"Darth Vader\"]}"}

      assert actual_result == expected_result
    end

    test "case_7" do
      input = """
      {
        "attack_modes": [
          "furthest-first",
          "avoid-crossfire"
        ],
        "radar": [
          {
            "position": {
              "x": 89,
              "y": 13
            },
            "villains": [
              {
                "costume": "Darth Vader",
                "malice": 20
              },
              {
                "costume": "Joker",
                "malice": 90
              }
            ]
          },
          {
            "position": {
              "x": 11,
              "y": 35
            },
            "villains": [
              {
                "costume": "Darth Vader",
                "malice": 20
              },
              {
                "costume": "Joker",
                "malice": 90
              }
            ]
          },
          {
            "position": {
              "x": 19,
              "y": 49
            },
            "villains": [
              {
                "costume": "Darth Vader",
                "malice": 20
              },
              {
                "costume": "Joker",
                "malice": 90
              }
            ]
          },
          {
            "position": {
              "x": 38,
              "y": 21
            },
            "villains": [
              {
                "costume": "Darth Vader",
                "malice": 20
              },
              {
                "costume": "Joker",
                "malice": 90
              }
            ]
          },
          {
            "position": {
              "x": 10,
              "y": 39
            },
            "villains": [
              {
                "costume": "Darth Vader",
                "malice": 20
              },
              {
                "costume": "Joker",
                "malice": 90
              }
            ]
          },
          {
            "position": {
              "x": 13,
              "y": 38
            },
            "villains": [
              {
                "costume": "Darth Vader",
                "malice": 20
              },
              {
                "costume": "Joker",
                "malice": 90
              }
            ]
          },
          {
            "position": {
              "x": 13,
              "y": 15
            },
            "villains": [
              {
                "costume": "Darth Vader",
                "malice": 20
              },
              {
                "costume": "Joker",
                "malice": 90
              }
            ]
          },
          {
            "position": {
              "x": 30,
              "y": 19
            },
            "villains": [
              {
                "costume": "Darth Vader",
                "malice": 20
              },
              {
                "costume": "Joker",
                "malice": 90
              }
            ]
          },
          {
            "position": {
              "x": 30,
              "y": 11
            },
            "villains": [
              {
                "costume": "Darth Vader",
                "malice": 20
              },
              {
                "costume": "Joker",
                "malice": 90
              }
            ]
          },
          {
            "position": {
              "x": 15,
              "y": 19
            },
            "villains": [
              {
                "costume": "Darth Vader",
                "malice": 20
              },
              {
                "costume": "Joker",
                "malice": 90
              }
            ]
          },
          {
            "position": {
              "x": 22,
              "y": 15
            },
            "villains": [
              {
                "costume": "Darth Vader",
                "malice": 20
              },
              {
                "costume": "Joker",
                "malice": 90
              }
            ]
          },
          {
            "position": {
              "x": 10,
              "y": 19
            },
            "villains": [
              {
                "costume": "Darth Vader",
                "malice": 20
              },
              {
                "costume": "Joker",
                "malice": 90
              }
            ]
          },
          {
            "position": {
              "x": 94,
              "y": 11
            },
            "villains": [
              {
                "costume": "Darth Vader",
                "malice": 20
              },
              {
                "costume": "Joker",
                "malice": 90
              }
            ]
          },
          {
            "position": {
              "x": 10,
              "y": 19
            },
            "villains": [
              {
                "costume": "Darth Vader",
                "malice": 20
              },
              {
                "costume": "Joker",
                "malice": 90
              }
            ]
          },
          {
            "position": {
              "x": 90,
              "y": 18
            },
            "villains": [
              {
                "costume": "Darth Vader",
                "malice": 20
              },
              {
                "costume": "Joker",
                "malice": 90
              }
            ]
          },
          {
            "position": {
              "x": 80,
              "y": 51
            },
            "villains": [
              {
                "costume": "Darth Vader",
                "malice": 20
              },
              {
                "costume": "Joker",
                "malice": 90
              }
            ]
          },
          {
            "position": {
              "x": 70,
              "y": 91
            },
            "villains": [
              {
                "costume": "Darth Vader",
                "malice": 20
              },
              {
                "costume": "Joker",
                "malice": 90
              }
            ]
          },
          {
            "position": {
              "x": 30,
              "y": 11
            },
            "villains": [
              {
                "costume": "Darth Vader",
                "malice": 20
              },
              {
                "costume": "Joker",
                "malice": 90
              }
            ]
          },
          {
            "position": {
              "x": 30,
              "y": 95
            },
            "villains": [
              {
                "costume": "Lucifer",
                "malice": 20
              }
            ]
          },
          {
            "position": {
              "x": 1,
              "y": 89
            },
            "villains": [
              {
                "costume": "Darth Vader",
                "malice": 20
              },
              {
                "costume": "Joker",
                "malice": 90
              }
            ]
          },
          {
            "position": {
              "x": 3,
              "y": 11
            },
            "villains": [
              {
                "costume": "Darth Vader",
                "malice": 20
              },
              {
                "costume": "Joker",
                "malice": 90
              }
            ]
          },
          {
            "position": {
              "x": 54,
              "y": 19
            },
            "villains": [
              {
                "costume": "Darth Vader",
                "malice": 20
              },
              {
                "costume": "Joker",
                "malice": 90
              }
            ]
          },
          {
            "position": {
              "x": 22,
              "y": 38
            },
            "villains": [
              {
                "costume": "Darth Vader",
                "malice": 20
              },
              {
                "costume": "Joker",
                "malice": 90
              }
            ]
          },
          {
            "position": {
              "x": 3,
              "y": 10
            },
            "villains": [
              {
                "costume": "Darth Vader",
                "malice": 20
              },
              {
                "costume": "Joker",
                "malice": 90
              }
            ]
          },
          {
            "position": {
              "x": 43,
              "y": 13
            },
            "villains": [
              {
                "costume": "Darth Vader",
                "malice": 20
              },
              {
                "costume": "Joker",
                "malice": 90
              }
            ]
          },
          {
            "position": {
              "x": 51,
              "y": 13
            },
            "villains": [
              {
                "costume": "Darth Vader",
                "malice": 20
              },
              {
                "costume": "Joker",
                "malice": 90
              }
            ]
          },
          {
            "position": {
              "x": 91,
              "y": 30
            },
            "villains": [
              {
                "costume": "Darth Vader",
                "malice": 20
              },
              {
                "costume": "Joker",
                "malice": 90
              }
            ]
          },
          {
            "position": {
              "x": 11,
              "y": 30
            },
            "villains": [
              {
                "costume": "Darth Vader",
                "malice": 20
              },
              {
                "costume": "Joker",
                "malice": 90
              }
            ]
          },
          {
            "position": {
              "x": 91,
              "y": 15
            },
            "villains": [
              {
                "costume": "Darth Vader",
                "malice": 20
              },
              {
                "costume": "Joker",
                "malice": 90
              }
            ]
          },
          {
            "position": {
              "x": 51,
              "y": 22
            },
            "villains": [
              {
                "costume": "Darth Vader",
                "malice": 20
              },
              {
                "costume": "Joker",
                "malice": 90
              }
            ]
          },
          {
            "position": {
              "x": 91,
              "y": 10
            },
            "villains": [
              {
                "costume": "Darth Vader",
                "malice": 20
              },
              {
                "costume": "Joker",
                "malice": 90
              }
            ]
          },
          {
            "position": {
              "x": 11,
              "y": 84
            },
            "villains": [
              {
                "costume": "Darth Vader",
                "malice": 20
              },
              {
                "costume": "Joker",
                "malice": 90
              }
            ]
          },
          {
            "position": {
              "x": 91,
              "y": 65
            },
            "villains": [
              {
                "costume": "Darth Vader",
                "malice": 20
              },
              {
                "costume": "Joker",
                "malice": 90
              }
            ]
          },
          {
            "position": {
              "x": 81,
              "y": 53
            },
            "villains": [
              {
                "costume": "Darth Vader",
                "malice": 20
              },
              {
                "costume": "Joker",
                "malice": 90
              }
            ]
          },
          {
            "position": {
              "x": 15,
              "y": 70
            },
            "villains": [
              {
                "costume": "Darth Vader",
                "malice": 20
              },
              {
                "costume": "Joker",
                "malice": 90
              }
            ]
          },
          {
            "position": {
              "x": 19,
              "y": 83
            },
            "villains": [
              {
                "costume": "Darth Vader",
                "malice": 20
              },
              {
                "costume": "Joker",
                "malice": 90
              }
            ]
          },
          {
            "position": {
              "x": 11,
              "y": 46
            },
            "villains": [
              {
                "costume": "Darth Vader",
                "malice": 20
              },
              {
                "costume": "Joker",
                "malice": 90
              }
            ]
          },
          {
            "position": {
              "x": 59,
              "y": 26
            },
            "villains": [
              {
                "costume": "Darth Vader",
                "malice": 20
              },
              {
                "costume": "Joker",
                "malice": 90
              }
            ]
          },
          {
            "position": {
              "x": 98,
              "y": 57
            },
            "villains": [
              {
                "costume": "Darth Vader",
                "malice": 20
              },
              {
                "costume": "Joker",
                "malice": 90
              }
            ]
          },
          {
            "position": {
              "x": 11,
              "y": 58
            },
            "villains": [
              {
                "costume": "Darth Vader",
                "malice": 20
              },
              {
                "costume": "Joker",
                "malice": 90
              }
            ]
          },
          {
            "position": {
              "x": 91,
              "y": 39
            },
            "villains": [
              {
                "costume": "Darth Vader",
                "malice": 20
              },
              {
                "costume": "Joker",
                "malice": 90
              }
            ]
          },
          {
            "position": {
              "x": 83,
              "y": 37
            },
            "villains": [
              {
                "costume": "Darth Vader",
                "malice": 20
              },
              {
                "costume": "Joker",
                "malice": 90
              }
            ]
          },
          {
            "position": {
              "x": 0,
              "y": 11
            },
            "villains": [
              {
                "costume": "Darth Vader",
                "malice": 20
              },
              {
                "costume": "Joker",
                "malice": 90
              }
            ]
          }
        ]
      }
      """

      actual_result = VillainSelection.select(input)

      expected_result =
        {:ok, "{\"position\":{\"x\":70,\"y\":91},\"villains\":[\"Joker\",\"Darth Vader\"]}"}

      assert actual_result == expected_result
    end
  end

  test "case_8" do
    input = """
    {
      "attack_modes": [
        "unsupported-mode"
      ],
      "radar": [
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
        }
      ]
    }
    """

    actual_result = VillainSelection.select(input)

    assert {:error, _} = actual_result
  end

  test "case_9" do
    input = """
    {
      "attack_modes": [
        "closest-first"
      ],
      "radar": [
        {
          "position": {
            "x": 0,
            "y": 60
          },
          "villains": [
            {
              "costume": "Darth Vader",
              "malice": -80
            }
          ]
        }
      ]
    }
    """

    actual_result = VillainSelection.select(input)

    assert {:error, _} = actual_result
  end

  test "case_10" do
    input = """
    {
      "attack_modes": [
        "closest-first"
      ],
      "radar": [
        {
          "villains": [
            {
              "costume": "Shir Khan",
              "malice": 30
            }
          ]
        }
      ]
    }
    """

    actual_result = VillainSelection.select(input)

    assert {:error, _} = actual_result
  end
end
