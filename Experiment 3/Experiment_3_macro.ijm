open(File.openDialog("Choose Image to Process with Experiment 3"));
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

run("Mean...", "radius=25");
saveAs("Tiff", saveLoc + currImage2);
imageCalculator("Subtract create", currImage2,currImage1);

run("Apply LUT");
saveAs("Tiff", saveLoc + "ResultOfBackgroundSubtraction.tiff");

// For some reason I cannot automatically adjust the contrast using macros so the user will adjust it to get the desired result

run("Brightness/Contrast...");
run("Apply LUT");
saveAs("Tiff", saveLoc + "ResultOfBackgroundSubtraction-ConvolvedWithSmoothingKernel.tiff");
Dialog.create("Finished");
Dialog.addMessage("Done! Just adjust the "Maximum" slider until the the vessels are seen clearly and make sure to save!");
Dialog.show();
