PROGRAM Z80Pas;
(*<Compiler main module. *)
(*
  Copyright (c) 2009, 2010 Guillermo Martínez J.

  This software is provided 'as-is', without any express or implied
  warranty. In no event will the authors be held liable for any damages
  arising from the use of this software.

  Permission is granted to anyone to use this software for any purpose,
  including commercial applications, and to alter it and redistribute it
  freely, subject to the following restrictions:

    1. The origin of this software must not be misrepresented; you must not
    claim that you wrote the original software. If you use this software
    in a product, an acknowledgment in the product documentation would be
    appreciated but is not required.

    2. Altered source versions must be plainly marked as such, and must not be
    misrepresented as being the original software.

    3. This notice may not be removed or altered from any source
    distribution.
*)
USES
  Compiler, (* THE compiler *)
  Configuration,
  sysutils;



(* Shows a "banner" with the name and copyright. *)
  PROCEDURE Title;
  BEGIN
    WriteLn ('Z80 Pascal compiler (WIP version)');
    WriteLn ('(c) 2009, 2010 by Guillermo Martínez');
    WriteLn;
  END;


VAR
  PascalCompiler: TCompiler;
BEGIN
  TRY
    Title;
    Configuration.Load;
    IF Configuration.InputFileName = '' THEN
      RAISE Exception.Create ('No input file given...');
    PascalCompiler := TCompiler.Create;
    PascalCompiler.FileName := Configuration.InputFileName;
    PascalCompiler.Compile;
    WriteLn ('Compilation finished.');
    PascalCompiler.SaveToFile (Configuration.OutputFileName);
    WriteLn ('File saved at '''+Configuration.OutputFileName+'''.');
  EXCEPT
    ON Error: Exception DO
      WriteLn (Error.Message);
  END;
  Configuration.Unload;
END.
