"SUBSET LIST OF VALUES WITH LIST OF KEYS:"
function! array#ListFilterByKeys(valuelist,keylist)
	let l:outlist=[]
	for l:i in a:keylist
		call add(l:outlist,a:valuelist[l:i])
	endfor
	return l:outlist
endfunction
"" Test: array#ListFilterByKeys
""	let lst=['a','b','c','d']
""	let lsp=[1,2,3]
""	echo array#ListFilterByKeys(lst,lsp)

"SUBSTITUTE PATTERN IN LIST:"
function! array#ListSubstitute(list,pat,sub,flag)
	let l:newlist=[]
	for l:i in a:list
		let l:newitem=substitute(l:i,a:pat,a:sub,a:flag)
		call add(newlist,l:newitem)
	endfor
	return l:newlist
endfunction
"let s:lst=['aa','ab','ac','ada']
""let s:dic={'a':'ehh','b':'hell'}
""echo array#ListSubstitute(s:lst,'a','',0)

"OPERATE ON WHOLE LIST:"
function! array#ListOperate(list,operator)
	let l:opcommand=join(a:list,a:operator)
	let l:result=eval(l:opcommand)
	return l:result
endfunction
""Test: array#ListOperate
""let rnum=genstr#randnum(2,10,10)
""echo array#ListOperate(rnum,'*')

"GET MAXIMUM LENGTH OF PROVIDED LISTS:"
function! array#ListsGetMaxLength(...)
	let l:mlent=0
	for l:i in a:000
		let l:lent=len(l:i)
		let l:mlent=(lent>l:mlent) ? lent : l:mlent
	endfor
	return l:mlent
endfunction
""let lst1=["ac","ad"]
""let lst2=["ac","ad","ed"]
""let lst3=["ac","ad","ed","fda"]
""echo array#ListsGetMaxLength(lst1,lst2,lst3)

"JOIN LISTS BY ITEMS:"
function! array#ListsCatByItems(lst1,lst2)
	let l:j=0
	let l:joined=[]
	for l:i in a:lst1
		let l:join=l:i . a:lst2[l:j]
		let l:j+=1
		call add(l:joined,l:join)
	endfor
	return l:joined
endfunction
""let lst1=["ac","ad"]
""let lst2=["ab","ae"]
""echo array#ListsCatByItems(lst1,lst2)

"CHECK LIST AGAINST ANOTHER LIST AND RETURN LIST JUNCTION:"
function! array#ListsConjunction(mainList,checkedList)
	let l:validItems=[]
	for l:i in a:checkedList
		if matchstr(a:mainList,l:i) == l:i
			call add(l:validItems,l:i)
		endif
	endfor
	return l:validItems
endfunction
"Test array#ListJunction"
""let tlista=["a", "b"]
""let tlistb=["b", "c", "d"]
""echo array#ListsConjunction(tlista,tlistb)

"SUM ALL ATOMS IN LIST:
function! array#ListSum(list)
	let l:ls=0
	for l:i in a:list
		let l:ls+=l:i
	endfor
	return l:ls
endfunction
""echo array#ListSum([1.4,"3",4])

"GET MAXIMUM ITEM WIDTH IN LIST:"
function! array#GetMaxWidth(list)
	let l:maxwidth=max(map(copy(a:list),'strdisplaywidth(v:val)'))
	return l:maxwidth
endfunction
""let tlistb=["a", "ab", "abc"]
""echo array#GetMaxWidth(tlistb)

"GET MAXIMUM LINE WIDTH IN BUFFER:"
function! array#BufferLinesWidthMax()
	let l:lines=getline(1,'$')
	let l:maxwidth=max(map(l:lines,'strdisplaywidth(v:val)'))
	return l:maxwidth
endfunction
""echo array#BufferLinesWidthMax()
