﻿Program Stek;
uses
  crt; 
type
  Tinf=integer; {тип данных, который будет храниться в элементе стека}
  List=^TList;  {Указатель на элемент типа TList}
  TList=record {А это наименование нашего типа "запись" обычно динамические структуры описываются через запись}
    data:TInf;  {данные, хранимые в элементе}
    next:List;   {указатель на следующий элемент}
  end;
 
{Процедура добавляющая элемент в стек}
procedure AddElem(var stek1:List;znach1:TInf);
var
  tmp:List;
begin
  GetMem(tmp,sizeof(TList)); {выделяем в памяти место для нового элемента}
  tmp^.next:=stek1;  {указатель на следующий элемент "направляем" на вершину стека}
  tmp^.data:=znach1; {добавляем к элементу данные}
  stek1:=tmp; {вершина стека изменилась, надо перенести и указатели на неё}
end;
 
{Процедура вывода стека}
procedure Print(stek1:List);
begin
  if stek1=nil then {проверка на пустоту стека}
  begin
    writeln('Стек пуст.');
    exit;
  end;
  while stek1<>nil do {пока указатель stek1 не станет указывать в пустоту}
  begin   {а это произойдёт как только он перейдёт по ссылке последнего элемента}
    Write(stek1^.data, ' '); {выводить данне}
    stek1:=stek1^.next  {и переносить указатель вглубь по стеку}
  end;
end;
 
{Процедура освобождения памяти занятой стеком}
Procedure FreeStek(stek1:List);
var
  tmp:List;
begin
  while stek1<>nil do {пока stek1 не станет указывать в "пустоту" делать}
  begin
    tmp:=stek1; {указатель tmp направим на вершину стека}
    stek1:=stek1^.next; {вершину стека перенесём на следующий за данной вершиной элемент}
    FreeMem(tmp,SizeOf(Tlist)); {освободим память занятую под старую вершину}
  end;
end;
 
{Поиск элемента в стеке по значению}
Function SearchElemZnach(stek1:List;znach1:TInf):List;
begin
  if stek1<>nil then {если стек не пуст, то}
    while (Stek1<>nil) and (znach1<>stek1^.data) do {пока stek1 не укажет в "пустоту" или пока мы не нашли нужный нам элемент}
      stek1:=stek1^.next; {переносить указатель}
  SearchElemZnach:=stek1;{функция возвращает указатель на найденный элемент}
end;         {в случае если элемент не найден, она вернёт nil}
 
{Процедура удаления элемента по указателю}
Procedure DelElem(var stek1:List;tmp:List);
var
  tmpi:List;
begin
  if (stek1=nil) or (tmp=nil) then {если стек пуст или указатель никуда не указывает, то выходим}
    exit;
  if tmp=stek1 then {если мы удаляем элемент который является вершиной стека, то}
  begin
    stek1:=tmp^.next;{следует перенести вершину и}
    FreeMem(tmp,SizeOf(TList)); {высвободить память из под элемента}
  end
  else {в случае, если удаляемый элемент не вершина стека, то}
  begin
    tmpi:=stek1; {ставим указатель на вершину стека}
    while tmpi^.next<>tmp do {доходим до элемента стоящего "перед" тем, который нам следует удалить}
      tmpi:=tmpi^.next;
    tmpi^.next:=tmp^.next; {указатель элемента переносим на следующий элемент за удаляемым}
    FreeMem(tmp,sizeof(TList)); {удаляем элемент}
  end;
end;
 
{Процедура удаления элемента по значению}
procedure DelElemZnach(var Stek1:List;znach1:TInf);
var
  tmp:List;
begin
  if Stek1=nil then {Если стек пуст, то выводим сообщение и выходим}
  begin
    Writeln('Стек пуст');
    exit;
  end;
  tmp:=SearchElemZnach(stek1,znach1); {tmp указывает на удаляемый элемент}
  if tmp=nil then {если элемент не был найден, то выводим сообщение и выходим}
  begin
    writeln('Элемент с искомым значением ' ,znach1, ' отсутствует в стеке.');
    exit;
  end;
  DelElem(stek1,tmp); {удаляем элемент из стека }
  Writeln('Элемент удалён.'); {сообщаем о выполнении действия}
end;
 
{Удаление элемента по порядковому номеру (вершина имеет номер 1)}
Procedure DelElemPos(var stek1:List;posi:integer);
var
  i:integer;
  tmp:List;
begin
  if posi<1 then {проверка на ввод информации}
    exit;
  if stek1=nil then {если стек пуст}
  
  
  begin
    Write('Стек пуст');
    exit
  end;
  i:=1; {будет считать позиции}
  tmp:=stek1;
  while (tmp<>nil) and (i<>posi) do {пока tmp не укажет в "пустоту" или мы не найдём искомый элемент}
  begin
    tmp:=tmp^.next; {переходим на следующий элемент}
    inc(i)   {увеличиваем значение счётчика}
  end;
  if tmp=nil then {если элемента нет выводим соответствующие сообщения и выходим}
  begin
    Writeln('Элемента с порядковым номером ' ,posi, ' нет в стеке.');
    writeln('В стеке ' ,i-1, ' элемента(ов).');
    exit
  end;
  DelElem(stek1,tmp); {если мы не вышли, то элемент есть и его следует удалить}
  Writeln('Элемент удалён.'); {сообщаем о выполнении действия}
end;
 
 
var
  Stk, {переменная, которая всегда будет указывать на "вершину" стека}
  tmpl:List; {рабочая переменная}
  znach:Tinf; {данные вводимые пользователем}
  ch:char; {для работы менюшки}
begin
    Stk:=nil;
    repeat {цикл для нашего меню}
    clrscr; {очистка экрана, далее идёт вывод самого меню}
    Write('Программа для работы со ');
   
    Writeln('стеком.');
    Writeln('Выберите желаемое действие:');
    Writeln('1) Добавить элемент.');
    Writeln('2) Вывод стека.');
    Writeln('3) Удаление элемента по значению.');
    Writeln('4) Удаление элемента по порядковому номеру.');
    Writeln('5) Поиск элемента по значению');
    Writeln('8) Выход.');
    writeln;
    ch:=readkey; {ожидаем нажатия клавиши}
    case ch of {выбираем клавишу}
      '1':begin
            write('Введите значение добавляемого элемента: ');
            readln(znach); {считываем значение добавляемого нового элемент}
            AddElem(Stk,znach);
          end;
      '2':begin
            clrscr; {очистка экрана}
            Print(Stk); {вызов процедуры вывода}
            readkey; {ожидаем нажатия клавиши}
          end;
      '3':begin
            Write('Введите значение удаляемого элемента: ');
            readln(znach); {ввод значения удаляемого элемента}
            DelElemZnach(Stk,znach); {вызов процедуры удаления элемента по значению}
            readkey;{ожидаем нажатия клавиши}
          end;
      '4':begin
            Write('Введите порядковый номер удаляемого элемента: ');
            readln(znach); {ввод позиции удаляемого файла}
            DelElemPos(Stk,znach);{вызов процедуры удаления элемента по значению}
            readkey;{ожидаем нажатия клавиши}
          end;
      '5':begin
            write('Введите значение искомого элемента: ');
            readln(znach); {ввод искомого значения}
            tmpl:=SearchElemZnach(Stk,znach); {вызываем процедуру поиска элемента по значению}
            if tmpl=nil then {проверяем найден ли элемент и выводим соответствующие сообщения}
              write('Искомый элемент отсутствует в стеке')
            else
              write('Элемент ',tmpl^.data,' найден');
            readkey;{ожидаем нажатия клавиши}
          end;
     
           
          end;
    until ch='8';
  FreeStek(Stk); {освобождаем память занятую стеком}
end.