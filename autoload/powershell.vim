
scriptencoding utf-8

function! powershell#exec(line)
  let result = ''
  let path = tr(tempname() . '.ps1', '\', '/')
  try
    call writefile([(a:line)], path)
    let result = vimproc#system(printf("powershell.exe -ExecutionPolicy RemoteSigned -File \"%s\"", path))
  catch '.*'
  finally
    call delete(path)
  endtry
  return result
endfunction

function! powershell#complete(findstart, base)
  let xs = []
  try
    " TODO
    " let xs = split(powershell#exec('2 | get-member | %{ $_.Name }'), "\n")
  catch '.*'
  endtry
  if a:findstart
    return get(xs, 0, '')
  else
    return xs
  endif
endfunction

