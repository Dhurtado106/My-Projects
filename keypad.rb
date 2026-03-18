require 'io/console'

# --- LAYER 7: OSI REFERENCE DATA ---
def show_osi
  puts "OSI MODEL REFERENCE"
  puts "7 Application  | Data     | Network Process (HTTP, SSH)"
  puts "6 Presentation | Data     | Encryption & Format (SSL, JPEG)"
  puts "5 Session      | Data     | Interhost Comm (RPC)"
  puts "4 Transport    | Segments | Reliability (TCP, UDP)"
  puts "3 Network      | Packets  | Routing & IP (IP, ICMP)"
  puts "2 Data Link    | Frames   | MAC Addressing (Ethernet)"
  puts "1 Physical     | Bits     | Physical Media (Cables)"
  puts "--------------------------------------------------------"
  puts "PRESS ANY KEY TO START PAC-MAN GRID..."
  STDIN.getch
end

# --- GAME CONFIGURATION ---
grid = [
  [1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1],
  [1, 2, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 1],
  [1, 0, 1, 1, 1, 0, 1, 0, 1, 1, 1, 1, 1, 0, 1],
  [1, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 1],
  [1, 0, 1, 0, 1, 1, 1, 0, 1, 1, 1, 0, 1, 0, 1],
  [1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1],
  [1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1]
]

# Starting coordinates for Pac-Man (y, x)
py, px = 1, 1

# --- CORE LOGIC ---
show_osi

loop do
  system("clear")
  puts "COMMAND: [W/A/S/D] to Move | [Q] to Quit"
  
  # Draw the Grid (Layer 6: Presentation)
  grid.each do |row|
    line = ""
    row.each do |cell|
      case cell
      when 1 then line += "██" # White Square (Wall)
      when 0 then line += "  " # Black Square (Path)
      when 2 then line += "CC" # Pac-Man
      end
    end
    puts line
  end

  # Capture Keypad Input (Layer 1: Physical Signal)
  input = STDIN.getch.downcase
  break if input == 'q'

  ny, nx = py, px
  case input
  when 'w' then ny -= 1
  when 's' then ny += 1
  when 'a' then nx -= 1
  when 'd' then nx += 1
  end

  # Collision & Movement Logic
  if grid[ny][nx] != 1
    grid[py][px] = 0 # Clear old spot
    py, px = ny, nx
    grid[py][px] = 2 # Update new spot
  end
end

system("clear")
puts "Exited Successfully. GitHub Repository Ready."
