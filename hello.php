<?php
function greet($name = "World") {
    return "Hello, $name!";
}

echo greet(); // Hello, World!
echo greet("PHP"); // Hello, PHP!
?>
