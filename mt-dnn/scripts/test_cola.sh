#!/bin/bash
if [[ $# -ne 2 ]]; then
  echo "train.sh <batch_size> <gpu>"
  exit 1
fi
BATCH_SIZE=$1
gpu=$2
echo "export CUDA_VISIBLE_DEVICES=${gpu}"
export CUDA_VISIBLE_DEVICES=${gpu}
tstr=$(date +"%FT%H%M")

train_datasets="cola"
test_datasets="cola"
prefix="mt-dnn-${train_datasets}"
MODEL_ROOT="checkpoints"
INIT_PATH="../model_checkpoints/cola.pt"
DATA_DIR="../data/mt_dnn"

answer_opt=0
optim="adamax"
grad_clipping=0
global_grad_clipping=1

model_dir="checkpoints/${prefix}_${optim}_answer_opt${answer_opt}_gc${grad_clipping}_ggc${global_grad_clipping}_${tstr}"
# model_dir="checkpoints/mt-dnn-stsb_adamax_answer_opt0_gc0_ggc1_2019-06-15T0215"
log_file="${model_dir}/log.log"
python ../train.py --data_dir ${DATA_DIR} --init_checkpoint ${INIT_PATH} --batch_size ${BATCH_SIZE} --output_dir ${model_dir} --log_file ${log_file} --answer_opt ${answer_opt} --optimizer ${optim} --train_datasets ${train_datasets} --test_datasets ${test_datasets} --grad_clipping ${grad_clipping} --global_grad_clipping ${global_grad_clipping} --multi_gpu_on --epoch 0
