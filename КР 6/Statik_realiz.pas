Unit Statik_realiz;
uses Crt;
const MAX = 100;
type
tInf1 = Integer;
tStack = array [1..MAX] of tInf1;


var top: Integer;
Stack: tStack;
vibor:integer;
var
ch : char;


procedure Push(var Stack : tStack; data : tInf1);
begin
if top = MAX then
Writeln('Ошибка')
else begin
inc(top);
Stack[top] := data;
end;
end;

function Pop(var Stack : tStack) : tInf1;
var
Res: tInf1;
begin
if top = 0 then
Writeln('Ошибка')
else begin
Res := Stack[top];
dec(top);
Clrscr;
end;
Pop := Res;
Writeln('Элемент: ', Res);
end;

procedure Print(Stack : tStack);
var
i: Integer;
begin
if top = 0 then
WriteLn('Стек пуст.')
else begin
for i := 1 to top do
Write(Stack[i], ' ');
WriteLn;
end;
WriteLn;
end;

procedure addToStack(var Stack : tStack);
var
data : tInf1;
begin
Clrscr;
Write('Введите значение добавляемого элемента: '); ReadLn(data);
Push(Stack, data);
WriteLn;
end;

procedure clearStack(var Stack : tStack);
begin
top := 0;
Clrscr;
WriteLn('Стек очищен');
end;
end.
