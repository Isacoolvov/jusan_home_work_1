# Home Work 1

1. **Создание директории и файла:**
   Создайте директорию с именем "MyDirectory" и в этой директории создайте файл "MyFile.txt". Затем выведите список файлов и директорий в текущем каталоге.
```bash
#!/bin/bash
mkdir MyDirectory
cd MyDirectory
touch MyFile.txt
ls -la
```

2. **Копирование файлов:**
   Скопируйте все файлы с расширением ".txt" из одной директории в другую. Затем выведите список скопированных файлов.
```bash
#!/bin/bash
mkdir NewDirectory
cp *.txt NewDirectory
cd ./NewDirectory
ls -la
```

3. **Поиск слова:**
   Напишите скрипт, который будет искать все файлы в текущей директории и ее поддиректориях, содержащие слово "ключевое_слово". Выведите список найденных файлов.
```bash
#!/bin/bash

if [ $# -eq 0 ]; then
	echo "Нет ключевого слова в качестве аргумента"
	exit 1
fi

find ./ -type f | grep "$1"
```

4. **Архивирование и распаковка:**
   Создайте архив (tar) из нескольких файлов и директорий, а затем распакуйте его. Убедитесь, что файлы восстановлены корректно.
```bash
#!/bin/bash
tar -cvf archive.tar words.txt z5_text_file.txt
mkdir MyNewTarDirectory
tar --directory=MyNewTarDirectory/ -xvf archive.tar
```

5. **Обработка текстового файла:**
   Создайте текстовый файл с несколькими строками текста. Напишите скрипт, который будет читать файл и выдавать каждую строку в обратном порядке.

Текстовый файл: words.txt

Скрипт:
```bash
#!/bin/bash

if [ $# -eq 0 ]; then
	echo "Аргумент отсутствует"
	exit 1
fi

tac "$1"
```

6. **Автоматизация резервного копирования:**
   Напишите скрипт, который будет регулярно (например, каждую неделю) создавать резервные копии определенных директорий и сохранять их с датой в имени файла.

Скрипт бэкапа: z6.sh
```bash
#!/bin/bash

if [ ! -d "BackupDirectory" ]; then
	mkdir BackupDirectory
	echo "Папка BackupDirectory создана"
fi

source_d=("z1.sh")
backup_d=("./BackupDirectory")

filename_backup="backup_$(date +\%Y\%m\%d).tar.gz"

tar -czvf "$backup_d/$filename_backup" "${source_d[@]}"
```

Скрипт установки расписания: z6_install.sh
```bash
#!/bin/bash

text="00 00 * * * root ./z6.sh"
temp_c=$(mktemp)
crontab -l > "$temp_c"
echo "$text" >> "$temp_c"
crontab "$temp_c"
rm "$temp_c"
echo "Complete"
```

7. **Подсчет количества слов:**
   Напишите скрипт, который будет принимать текстовый файл в качестве аргумента и подсчитывать количество слов в этом файле.

Текстовый файл: words.txt

Скрипт посчета количества слов: z7.sh
```bash
#!/bin/bash

if [ $# -eq 0 ]; then
	echo "Нет файла в качестве аргумента"
	exit 1
fi

if [ ! -f "$1" ]; then
	echo "Файл '$1' не существует"
	exit 1
fi

words=$(wc -w < "$1")

echo "Количество слов: '$words'"
```

8. **Создание случайных паролей:**
   Напишите скрипт, который будет генерировать случайные пароли заданной длины и сохранять их в файл.
```bash
#!/bin/bash

read -p "Укажите длину пароля: " pass_in

pass_length=$((pass_in))

> passwords.txt

gen_pass() {
	tr -dc 'A-Za-z0-9' < /dev/urandom | head -c "$pass_length"
	echo
}

for ((i=1; i<=5; i++)); do
	pass=$(gen_pass)
	echo "$pass" >> "passwords.txt"
done

cat "passwords.txt"
```

9. **Подсчет файлов:**
Напишите скрипт, который будет использовать цикл for для подсчета количества файлов и директорий в текущей директории.
```bash
#!/bin/bash

dir_c=0
file_c=0

for i in *; do
	if [ -d "$i" ]; then
		((dir_c++))
	elif [ -f "$i" ]; then
		((file_c++))
	fi
done

echo -e "DIR's: $dir_c\nFiles: $file_c"
```

10. **Автоматизация задачи обновления системы:**
    Напишите скрипт, который будет проверять наличие обновлений системы и, если они доступны, автоматически устанавливать их.
```bash
#!/bin/bash

dnf check-update

if [ $? -eq 100 ]; then
	dnf upgrade -y
	echo "Update comlete"
else
	echo "No Updates"
fi
```
