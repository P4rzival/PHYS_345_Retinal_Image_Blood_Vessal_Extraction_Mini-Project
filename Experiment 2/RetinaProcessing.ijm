
selectWindow("eye_issues-1.jpg");
run("8-bit");
run("Duplicate...", " ");
run("Mean...", "radius=30");
saveAs("Tiff", "/home/travis/Desktop/eye_issues-background.tif");
selectWindow("eye_issues-1.jpg");
imageCalculator("Subtract create", "eye_issues-background.tif","eye_issues-1.jpg");
selectWindow("Result of eye_issues-background.tif");

//run("Brightness/Contrast...");
run("Apply LUT");
run("Close");
