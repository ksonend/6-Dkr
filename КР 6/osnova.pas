uses Crt, dinam_realiz, Statik_realiz;
const MAX = 100;
type
tInf1 = Integer;
tStack = array [1..MAX] of tInf;
Tinf=integer; {тип данных, который будет храниться в элементе стека}
  List=^TList;  {Указатель на элемент типа TList}
  TList=record {А это наименование нашего типа "запись" обычно динамические структуры описываются через запись}
    data:TInf;  {данные, хранимые в элементе}
    next:List;   {указатель на следующий элемент}
  end;

var top: Integer;
Stack: tStack;
vibor:integer;
var
ch : char;

var
  Stk, {переменная, которая всегда будет указывать на "вершину" стека}
  tmpl:List; {рабочая переменная}
  znach:Tinf; {данные вводимые пользователем}
  
begin
top := 0;
repeat
Writeln('Программа для работы со стеком ');
Writeln('Выберите действие:');
Writeln('1) Добавить элемент.');
Writeln('2) Вывод стека.');
Writeln('3) Проверка стека на пустоту');
Writeln('4) Очистить стек');
Writeln('5) Убрать элемент из стека.');
Writeln('6) Провести реализацию структуры с помощью динамиеской памяти.');
Writeln('7) Провести реализацию структуры с помощью статической памяти.');
Writeln('8) Выход.');
writeln;
readln(ch);
case ch of 
  '1' : begin if vibor=1 then AddElem(Stack) else addToStack(Stack);end;
  '2' :  if vibor=1 then Print2(Stack) else begin
          Clrscr;
          Write('Cодержимое стека = ');
          Print(Stack);
        end; 
  '3' : if vibor=1 then proverka(Stack) else begin
          Clrscr;
          WriteLn('Стек пуст = ', top = 0);
        end;
  '4' : if vibor=1 then FreeStek(Stack) else clearStack(Stack);
  '5' : if vibor=1 then Print(Stack) else Pop(Stack);
  '6': vibor:=1;
  '7': vibor:=0;
end;
until ch='8';

clearStack(Stack);
end.
