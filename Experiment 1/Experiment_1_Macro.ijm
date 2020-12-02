//Notes: This is a very clean result. I believe the lower numbered test photos are the intentions of the professor to see our ability to clean noise from a photo. Unfortunately this has been very illusive without losing a lot of quality in the veins. This observation closely echoes what is written in the textbook about smoothing retinal photos.


open(File.openDialog("Choose Image to Process with Experiment 1"));
run("Duplicate...", " ");

//Dialog.create("Select Original Image to Delete");
//Dialog.addImageChoice("Select Original Image to Delete")
//imageToDelete = Dialog.getImageChoice();
//Dialog.show();
selectWindow(File.name);
currImage = File.nameWithoutExtension;

close();
run("8-bit");
currImage1 = currImage + "-1.tiff";
//selectWindow(currImage1);

saveLoc = getDir("Choose directory to save image");

saveAs("Tiff", saveLoc + currImage1 );

run("Duplicate...", " ");

currImage2 = currImage + "-Background.tiff";
//selectWindow("01_test-2.tif");
run("Mean...", "radius=40");
saveAs("Tiff", saveLoc + currImage2);
imageCalculator("Subtract create", currImage2,currImage1);
//selectWindow("Result of 01_test-Background.tiff");
//run("Brightness/Contrast...");
run("Apply LUT");
saveAs("Tiff", saveLoc + "ResultOfBackgroundSubtraction.tiff");
run("Duplicate...", " ");
run("Convolve...", "text1=[1 1 1\n1 9 1\n1 1 1\n] normalize");

// For some reason I cannot automatically adjust the contrast using macros so the user will adjust it to get the desired result

run("Brightness/Contrast...");
run("Apply LUT");
//run("Close");
saveAs("Tiff", saveLoc + "ResultOfBackgroundSubtraction-ConvolvedWithSmoothingKernel.tiff");
Dialog.create("Finished");
Dialog.addMessage("Done! Just adjust the "Maximum" slider until the the vessels are seen clearly and make sure to save!");
Dialog.show();
//close();
