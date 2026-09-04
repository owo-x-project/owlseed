# owlseed

AIエージェントに**作業のライフサイクル**、3つの名前付き**契約**、**受入ゲート**を与える不変のAgent Skill。セッションをまたいでも、プロジェクトでの作業を継続し一貫させることを目的とする。

owlseed はプロジェクト固有の知識を持たない。固定するのは名前と契約だけであり、パス・形式・検証手段は固定しない。プロジェクト固有のものはすべて owlseed の周囲に育つ。初回の発芽時にエージェントが生成し、その後は経験によって改善される。名前が固定された3つのコアSkillが作られる。`owlseed-compass`（目的と範囲）、`owlseed-state`（現在地と復帰）、`owlseed-verify`（このプロジェクトでの「検証済み」の定義）。中身はプロジェクトのものであり、owlseed のものではない。能力の形成・改善・剪定は owlseed 自身の役割であり、プロジェクトが持つSkillではない。

## 解決する問題

エージェントは毎回ゼロからセッションを始める。プロジェクトが何のためのものかを再発見し、作業がどこで止まったかを推測し、「完了」の定義を自分で決める。しかもその定義は毎回違う。途中で終わった作業は、次のセッションが復帰できる形を何も残さない。作業の過程で得たものはコンテキストと一緒に失われる。

指示ファイルは助けになるが、それ自体を統べるものがない。能力がどう形成され・検証され・剪定されるかの規則が無いため、指示は溜まり、互いに矛盾し、古びていく。

owlseed は、そこに欠けている固定点を与える。1度に1つの作業単位を、7段階で回す。

| 段階 | owlseed が問うこと |
|---|---|
| 発芽 Germinate | 目的・状態・検証手段はどこにあるか |
| 定位 Orient | 今どこにいるか。土台は壊れていないか |
| 選択 Select | 次に扱う1単位は何か。目的に沿うか |
| 実行 Act | 必要な能力はあるか。無ければ作る価値があるか |
| 検証 Verify | 検証済みと言えるか。根拠は何か |
| 沈殿 Sediment | この経験はどの層へ返すか |
| 収束 Close | 次の自分が復帰できる形か |

この規則はプロジェクト側から上書きできない。能力への変更はすべて同じ受入ゲートを通る。

## インストール

owlseed は素の [Agent Skills](https://agentskills.io) スキルである。Markdownのみ、スクリプトなし、実験的なフロントマターフィールドなし。仕様を実装するランタイムであれば動く。

**任意のランタイム（skills CLI）。** インストール済みのエージェントを検出し、各々の発見パスへリンクする。

```sh
npx skills add owo-x-project/owlseed
```

**Claude Code（plugin marketplace）。** この方法では名前空間が付き、`/owlseed:owlseed` として呼ぶ。

```
/plugin marketplace add owo-x-project/owlseed
/plugin install owlseed@owlseed
```

**手動。** 一度cloneして、使うランタイムの発見パスへリンクする。`.agents/skills/` は Codex CLI / Gemini CLI / Cursor / Cline / OpenCode をカバーする。Claude Code は `.agents/` を読まないため `.claude/skills/` が必要。

```sh
git clone https://github.com/owo-x-project/owlseed ~/src/owlseed

mkdir -p ~/.agents/skills ~/.claude/skills
ln -s ~/src/owlseed/skills/owlseed ~/.agents/skills/owlseed
ln -s ~/src/owlseed/skills/owlseed ~/.claude/skills/owlseed
```

**最初の1回は明示的に呼ぶ。** `/owlseed` を実行するか、「owlseed のスキルを読んで始めて」と伝える。発芽前のプロジェクトには owlseed を指すものが何も無いため。以降はエージェントが自分から読む。

発芽は対話で進む。エージェントは3つのコアスキルを見出しごとに埋め、それぞれに合意を求める。答えは先回りしてまとめて渡さず、聞かれた順に返すこと。そうすれば「合意した」と記録される文面は、必ず自分が見たものになる。Codex CLI では、その最初のセッションを対話で、または `--approve-for-me` 付きで実行する。`.agents/skills/` 配下のディレクトリ作成には承認が要り、プロジェクト内の `.codex/` は読み取り専用でマウントされるので、記録をそこに置いてはならない。

## ライセンス

コード（`scripts/`、JSONマニフェスト）は Apache-2.0（`LICENSE`）。文書とスキル本文（`docs/`、`skills/`、README）は CC-BY-4.0（`LICENSE-docs`）。
