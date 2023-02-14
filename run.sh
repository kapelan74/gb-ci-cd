#!/bin/bash

echo "Создаем нэймспэйс для раннера.."
kubectl create ns gitlab
echo "Укажите регистрационный токен:"
read token
sed -i "s/Enter your registration token here/$token/g" gitlab-runner/gitlab-runner.yaml
echo "Применяем манифесты для раннера.."
kubectl apply --namespace gitlab -f gitlab-runner/gitlab-runner.yaml
echo "Обновляем страницу на GitLab, runner должен появиться в списке Available specific runners"