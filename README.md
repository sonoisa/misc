# 雑多な主に自分用のコード

## 自然言語処理

どれもGoogle Colaboratoryで動かすことを前提としています。

- 日本語多クラス分類タスクを題材としたSetFitとT5の精度比較実験コード
  - 解説記事: [実際問題、Few-Shot学習手法SetFitはいつ使うとよいのか？](https://qiita.com/sonoisa/items/297fa2994a08c71d01c5)
  - [SetFit_japanese_document_classification.ipynb](https://colab.research.google.com/github/sonoisa/misc/blob/main/nlp/SetFit_japanese_document_classification.ipynb)
  - [t5_japanese_classification_fewshot.ipynb](https://colab.research.google.com/github/sonoisa/misc/blob/main/nlp/t5_japanese_classification_fewshot.ipynb)


- [SetFit_japanese.ipynb](https://colab.research.google.com/github/sonoisa/misc/blob/main/nlp/SetFit_japanese.ipynb): [SetFitアルゴリズム](https://arxiv.org/abs/2209.11055)を用いたセンチメント分析（2値分類タスク）

- [bert_japanese_classification_LP_FT.ipynb](https://colab.research.google.com/github/sonoisa/misc/blob/main/nlp/bert_japanese_classification_LP_FT.ipynb): [LP-FTアルゴリズム](https://arxiv.org/abs/2202.10054)を用いた文分類（9値分類、最終層のCLSを利用）
- [bert_japanese_classification_LP_FT_multiCLS.ipynb](https://colab.research.google.com/github/sonoisa/misc/blob/main/nlp/bert_japanese_classification_LP_FT_multiCLS.ipynb): [LP-FTアルゴリズム](https://arxiv.org/abs/2202.10054)を用いた文分類（9値分類、最終6層のCLSベクトルを利用）

- [elasticsearch_example.ipynb](https://colab.research.google.com/github/sonoisa/misc/blob/main/nlp/elasticsearch_example.ipynb): elasticsearchを用いた日本語文章検索
- [parse_wiki40b.ipynb](https://colab.research.google.com/github/sonoisa/misc/blob/main/nlp/parse_wiki40b.ipynb): Wiki-40Bのデータセットの構造化

- [structural_information_extraction_with_fused_Gromov_Wasserstein_optimal_transport_POT](https://colab.research.google.com/github/sonoisa/misc/blob/main/nlp/structural_information_extraction_with_fused_Gromov_Wasserstein_optimal_transport_POT.ipynb): Fused-Gromov-Wasserstein距離による最適輸送を用いたレイアウトと文章の類似度を加味した曖昧情報抽出

## ハンズオン用のコード

非公開データセットを解凍するためのパスワードなしでは動きません。  
完成版を試せるデモアプリもあります。

- [irasuto_search_with_sentence_bert_handson.ipynb](https://colab.research.google.com/github/sonoisa/misc/blob/main/nlp/irasuto_search_with_sentence_bert_handson.ipynb): 日本語Sentence-BERTを用いた「いらすとや」画像検索
  - デモアプリ: https://huggingface.co/spaces/sonoisa/irasuto_search

- [CLIP_irasutoya_search_zero_shot_handson.ipynb](https://colab.research.google.com/github/sonoisa/misc/blob/main/nlp/CLIP_irasutoya_search_zero_shot_handson.ipynb): 日本語CLIPを用いたマルチモーダル「いらすとや」画像検索
  - デモアプリ: https://huggingface.co/spaces/sonoisa/Irasuto_search_CLIP_zero-shot
