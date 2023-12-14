# MG's Snippets

## Bookmarklet

```javascript title="markdown link"
javascript:(function()%7Bt='%5B'+decodeURIComponent(document.title)+'%5D('+decodeURIComponent(window.location.href)+')';win=window.open('','_new','location=no,links=no,scrollbars=no,toolbar=no,width=550,height=150');win.document.write('%3Cform%3E%3Ctextarea%20name=%22a%22%20rows=%225%22%20cols=%2250%22%20onClick=%22javascript:this.form.a.focus();this.form.a.select();%22%3E'+t+'%3C/textarea%3E%3C/form%3E');%7D)()
```

```javascript title="markdown link (strip facebook ads)"
javascript:(function()%7Bt='%5B'+decodeURIComponent(document.title)+'%5D('+decodeURIComponent(window.location.href.split('?fbclid=')[0])+')';win=window.open('','_new','location=no,links=no,scrollbars=no,toolbar=no,width=550,height=150');win.document.write('%3Cform%3E%3Ctextarea%20name=%22a%22%20rows=%225%22%20cols=%2250%22%20onClick=%22javascript:this.form.a.focus();this.form.a.select();%22%3E'+t+'%3C/textarea%3E%3C/form%3E');%7D)()
```

```javascript title="open textarea"
javascript:(function()%7Bwin=window.open('','_new','location=no,links=no,scrollbars=no,toolbar=no,width=800,height=600');win.document.write('%3Cform%3E%3Ctextarea%20rows=%2230%22%20cols=%2280%22%3E%3C/textarea%3E%3C/form%3E');%7D)()
```

```python title="write csv"
import csv
with open('eggs.csv', 'w', newline='') as csvfile:
    spamwriter = csv.writer(csvfile)
    spamwriter.writerow(['Spam'] * 5 + ['Baked Beans'])
    spamwriter.writerow(['Spam', 'Lovely Spam', 'Wonderful Spam'])
```


```python title="read csv"
import csv
with open('eggs.csv', newline='') as csvfile:
    spamreader = csv.reader(csvfile)
    for row in spamreader:
        print(', '.join(row))

with open('names.csv', newline='') as csvfile:
    reader = csv.DictReader(csvfile)
    for row in reader:
        print(row['first_name'], row['last_name'])
```
