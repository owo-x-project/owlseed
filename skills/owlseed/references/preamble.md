# 前文の雛形

従属関係はdescriptionではなく本文冒頭の前文で表す。descriptionは発見のための場所であり、そこに従属を書くとタスクと一致せず選ばれなくなる。`owlseed-grow` はSkillを生成・改訂する時、必ずこの前文を本文の先頭に置く。

## コアSkill用

```
> このSkillは owlseed のライフサイクル内でのみ機能する。owlseed を読んでいなければ、先に owlseed を読むこと。
> このSkillの記述と owlseed が矛盾する場合は owlseed に従い、矛盾を owlseed-state に記録する。
> 契約: owlseed/references/contracts/<役割>.md（owlseed 版 <版>）
```

## 派生Skill用

```
> このSkillは owlseed 配下の派生Skillである。owlseed-compass の範囲と owlseed-verify の検証契約に従う。
> このSkillの記述とコアSkillが矛盾する場合はコアに従い、矛盾を owlseed-state に記録する。
> 形成の根拠: <作業単位の参照>（受入ゲート通過: <日付または参照>）
```

## 外部Skillを取り込んだアダプタ用

派生Skill用の前文に、以下を加える。

```
> 本体: <外部Skillの名前と所在>。この派生Skillは、このプロジェクトでの使い方と制約だけを持つ。
```

## descriptionの末尾句

すべてのコア・派生Skillのdescriptionの末尾に、短く一句だけ置く。

```
owlseed配下。
```

長くしない。descriptionは常時ロードされ、Skillの数だけ税がかかる。
