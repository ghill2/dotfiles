from open import parse_text
from open import from_clipboard

def test_parse_text():
    text = "Enqueue method walkthrough - video://7.305 Queues List-based implementation.mp4 196"
    expected = ("7.305 Queues List-based implementation.mp4", 196)
    assert parse_text(text) == expected

    text = "[mylink](Enqueue method walkthrough - video://7.305 Queues List-based implementation.mp4 196)"
    assert parse_text(text) == expected

    text =  """
            Enqueue method walkthrough - video://7.305 Queues List-based implementation.mp4 196
            Additional text on the next line
            """
    assert parse_text(text) == expected

if __name__ == "__main__":
    # test_parse_text()
    from_clipboard()
