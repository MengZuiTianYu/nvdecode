#ifndef RTSPPROCESS_H_
#define RTSPPROCESS_H_

#include <opencv2/core/core.hpp>
#include <opencv2/imgproc/imgproc.hpp>
#include <opencv2/imgproc/types_c.h>
#include <opencv2/highgui/highgui.hpp>
#include <opencv2/core/cuda.hpp>
#include <opencv2/cudaimgproc.hpp>
#include "NvDecoder.h"
#include "FFmpegDemuxer.h"
#include "ColorSpace.h"
#include <time.h>
#include <thread>

class RtspProcess
{
public:
    int Decode(std::string filepath, const int gpuid, int savePath);
    void startThread(std::string rtsppath, const int gpuID, int saveCountPath);    
};
#endif