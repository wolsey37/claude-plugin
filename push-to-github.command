#!/bin/bash
# yaksa-studio 플러그인 → GitHub 푸시 스크립트
# 이 파일을 더블클릭하면 자동 실행됩니다

cd "$(dirname "$0")"

echo "📂 현재 디렉토리: $(pwd)"
echo ""

# Git 초기화 (이미 있으면 스킵)
if [ ! -d ".git" ]; then
  echo "🔧 git init..."
  git init
  git remote add origin https://github.com/wolsey37/claude-plugin.git
else
  echo "✅ git 이미 초기화됨"
  # remote가 없으면 추가
  git remote get-url origin 2>/dev/null || git remote add origin https://github.com/wolsey37/claude-plugin.git
fi

echo ""
echo "📦 파일 스테이징..."
git add .

echo ""
echo "💾 커밋..."
git commit -m "feat: yaksa-studio plugin 초기 버전

- /수집: 올리브영 + 쓰레드 실시간 수집 (Chrome MCP)
- /성분: 식약처 기준 전성분 분석
- /비교: 제품 비교표
- /통합: 전체 파이프라인 자동 실행
- /힉스필드: higsfield.com 콘텐츠 가이드
- /디자인: SNS 피드 디자인 분석"

echo ""
echo "🚀 GitHub 푸시..."
git branch -M main
git push -u origin main

echo ""
echo "✅ 완료! https://github.com/wolsey37/claude-plugin"
echo ""
read -p "Press Enter to close..."
