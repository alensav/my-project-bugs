#!/bin/bash

cd /home/alensav/my-project-git

# Добавляем все изменения
git add bugs/

# Проверяем, есть ли что коммитить
if ! git diff --quiet --cached; then
    git commit -m "Auto-sync: $(date +'%Y-%m-%d %H:%M')"
    git push origin master
    echo "✅ Изменения отправлены в GitHub"
else
    echo "ℹ️ Нет изменений для отправки"
fi
