unit dinam_realiz;
uses Crt;
type
tInf1 = Integer;
Tinf=integer; {тип данных, который будет храниться в элементе стека}
  List=^TList;  {Указатель на элемент типа TList}
  TList=record {А это наименование нашего типа "запись" обычно динамические структуры описываются через запись}
    data:TInf;  {данные, хранимые в элементе}
    next:List;   {указатель на следующий элемент}
  end;

var top: Integer;
vibor:integer;
var
ch : char;

{Процедура добавляющая элемент в стек}
procedure AddElem(var stek1:List;znach1:TInf);
var
  tmp:List;
begin
  New(tmp); {выделяем в памяти место для нового элемента}
  tmp^.next:=stek1;  {указатель на следующий элемент "направляем" на вершину стека}
  tmp^.data:=znach1; {добавляем к элементу данные}
  stek1:=tmp; {вершина стека изменилась, надо перенести и указатели на неё}
end;
 
 {Процедура вывода стека}
procedure proverka(stek1:List);
begin
  if stek1=nil then {проверка на пустоту стека}
  begin
    writeln('Стек пуст.');
    exit;
  end;
end;
 
{Процедура вывода стека}
procedure Print2(stek1:List);
begin
  if stek1=nil then {проверка на пустоту стека}
  begin
    writeln('Стек пуст.');
    exit;
  end;
  while stek1<>nil do {пока указатель stek1 не станет указывать в пустоту}
  begin   {а это произойдёт как только он перейдёт по ссылке последнего элемента}
    Write(stek1^.data, ' '); {выводить данныые}
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
    dispose(tmp); {освободим память занятую под старую вершину}
  end;
end;

 
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
    dispose(tmp); {высвободить память из под элемента}
  end
  else {в случае, если удаляемый элемент не вершина стека, то}
  begin
    tmpi:=stek1; {ставим указатель на вершину стека}
    while tmpi^.next<>tmp do {доходим до элемента стоящего "перед" тем, который нам следует удалить}
      tmpi:=tmpi^.next;
    tmpi^.next:=tmp^.next; {указатель элемента переносим на следующий элемент за удаляемым}
    dispose(tmp); {удаляем элемент}
  end;
end;




{проверка на пустоту}
procedure Print(stek1:List);
begin
  if stek1=nil then {проверка на пустоту стека}
  begin
    writeln('Стек пуст.');
    exit;
  end
  else  writeln('Стек не пуст.');
end;
end.