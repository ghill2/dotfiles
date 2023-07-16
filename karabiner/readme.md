{:des   "caps_lock to shift_tab when command held"
:rules [[:!Ccaps_lock :!CStab]]},
{:des   "caps_lock to esc when pressed alone, to ctrl when held"
:rules [[:##caps_lock :left_control nil {:alone :escape}]]},
{:des   "left_command to space when pressed alone, to command when held"
:rules [[:##left_command :left_command nil {:alone :spacebar}]]},
{:des   "left_option to delete when pressed alone, to option when held"
:rules [[:##left_option :left_option nil {:alone :delete_or_backspace}]]},


{
                                "description": "Hold caps_lock to hyper. Tap for escape.",
                                "from": {
                                    "key_code": "caps_lock",
                                    "modifiers": {
                                        "optional": [
                                            "any"
                                        ]
                                    }
                                },
                                "to_if_alone": [
                                    {
                                        "key_code": "escape"
                                    }
                                ],
                                "to_if_held_down": [
                                    {
                                        "key_code": "left_shift",
                                        "modifiers": [
                                            "left_command",
                                            "left_control",
                                            "left_option"
                                        ]
                                    }
                                ],
                                "type": "basic"
                            }
                        ]
                    },
                    {
                        "description": "when command is held down map caps_lock to shift+tab",
                        "manipulators": [
                            {
                                "from": {
                                    "key_code": "caps_lock",
                                    "modifiers": {
                                        "mandatory": [
                                            "left_command"
                                        ]
                                    }
                                },
                                "to": [
                                    {
                                        "key_code": "tab",
                                        "modifiers": [
                                            "left_shift",
                                            "left_command"
                                        ]
                                    }
                                ],
                                "type": "basic"
                            }
                        ]
                    }
                ]
            },