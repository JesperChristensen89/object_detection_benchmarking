# object_detection_benchmarking
Benchmarking deep learning models for real-time object detection on various platforms
To clone this repo one may need to use Git LFS for the large files (models, data).

# Models
The tested models are all trained on MS COCO and evaluated on a personal recorded video.
The models and their score on the COCO evaluation set:
* SSD MobileNet V1 - 21 mAP
* SSD Inception V2 - 24 mAP
* Faster R-CNN Inception V2 - 28 mAP
* Faster R-CNN Inception ResNet V2 - 37 mAP

# Platforms
The models are deployed directly from the available notebooks. 
Multiprocessing and threading are intelligently used limit the bottleneck from decoding and processing. 
The tested platforms include:
* MacBook Pro 2015 2.7 GHz Intel Core i5 CPU
* NVIDIA GTX1060 6 GB GPU
* Raspberry Pi 3 model B
* NVIDIA Jetson TX2

# Results
The results are shown in the end of each notebook. 
Furthermore the original video processed by SSD MobileNet and Faster R-CNN Inception ResNet is available as a performance comparison on youtube: https://www.youtube.com/watch?v=EY5XbRQylIg

# Disclaimer
None of the models are further optimized towards runtime inference. With a lot of work, the models for e.g. Jetson TX2 could be configured to run with TensorRT. This would effectively boost performance with at least a number of times - if not 10x.

