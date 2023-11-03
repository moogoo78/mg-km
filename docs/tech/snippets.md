# MG's Snippets

```javascript title="+md"
javascript:(function()%7Bt='%5B'+decodeURIComponent(document.title)+'%5D('+decodeURIComponent(window.location.href)+')';win=window.open('','_new','location=no,links=no,scrollbars=no,toolbar=no,width=550,height=150');win.document.write('%3Cform%3E%3Ctextarea%20name=%22a%22%20rows=%225%22%20cols=%2250%22%20onClick=%22javascript:this.form.a.focus();this.form.a.select();%22%3E'+t+'%3C/textarea%3E%3C/form%3E');%7D)()
```

```javascript title="+textarea"
javascript:(function()%7Bwin=window.open('','_new','location=no,links=no,scrollbars=no,toolbar=no,width=800,height=600');win.document.write('%3Cform%3E%3Ctextarea%20rows=%2230%22%20cols=%2280%22%3E%3C/textarea%3E%3C/form%3E');%7D)()
```
