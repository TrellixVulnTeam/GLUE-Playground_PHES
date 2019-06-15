#!/bin/bash

#SBATCH --job-name=bert_CoLA
#SBATCH --partition=gpu
#SBATCH --gres=gpu:1
#SBATCH --cpus-per-task=16
#SBATCH -n 1
#SBATCH --mem 80G
#SBATCH --output=bert_sts.out
#SBATCH --exclude=gqxx-01-084

# Configures
export TASK_NAME=CoLA
export EPOCH=6.0
export CASED=uncased
export LARGE=large
# export LR=2e-5

for LR in 2e-5 3e-5 4e-5 5e-5; do
EXP_DIR=exp/$CASED/avg3/lr$LR/$TASK_NAME-$LARGE
GLUE_DIR=glue_data

mkdir -p $EXP_DIR
python pytorch-pretrained-BERT/examples/run_classifier.py \
  --task_name $TASK_NAME \
  --do_lower_case \
  --do_train \
  --do_eval \
  --do_test \
  --bert_model bert-$LARGE-$CASED \
  --data_dir $GLUE_DIR/$TASK_NAME \
  --max_seq_length 128 \
  --train_batch_size 32 \
  --learning_rate $LR \
  --num_train_epochs $EPOCH \
  --output_dir $EXP_DIR 
#   --bert_model exp/$TASK_NAME/ \
done

export CASED=cased
# export LR=2e-5

for LR in 2e-5 3e-5 4e-5 5e-5; do
EXP_DIR=exp/$CASED/avg3/lr$LR/$TASK_NAME-$LARGE
GLUE_DIR=glue_data

mkdir -p $EXP_DIR
python pytorch-pretrained-BERT/examples/run_classifier.py \
  --task_name $TASK_NAME \
  --do_train \
  --do_eval \
  --do_test \
  --bert_model bert-$LARGE-$CASED \
  --data_dir $GLUE_DIR/$TASK_NAME \
  --max_seq_length 128 \
  --train_batch_size 32 \
  --learning_rate $LR \
  --num_train_epochs $EPOCH \
  --output_dir $EXP_DIR 
#   --do_lower_case \
#   --bert_model exp/$TASK_NAME/ \
done