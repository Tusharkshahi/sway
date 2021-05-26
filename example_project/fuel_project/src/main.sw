script;
struct Rgb {
  red: u64,
  green: u64,
  blue: u64,
}

trait Color {
  fn rgb(self) -> Rgb;
}

enum PrimaryColor {
   Red : (),
   Green : (),
   Blue : ()
}

impl Color for PrimaryColor {
  // TODO: when we support match statements, change this to a match statement
  fn rgb(self) -> Rgb {
    if self == PrimaryColor::Red {
      Rgb {
        red: 255,
        blue: 0,
        green: 0,
      }
    }
    else if self == PrimaryColor::Green {
      Rgb {
        red: 0,
        blue: 0,
        green: 255,
      }
    }
    else if self == PrimaryColor::Blue {
      Rgb {
        red: 0,
        blue: 255,
        green: 0,
      }
    }
    else {
      Rgb {
        red: 0,
        blue: 0,
        green: 0
      }
    }
  }
}

fn main() {
  let first_color = PrimaryColor::Green;
  let rgb: Rgb = first_color.rgb();
}