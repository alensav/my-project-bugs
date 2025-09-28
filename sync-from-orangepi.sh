#!/bin/bash

# Каталог для багов
BUGS_DIR="/home/alensav/my-project-git/bugs"
mkdir -p "$BUGS_DIR"

# Синхронизация с Orange PI
echo "🔄 Синхронизация с Orange PI..."
rsync -av --delete orangepi@192.168.1.75:/home/orangepi/my-project/bugs/ "$BUGS_DIR/"

# Проверяем, изменились ли файлы
if ! git diff --quiet "$BUGS_DIR" || ! git diff --cached --quiet "$BUGS_DIR"; then
    echo "📦 Обнаружены изменения. Добавляем в Git..."
    git add "$BUGS_DIR"
    git commit -m "Sync bugs: $(date +'%Y-%m-%d %H:%M')"
    echo "✅ Коммит создан"
else
    echo "ℹ️ Нет изменений"
fi
