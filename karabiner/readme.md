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
                        "description": "Remap key when command key is held down",
                        "manipulators": [
                            {
                                "from": {
                                    "key_code": "escape",
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