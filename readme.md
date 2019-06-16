# GLUE Benchmark (STS-B and CoLA)

This is a readme file for the course project of *Natural Language Processing*, CS229, by Prof. Hai Zhao.

* Author: Zhanghao Wu (516030910593)
* Email: wz.wzh@sjtu.edu.cn
* Affiliation: ACM Honored Class, Zhiyuan College, SJTU

I will introduce the two models I used for this task, including BERT[1] and MT-DNN[2]. And I will then showing how to run the codes.

## Result


## Get Started
### Prerequisit
1. BERT
   ```bash
   cd ./pytorch-pretrained-BERT
   pip install -r requirements.txt
   pip install --editable .
   python ./download_glue_data.py
   ```
2. MT-DNN
   ```bash
   cd ./mt-dnn
   pip install -r requrirements.txt
   ./download.sh
   python ./preproc.py
   ```

### Training
1. BERT
   ```bash
   cd ./pytorch-pretrained-BERT
   # Finetune pretrained BERT for STS-B
   ./run_stsb.sh
   # Finteune pretrained BERT for CoLA
   ./run_cola.sh
   ```
2. MT-DNN
   ```bash
   cd ./mt-dnn/scripts
   # Train MT-DNN model (not necessary using the pretrained one)
   ./run_mt_dnn.sh
   # Finetune pretrained MT-DNN for STS-B
   ./run_stsb.sh
   # Finetune pretrained MT-DNN for CoLA
   ./run_cola.sh
   ```
   
### Testing
1. BERT
   ```bash
   cd ./pytorch-pretrained-BERT
   # Test STS-B with the my pretrained checkpoint
   ./tes_stsb.sh
   # Test CoLA with the my pretrained checkpoint
   ./tes_cola.sh
   ```
2. MT-DNN
   ```bash
   cd ./mt-dnn/scripts
   # Test STS-B with the my pretrained checkpoint
   ./tes_stsb.sh
   # Test CoLA with the my pretrained checkpoint
   ./tes_cola.sh
   ```
## Reference
> [1] Devlin, J., Chang, M. W., Lee, K., & Toutanova, K. (2018). BERT: Pre-training of deep bidirectional transformers for language understanding. arXiv preprint arXiv:1810.04805.
> 
> [2] Liu, X., He, P., Chen, W., & Gao, J. (2019). Multi-Task Deep Neural Networks for Natural Language Understanding. arXiv preprint arXiv:1901.11504.