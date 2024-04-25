clear all
close all
images    = cell(4,1);
 images{1} = imread('imagen_1.png');
 images{2} = imread('imagen_2.png');
 images{3} = imread('imagen_3.png');
 images{4} = imread('imagen_4.png');
  % create the video writer with 1 fps
 writerObj = VideoWriter('myVideo.avi');
 writerObj.FrameRate = 1;
 % set the seconds per image
 secsPerImage = [1 1 1 1];
 % open the video writer
 open(writerObj);
 % write the frames to the video
 for u=1:length(images)
     % convert the image to a frame
     frame = im2frame(images{u});
     for v=1:secsPerImage(u) 
         writeVideo(writerObj, frame);
     end
 end
 % close the writer object
 close(writerObj);