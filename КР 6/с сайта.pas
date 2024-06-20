type PNode = ^Node; { указатель на узел }
     Node = record
       data: char;  { полезная }
       next: PNode; { указатель на след. элемент }
     end;
     
procedure Push( var Head: PNode; x: char);
var NewNode: PNode;
begin
  New(NewNode);          { выделение памяти }
  NewNode^.data := x;    { запись символа }
  NewNode^.next := Head; { сделать первым узлом }
  Head := NewNode;
end;    

function Pop ( var Head: PNode ): char;
var q: PNode;
begin
  if Head = nil then begin { если стек пустой } 
    Result := char(255); { неиспользуемый символ, т.е. ошибка }
    Exit;
  end;
  Result := Head^.data;  { берем верхний символ }
  q := Head;             { запоминаем вершину } 
  Head := Head^.next; { удаляем вершину }
  Dispose(q);            { удаление из памяти }
end;

function isEmptyStack ( S: Stack ): Boolean;
begin
  Result := (S = nil);
end;

 var S: PNode;
...
S := nil;