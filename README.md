# Image-Number-Detection-and-Computation

This project processes images to detect and compute numbers based on color and outputs the results with enhanced visual representation.

## Features

- **Processes images**: Detects and sums up blue numbers.
- **Computation**: Subtracts the sum of blue numbers from the total sum of numbers.
- **Visual Output**: Inserts the computed result in green below the image.
- **Organized Output**: Saves the processed images in the `Results` folder.
- **Template Matching**: Uses number templates from the `Template` folder for accurate detection.
- **Processing Stages**: Provides intermediate steps in the `Extra` folder.

## Usage

To run the project, execute `MAIN.m`. This script will:

1. Process images located in the `Inputs` folder.
2. Detect and sum blue numbers.
3. Subtract the blue number sum from the total number sum.
4. Insert the result in green below each image.
5. Save the resulting images in the `Results` folder.

## Folder Structure

- `Inputs`: Contains the images to be processed.
- `Template`: Holds the number templates for detection.
- `Extra`: Shows the intermediate stages of image processing, such as denoising and number detection.
- `Results`: Stores the final processed images with results.

## How It Works

1. **Image Processing**: Each image in the `Inputs` folder is read and denoised.
2. **Number Detection**: Numbers are detected using templates from the `Template` folder.
3. **Computation**: Blue numbers are summed up, and this sum is subtracted from the total sum of detected numbers.
4. **Result Visualization**: The result is displayed in green below the processed image.
5. **Output**: The final images are saved in the `Results` folder.

## Example

1. Place your images in the `Inputs` folder.
2. Run `MAIN.m`.
3. Check the `Results` folder for processed images with computed results.

For detailed processing stages, refer to the `Extra` folder.