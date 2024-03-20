const express = require('express');
const tf = require('@tensorflow/tfjs-node');
// const { createCanvas, loadImage } = require('canvas');

const predictRouter = express.Router();

// Load the TensorFlow.js model
let model;
(async () => {
    try {
        model = await tf.loadLayersModel(`file://${__dirname}/keras_model.h5`);
        console.log('Model loaded successfully.');
    } catch (error) {
        console.error('Failed to load model:', error);
    }
})();


// API endpoint for image classification
predictRouter.post('/classify', async (req, res) => {
    try {
        if (!model) {
            throw new Error('Model not loaded yet.');
        }

        if (!req.body.image) {
            return res.status(400).json({ error: 'Image data not provided.' });
        }

        const imageData = req.body.image;
        const result = await predictImage(model, imageData);
        res.json({ result });
    } catch (error) {
        console.error('Error processing request:', error);
        res.status(500).json({ error: 'Internal server error.' });
    }
});

// Preprocess the image
// async function preprocessImage(imageData) {
//     const image = await loadImage(imageData);
//     const canvas = createCanvas(image.width, image.height);
//     const ctx = canvas.getContext('2d');
//     ctx.drawImage(image, 0, 0);
//     let imageDataTensor = ctx.getImageData(0, 0, canvas.width, canvas.height);
//     imageDataTensor = tf.browser.fromPixels(imageDataTensor).toFloat().div(tf.scalar(255)); 
//     return imageDataTensor;
// }

// Perform inference on the image
async function predictImage(model, imageData) {
    // const imageTensor = await preprocessImage(imageData);
    const prediction = model.predict(imageData);
    const predictionData = await prediction.data();
    const result = predictionData[0] > 0.5 ? 'abnormal' : 'normal';
    return result;
}

module.exports = predictRouter;