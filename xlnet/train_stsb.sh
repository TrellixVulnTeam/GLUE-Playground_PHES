LARGE_DIR=checkpoints/cased_L-24_H-1024_A-16/xlnet_cased_L-24_H-1024_A-16
GLUE_DIR=glue_data
CUDA_VISIBLE_DEVICES=0,1,2,3 python run_classifier.py \
  --do_train=True \
  --do_eval=False \
  --task_name=sts-b \
  --data_dir=${GLUE_DIR}/STS-B \
  --output_dir=proc_data/sts-b \
  --model_dir=exp/sts-b \
  --uncased=False \
  --spiece_model_file=${LARGE_DIR}/spiece.model \
  --model_config_path=${LARGE_DIR}/model_config.json \
  --init_checkpoint=${LARGE_DIR}/xlnet_model.ckpt \
  --max_seq_length=128 \
  --train_batch_size=8 \
  --num_hosts=1 \
  --num_core_per_host=4 \
  --learning_rate=5e-5 \
  --train_steps=1200 \
  --warmup_steps=120 \
  --save_steps=600 \
  --is_regression=True
