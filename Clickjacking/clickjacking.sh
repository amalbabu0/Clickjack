#!/bin/bash

RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[0;33m'
BLUE='\033[0;34m'
NC='\033[0m'


read -p "Enter the domain with the full URL, e.g., https://example.com: " Domain
read -p "Do you want to save the file? (y/N): " No


mkdir -p tmp_clickjacking

website(){
    echo "<html lang=\"en\">
 <head>
  <meta charset=\"utf-8\"/>
  <meta content=\"width=device-width, initial-scale=1\" name=\"viewport\"/>
  <title>
   $Domain Clickjacking
  </title>
  <link href="https://logomoose.com/featured/colorful-logo-idea/" rel="icon">
  <script src=\"https://cdn.tailwindcss.com\">
  </script>
  <link href=\"https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css\" rel=\"stylesheet\"/>
  <link href=\"https://fonts.googleapis.com/css2?family=Poppins:wght@300;600&amp;display=swap\" rel=\"stylesheet\"/>
  <style>
   body {
      font-family: 'Poppins', sans-serif;
    }
   img.bg-image {
     filter: grayscale(100%) brightness(0.7);
   }
  </style>
 </head>
 <body class=\"relative min-h-screen flex items-center justify-center p-6 overflow-hidden bg-gray-900\">
  <img alt=\"Black and white blurred abstract background with smooth gradients and soft textures\" class=\"bg-image absolute inset-0 w-full h-full object-cover opacity-40 pointer-events-none select-none\" height=\"736\" src=\"https://i.pinimg.com/736x/c5/46/8c/c5468ce0c5e9b357eae1fc2ed719f1c3.jpg\" width=\"552\"/>
  <div class=\"relative w-full max-w-3xl bg-white bg-opacity-95 backdrop-blur-md rounded-3xl shadow-2xl overflow-hidden border border-gray-300 z-10\">
   <header class=\"bg-gray-800 p-8 text-center\">
    <h1 class=\"text-white text-4xl font-extrabold tracking-wide drop-shadow-md\">
     $Domain Clickjacking
    </h1>
    <p class=\"mt-2 text-gray-300 font-light text-lg\">
     Securely preview embedded content
    </p>
   </header>
   <main class=\"p-8\">
    <div class=\"relative rounded-xl overflow-hidden shadow-lg border border-gray-300\">
     <iframe class=\"w-full h-[400px] md:h-[450px] lg:h-[500px]\" sandbox=\"allow-scripts allow-same-origin allow-forms allow-popups\" src=\"$Domain\" title=\"Embedded content from $Domain\">
     </iframe>
     <div class=\"absolute top-4 right-4 bg-white bg-opacity-80 rounded-full p-3 shadow-md\">
      <i class=\"fas fa-lock text-gray-800 text-xl\">
      </i>
     </div>
    </div>
   </main>
   <footer class=\"bg-gray-800 p-6 text-center text-gray-400 font-light text-sm\">
    © 2025 $Domain Security. All rights reserved.
   </footer>
  </div>
 </body>
</html>" > tmp_clickjacking/clickjacking.html
}

show_progress() {

    local duration=${1:-1}  # Default 1 second
    local columns=${COLUMNS:-80}
    local space=$((columns-6)) # Leave room for percentage

    for ((i=0; i<=space; i++)); do

        # Calculate percentage
        percent=$((i*100/space))

        # Draw the progress bar
        printf "\r${BLUE}Saving: ["
        printf "%0.s#" $(seq 1 $i)
        printf "%0.s " $(seq $i $space)
        printf "] ${percent}%%"

        # Sleep for a fraction of the total duration
        sleep "$(echo "scale=4; $duration/$space" | bc)"
    done

    printf "\n${GREEN}File saved successfully!${NC}\n"
}

if [[ "$No" == "y" || "$No" == "Y" ]]; then
    read -p "Enter the name of the file to save (without ext.): " FileName
    echo -e "${BLUE}Saving the file...${NC}"
    show_progress 2
    cp tmp_clickjacking/clickjacking.html "$FileName.html"

else
    echo -e "${RED}Not saving the file${NC}"
    website
fi

firefox tmp_clickjacking/clickjacking.html

sleep 10

rm -rf tmp_clickjacking/clickjacking.html