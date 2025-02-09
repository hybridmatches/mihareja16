document.addEventListener('DOMContentLoaded', function () {
    console.log("✅ DOM fully loaded!");

    const home = document.getElementById('home');
    if (!home) {
        console.error("❌ Error: 'home' element not found! Images will not be added.");
        return;
    }

    const imagePaths = {
        M: ["../assets/btn/pos_m0.png", "../assets/btn/pos_m1.png", "../assets/btn/pos_m2.png", "../assets/btn/pos_m3.png", "../assets/btn/pos_m4.png", "../assets/btn/pos_m5.png"],
        I: ["../assets/btn/pos_i0.png", "../assets/btn/pos_i1.png", "../assets/btn/pos_i2.png", "../assets/btn/pos_i3.png", "../assets/btn/pos_i4.png", "../assets/btn/pos_i5.png"],
        H: ["../assets/btn/pos_h0.png", "../assets/btn/pos_h1.png", "../assets/btn/pos_h2.png", "../assets/btn/pos_h3.png", "../assets/btn/pos_h4.png", "../assets/btn/pos_h5.png"],
        A: ["../assets/btn/pos_a0.png", "../assets/btn/pos_a1.png", "../assets/btn/pos_a2.png", "../assets/btn/pos_a3.png", "../assets/btn/pos_a4.png", "../assets/btn/pos_a5.png"]
    };

    function createImage(src, className) {
        const img = document.createElement('img');
        img.src = src;
        img.className = className;
        img.oncontextmenu = () => false;
        img.draggable = false;
        return img;
    }

    // Add images for M, I, H, A to the 'home' element
    ['M', 'I', 'H', 'A'].forEach(letter => {
        const src = imagePaths[letter][Math.floor(Math.random() * imagePaths[letter].length)];
        const imgElement = createImage(src, `crka${letter.toLowerCase()}`);
        home.appendChild(imgElement);
        console.log(`✅ Added image for class: crka${letter.toLowerCase()}, Source: ${src}`);
    });
});
