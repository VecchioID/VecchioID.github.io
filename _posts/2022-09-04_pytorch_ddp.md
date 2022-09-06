---
layout: post
title: Pytorch DDP Tutorial
date: 2022-09-03 
tags: ML DL    
---

---
# pytorch distributed data parallel

---
 下面是一个pytorch的demo。

    # DDP
    import torch
    import argparse
    from torch.utils.data import DataLoader
    # 初始化进程组，第一个参数指定GPU之间的通信参数
    # 第二个参数当前GPU上卡的数量
    # rank指的是当前进程在哪个gpu运行
    torch.distributed.init_process_group("bccl", world_size=n_gpus, rank=args.local_rank)

    # 指定当前进程能用的gpu的名称
    torch.cuda.set_device(args.local_rank) #该语句作用相当于CUDA_VISIABLE_DEVICES环境变量

    # 对模型进行包裹
    model = DistributedDataParallel(model.cuda(args.local_rank), device_ids=[args.local_rank])

    # 对每张卡的数据进行分配，分配到不同的GPU上。
    train_sampler = Distributedsampler(traindataset) # 源码位于torch/utils/data/distributed.py
    # sampler中给了顺序，因此在dataloader中不需要再进行shuffle了
    train_dataloader = Dataloader(...,sampler=train_sampler)

    data = data.cuda(args.local_rank)



    # 执行命令
    python -m torch.distributed.launch --nproc_per_node=n_gpus train.py

    # 模型加载与保存
    torch.save 在local_rank=0的位置进行保存，同样注意调用model.module.state_dict()
    torch.load 注意 map_location

    # 注意事项：
    # 1-train.py中要有接受local_rank的参数选项，launch会传入这个参数
    # 2-每个进程的batch_size应该是一个GPU所需要的batch_size大小
    # 3-在每个周期开始处，调用train_sampler.set_epoch(epoch)可以使得数据充分打乱
    # 4-有了sampler，就不要再Dataloader中设置shuffle=True了




    '''
    以下是测样的code代码段
    '''
    import argparse
    import logging
    parser = argparse.ArgumentParser()
    parser.add_argument("--local_rank", help="local device id on current node", type=int)
    args = parser.parse_args()

    if torch.cuda.is_available():
        logging.warning("Cuda is available!")
    else:
        logging.warning("Cuda is not available! Exit!")


    n_gpus = 2
    torch.distributed.init_process_group("nccl", world_size=n_gpus, rank=args.local_rank)
    torch.cuda.set_device(args.local_rank)







    def train(local_rank):
        model = nn.parallel.DistributedDataParallel(model.cuda(local_rank), device_ids=[local_rank])

        # 构建traindata_loader
        train_sampler = DistributedSampler(train_dataset)
        traindata_loader = torch.utils.data.DataLoader(train_dataset, batch_Szie=32, sampler=train_sampler)
        # 测试和验证集可以不要sampler
        evldata_loader = torch.utils.data.DataLoader(evl_dataset, batch_Szie=32)

        for epoch_idx in range(start_epoch, num_epoch):
            train_sampler.set_epoch(epoch_idx) # 为了让每张卡在每个周期中得到的数据是随机的

    # 按照我的逻辑以上代码可能要重新改写成自己的风格





        # 数据拷贝
        data = data.cuda(local_rank)
        target = target.cuda(local_rank)



    # 关于模型的保存
    if step%save_step_interval == 0 and local_rank == 0:
        os.makedirs(save_path, exist_ok=True)
        save_file = os.path.join(save_path, f"step_{step}.pt")
        torch.save({
            'epoch': epoch_index,
            'step': step,
            'model_staet_dict':model.module.state_dict(),
            'optimizer_state_dict':optimizer.state_dict(),
            'loss':bce_loss,
        }, save_file)
        logging.warning(f"checkpoint has benn saved in {save_file}")
