#include <iostream>
#include "RtspProcess.h"

simplelogger::Logger *logger = simplelogger::LoggerFactory::CreateConsoleLogger();
/* 启动解码 */
void RtspProcess::Decode(std::string filepath, const int gpuid, int savePath)
{   
    CUcontext g_cuContext = nullptr;
    int eOutputFormat = 4;
    int nFrame = 0;
    int nVideoBytes = 0, nFrameReturned = 0;
    uint8_t *pVideo = nullptr;
    uint8_t **ppFrame;
    cv::Mat c_img;
    cv::Mat g_img;
    Gpumat img;
    FFmpegDemuxer* demuxer = nullptr;
    NvDecoder* dec = nullptr;

    ck(cuInit(0));
    CUdevice cuDevice;
    ck(cuDeviceGet(&cuDevice, gpuid));
    char szDeviceName[80];
    ck(cuDeviceGetName(szDeviceName, sizeof(szDeviceName), cuDevice));
    std::cout << "GPU in use: " << szDeviceName << std::endl;
    ck(cuCtxCreate(&g_cuContext, 0, cuDevice));

    demuxer = new FFmpegDemuxer(filepath.c_str());
    dec = new NvDecoder(g_cuContext, demuxer->GetWidth(), demuxer->GetHeight(), 
            true, FFmpeg2NvCodecId(demuxer->GetVideoCodec()));
    int temp = 0;
    int nWidth = demuxer->GetWidth(), nHeight = demuxer->GetHeight();
    int nFrameSize = nWidth * nHeight * eOutputFormat;
    std::unique_ptr<uint8_t[]> pImage(new uint8_t[nFrameSize]);
    img.channels = eOutputFormat;
    img.height = nHeight;
    img.width = nWidth;
    cudaMallocManaged<unsigned char>(&img.data, 
            img.width * img.height * img.channels * sizeof(unsigned char));
    do
    {
        demuxer->Demux(&pVideo, &nVideoBytes);
        dec->Decode(pVideo, nVideoBytes, &ppFrame, &nFrameReturned);

        //LOG(INFO)<<"nVideoBytes:"<<nVideoBytes;
        
        for (int i = 0; i < nFrameReturned; i++)
        {
            if (dec->GetOutputFormat() == cudaVideoSurfaceFormat_YUV444)
                YUV444ToColor32<BGRA32>((uint8_t*) ppFrame[i], dec->GetWidth(), 
                        img.data, eOutputFormat * dec->GetWidth(), 
                        dec->GetWidth(), dec->GetHeight());
            else
                Nv12ToColor32<BGRA32>((uint8_t*) ppFrame[i], dec->GetWidth(), 
                        img.data, eOutputFormat * dec->GetWidth(), 
                        dec->GetWidth(), dec->GetHeight());
            //LOG(INFO)<<"After if";
            cv::cuda::GpuMat gpuBGRA(img.height, img.width, CV_8UC4, 
                    (uint8_t*) (img.data));
            gpuBGRA.data = (uint8_t*) (img.data);
            gpuBGRA.download(c_img);
            //LOG(INFO)<<"After download";
            cv::cvtColor(c_img, g_img, CV_BGRA2BGR);
            std::stringstream str;
            str << "f" << temp << ".jpg";
            std::cout << "正在处理第" << temp << "帧" <<std::endl;
            std::stringstream ptr;
            ptr << "IMAGE" << savePath;
            //LOG(INFO)<<"After string" << savefilepath;
            cv::imwrite("/home/zhangl/cameraImage/" + ptr.str() + "/image" + 
                    str.str(), g_img);
            //cv::imshow("test", c_img);
            //cv::waitKey(1);
            temp++;
        }
        nFrame += nFrameReturned;
    } while (nVideoBytes);
    std::cout << "Total Frame decoded:" << nFrame << std::endl;
    cuMemFree((CUdeviceptr)(img.data));
    delete demuxer;
    demuxer = nullptr;

    delete dec;
    dec = nullptr;
}
 
void RtspProcess::startThread(std::string rtsppath, const int gpuID, 
        int saveCountPath)
{
    int savePath = saveCountPath;
    const int gpuid = gpuID;
    std::string rtsp = rtsppath;
    std::thread t(&RtspProcess::Decode, this, rtsp, gpuid, savePath);
    t.detach();
}
int main()
{
    const int gpuID = 1;
    int saveCountPath[28];
    saveCountPath[0] = 24;
    saveCountPath[1] = 26;
    saveCountPath[2] = 165;
    saveCountPath[3] = 20;
    saveCountPath[4] = 16;
    saveCountPath[5] = 17;
    saveCountPath[6] = 18;
    saveCountPath[7] = 11;
    saveCountPath[8] = 29;
    saveCountPath[9] = 22;
    saveCountPath[10] = 146;
    saveCountPath[11] = 150;
    saveCountPath[12] = 155;
    saveCountPath[13] = 156;
    saveCountPath[14] = 131;
    saveCountPath[15] = 134;
    saveCountPath[16] = 125;
    saveCountPath[17] = 145;
    saveCountPath[18] = 127;
    saveCountPath[19] = 136;
    saveCountPath[20] = 33;
    saveCountPath[21] = 132;
    saveCountPath[22] = 179;
    saveCountPath[23] = 171;
    saveCountPath[24] = 172;
    saveCountPath[25] = 173;
    saveCountPath[26] = 174;
    saveCountPath[27] = 176;
    std::string rtsp[28];
    rtsp[0] = "rtsp://admin:admin123@192.168.10.24";
    rtsp[1] = "rtsp://admin:admin123@192.168.10.26";
    rtsp[2] = "rtsp://admin:admin123@192.168.10.165";
    rtsp[3] = "rtsp://admin:admin123@192.168.10.20";
    rtsp[4] = "rtsp://admin:admin123@192.168.10.16";
    rtsp[5] = "rtsp://admin:admin123@192.168.10.17";
    rtsp[6] = "rtsp://admin:admin123@192.168.10.18";
    rtsp[7] = "rtsp://admin:admin123@192.168.10.11";
    rtsp[8] = "rtsp://admin:admin123@192.168.10.29";
    rtsp[9] = "rtsp://admin:admin123@192.168.10.22";
    rtsp[10] = "rtsp://admin:admin123@192.168.10.146";
    rtsp[11] = "rtsp://admin:admin123@192.168.10.150";
    rtsp[12] = "rtsp://admin:admin123@192.168.10.155";
    rtsp[13] = "rtsp://admin:admin123@192.168.10.156";
    rtsp[14] = "rtsp://admin:admin123@192.168.10.131";
    rtsp[15] = "rtsp://admin:admin123@192.168.10.134";
    rtsp[16] = "rtsp://admin:admin123@192.168.10.125";
    rtsp[17] = "rtsp://admin:admin123@192.168.10.145";
    rtsp[18] = "rtsp://admin:admin123@192.168.10.127";
    rtsp[19] = "rtsp://admin:admin123@192.168.10.136";
    rtsp[20] = "rtsp://admin:admin123@192.168.10.33";
    rtsp[21] = "rtsp://admin:admin123@192.168.10.132";
    rtsp[22] = "rtsp://admin:admin123@192.168.10.179";
    rtsp[23] = "rtsp://admin:admin123@192.168.10.171";
    rtsp[24] = "rtsp://admin:admin123@192.168.10.172";
    rtsp[25] = "rtsp://admin:admin123@192.168.10.173";
    rtsp[26] = "rtsp://admin:admin123@192.168.10.174";
    rtsp[27] = "rtsp://admin:admin123@192.168.10.176";
    
    RtspProcess Rp;
    //rtspProcess.CudaInit(gpuID);
    for(int i = 0; i < 28; i++)
    {
        Rp.startThread(rtsp[i], gpuID, saveCountPath[i]);
    }
    while(true)
    {
        sleep(1000);
    }
    return 0;
}
