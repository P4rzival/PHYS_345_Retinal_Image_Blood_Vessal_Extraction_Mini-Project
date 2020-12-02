open(File.openDialog("Choose Image to Process with Experiment 4"));
run("Duplicate...", " ");


selectWindow(File.name);
currImage = File.nameWithoutExtension;

close();
run("8-bit");
currImage1 = currImage + "-1.tiff";

saveLoc = getDir("Choose directory to save image");

saveAs("Tiff", saveLoc + currImage1 );

run("Duplicate...", " ");

currImage2 = currImage + "-Background.tiff";
run("Mean...", "radius=45");
saveAs("Tiff", saveLoc + currImage2);
imageCalculator("Subtract create", currImage2,currImage1);
run("Apply LUT");
saveAs("Tiff", saveLoc + "ResultOfBackgroundSubtraction.tiff");
run("Duplicate...", " ");
run("Convolve...", "text1=[1 1 1\n1 9 1\n1 1 1\n] normalize");

// For some reason I cannot automatically adjust the contrast using macros so the user will adjust it to get the desired result

run("Brightness/Contrast...");
run("Gaussian Blur...", "sigma=2");
run("Apply LUT");
//run("Close");
saveAs("Tiff", saveLoc + "ResultOfBackgroundSubtraction-ConvolvedWithSmoothingKernel.tiff");
Dialog.create("Finished");
Dialog.addMessage("Done! Just adjust the "Maximum" slider until the the vessels are seen clearly and make sure to save!");
Dialog.show();
//close();
