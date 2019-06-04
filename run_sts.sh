export GLUE_DIR=glue_data
export TASK_NAME=STS-B
export EXP_DIR=exp/$TASK_NAME-large/

python pytorch-pretrained-BERT/examples/run_classifier.py \
  --task_name $TASK_NAME \
  --do_train \
  --do_eval \
  --do_test \
  --do_lower_case \
  --bert_model bert-large-uncased \
  --data_dir $GLUE_DIR/$TASK_NAME \
  --max_seq_length 128 \
  --train_batch_size 32 \
  --learning_rate 2e-5 \
  --num_train_epochs 3.0 \
  --output_dir $EXP_DIR
#   --bert_model exp/$TASK_NAME/ \