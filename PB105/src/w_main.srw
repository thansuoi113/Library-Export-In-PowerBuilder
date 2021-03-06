$PBExportHeader$w_main.srw
forward
global type w_main from window
end type
type cb_1 from commandbutton within w_main
end type
type sle_dir from singlelineedit within w_main
end type
type st_4 from statictext within w_main
end type
type cb_2 from commandbutton within w_main
end type
type cb_load from commandbutton within w_main
end type
type st_3 from statictext within w_main
end type
type st_2 from statictext within w_main
end type
type sle_1 from singlelineedit within w_main
end type
type ddplb_type from dropdownpicturelistbox within w_main
end type
type cb_browser from commandbutton within w_main
end type
type st_1 from statictext within w_main
end type
type dw_objects from datawindow within w_main
end type
type sle_pbl from singlelineedit within w_main
end type
end forward

global type w_main from window
integer width = 3246
integer height = 1992
boolean titlebar = true
string title = "Library Export"
boolean controlmenu = true
boolean minbox = true
boolean maxbox = true
boolean resizable = true
long backcolor = 67108864
string icon = "AppIcon!"
boolean center = true
cb_1 cb_1
sle_dir sle_dir
st_4 st_4
cb_2 cb_2
cb_load cb_load
st_3 st_3
st_2 st_2
sle_1 sle_1
ddplb_type ddplb_type
cb_browser cb_browser
st_1 st_1
dw_objects dw_objects
sle_pbl sle_pbl
end type
global w_main w_main

forward prototypes
public function integer wf_getlistobject (string as_pbl)
public function libexporttype wf_libexporttype (string as_type, ref string as_ext)
end prototypes

public function integer wf_getlistobject (string as_pbl);String ls_entries
Integer li_pos
Long i

ls_entries = librarydirectoryex(as_pbl,dirall!)
dw_objects.Reset()
//messagebox("", ls_entries)
If ls_entries > "" Then
	dw_objects.ImportString(ls_entries)
	dw_objects.Sort()

	For i = 1 To dw_objects.RowCount()
		dw_objects.Object.objects_img[i] = "Img\" +  (dw_objects.Object.objects_type[i] + ".bmp")
		dw_objects.Object.objects_url[i] = as_pbl
	Next

	Return 0
Else
	Return -1
End If
dw_objects.sort()
dw_objects.setredraw( false)
dw_objects.setredraw( true)

end function

public function libexporttype wf_libexporttype (string as_type, ref string as_ext);String is_type[] = {"Application","DataWindow","Function","Menu","Pipeline","Project","Query","Structure","UserObject","Window"}
libexporttype il_type[] = {exportapplication!,exportdatawindow!,exportfunction!,exportmenu!,exportpipeline!,exportproject!,exportquery!,exportstructure!,exportuserobject!,exportwindow!}
Integer ii_count = 10
String ls_ext[] = {"sra","srd","srf","srm","srp","srj","srq","srs","sru","srw"}

Integer i

For i = 1 To ii_count
	If Lower(Trim(is_type[i])) = Lower(Trim(as_type)) Then
		as_ext = ls_ext[i]
		Return il_type[i]
	End If
Next

as_ext = ls_ext[2]
Return exportdatawindow!


end function

on w_main.create
this.cb_1=create cb_1
this.sle_dir=create sle_dir
this.st_4=create st_4
this.cb_2=create cb_2
this.cb_load=create cb_load
this.st_3=create st_3
this.st_2=create st_2
this.sle_1=create sle_1
this.ddplb_type=create ddplb_type
this.cb_browser=create cb_browser
this.st_1=create st_1
this.dw_objects=create dw_objects
this.sle_pbl=create sle_pbl
this.Control[]={this.cb_1,&
this.sle_dir,&
this.st_4,&
this.cb_2,&
this.cb_load,&
this.st_3,&
this.st_2,&
this.sle_1,&
this.ddplb_type,&
this.cb_browser,&
this.st_1,&
this.dw_objects,&
this.sle_pbl}
end on

on w_main.destroy
destroy(this.cb_1)
destroy(this.sle_dir)
destroy(this.st_4)
destroy(this.cb_2)
destroy(this.cb_load)
destroy(this.st_3)
destroy(this.st_2)
destroy(this.sle_1)
destroy(this.ddplb_type)
destroy(this.cb_browser)
destroy(this.st_1)
destroy(this.dw_objects)
destroy(this.sle_pbl)
end on

event resize;dw_objects.width = newwidth - 10
dw_objects.height = newheight - dw_objects.y - 10

end event

event open;

end event

type cb_1 from commandbutton within w_main
integer x = 2377
integer y = 256
integer width = 123
integer height = 84
integer taborder = 20
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "..."
end type

event clicked;String ls_path
Integer li_result

ls_path = sle_dir.Text

li_result = GetFolder( "Choose Folder", ls_path )

If Len(ls_path) > 0 Then
	sle_dir.Text = ls_path
End If


end event

type sle_dir from singlelineedit within w_main
integer x = 219
integer y = 256
integer width = 2158
integer height = 84
integer taborder = 10
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
borderstyle borderstyle = stylelowered!
end type

type st_4 from statictext within w_main
integer x = 37
integer y = 256
integer width = 146
integer height = 76
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Dir:"
alignment alignment = right!
boolean focusrectangle = false
end type

type cb_2 from commandbutton within w_main
integer x = 2523
integer y = 256
integer width = 270
integer height = 84
integer taborder = 30
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "Export"
end type

event clicked;String ls_path
Integer li_result
Long ll_row
String ls_chk, ls_pbl, ls_objects_name, ls_objects_type
String ls_source, ls_errors, ls_ext
Integer li_FileNum
libexporttype libtype

ls_path = sle_dir.Text
If IsNull(ls_path) Or Len(Trim(ls_path)) = 0 Then
	Messagebox("Warning", "Directory Is Null")
	Return
End If

If dw_objects.AcceptText( ) = -1 Then Return
For ll_row = 1 To dw_objects.RowCount()
	ls_chk = dw_objects.GetItemString(ll_row, "chk")
	ls_pbl = dw_objects.GetItemString(ll_row, "objects_url")
	ls_objects_name = dw_objects.GetItemString(ll_row, "objects_name")
	ls_objects_type = dw_objects.GetItemString(ll_row, "objects_type")
	
	If IsNull(ls_chk) Or Len(Trim(ls_chk)) = 0 Then ls_chk = ""
	If ls_chk <> "Y" Then Continue
	libtype = wf_libexporttype(ls_objects_type , ls_ext)
	ls_source = ""
	ls_source = LibraryExport(ls_pbl, ls_objects_name, libtype)
	// Save to the file
	If IsNull(ls_ext) Or Len(Trim(ls_ext)) = 0 Then ls_ext = "txt"
	li_FileNum = FileOpen(ls_path + "\" + ls_objects_name + "." +ls_ext , StreamMode!, Write!, LockWrite!, Replace!)
	ls_source = "$PBExportHeader$" + ls_objects_name + "." +ls_ext + "~r~n" + ls_source
	FileWrite(li_FileNum, ls_source)
	FileClose(li_FileNum)
	
Next

Messagebox("Warning","Success")


end event

type cb_load from commandbutton within w_main
integer x = 2523
integer y = 32
integer width = 233
integer height = 84
integer taborder = 20
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "Load"
end type

event clicked;String ls_pbl

dw_objects.Reset()

ls_pbl = sle_pbl.Text
If IsNull(ls_pbl) Or Len(Trim(ls_pbl)) = 0 Then Return

wf_getlistobject(ls_pbl)

end event

type st_3 from statictext within w_main
integer x = 1024
integer y = 140
integer width = 155
integer height = 76
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Find:"
alignment alignment = right!
boolean focusrectangle = false
end type

type st_2 from statictext within w_main
integer x = 37
integer y = 140
integer width = 155
integer height = 76
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Type:"
alignment alignment = right!
boolean focusrectangle = false
end type

type sle_1 from singlelineedit within w_main
event ue_edit pbm_enchange
integer x = 1207
integer y = 140
integer width = 1152
integer height = 84
integer taborder = 10
boolean bringtotop = true
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
borderstyle borderstyle = stylelowered!
end type

event ue_edit;String ls_filter
String ls_text
String ls_type

ls_type = ddplb_type.Text

If IsNull(ls_type) Or Len(Trim(ls_type)) = 0 Then ls_type = ""
If ls_type = "All Objects" Then ls_type = ""

If ls_type = "" Then
	ls_filter = ""
Else
	ls_filter = "(upper(objects_type) = '" + Upper(ls_type) + "')"
End If

ls_text = Upper(Trim(Text))

If ls_text > "" Then
	
	If ls_filter > "" Then
		ls_filter = ls_filter + " and (upper(objects_name) like '%" + ls_text + "%')"
	Else
		ls_filter = ls_filter + " (upper(objects_name) like '%" + ls_text + "%')"
	End If
	
End If

dw_objects.SetFilter(ls_filter)
dw_objects.Filter()
Return

end event

type ddplb_type from dropdownpicturelistbox within w_main
integer x = 219
integer y = 140
integer width = 768
integer height = 928
integer taborder = 30
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
string item[] = {"All Objects","Application","DataWindow","Function","Menu","Pipeline","Project","Query","Structure","UserObject","Window"}
borderstyle borderstyle = stylelowered!
integer itempictureindex[] = {11,1,2,3,4,5,6,7,8,9,10}
string picturename[] = {"Img\Application.bmp","Img\DataWindow.bmp","Img\Function.bmp","Img\Menu.bmp","Img\Pipeline.bmp","Img\Project.bmp","Img\Query.bmp","Img\Structure.bmp","Img\UserObject.bmp","Img\Window.bmp","Img\Library.bmp"}
long picturemaskcolor = 536870912
end type

event selectionchanged;
String ls_type

dw_objects.SetRedraw(False)
ls_type = ddplb_type.Text
If IsNull(ls_type) Or Len(Trim(ls_type)) = 0 Then ls_type = ""
If ls_type = "All Objects" Then ls_type = ""

If ls_type = "" Then
	dw_objects.SetFilter("")
Else
	dw_objects.SetFilter("upper(objects_type) = '" + Upper(ls_type) + "'")
End If

dw_objects.Filter()
dw_objects.Sort()
dw_objects.SetRedraw(True)
Return

end event

type cb_browser from commandbutton within w_main
integer x = 2377
integer y = 32
integer width = 123
integer height = 84
integer taborder = 20
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "..."
end type

event clicked;String ls_path, ls_file
Int li_rc

ls_path = sle_pbl.Text
li_rc = GetFileSaveName ( "Select File",   ls_path, ls_file, "pbl",  "PBL (*.pbl),*.pbl,All Files (*.*),*.*" )

If li_rc = 1 Then
	sle_pbl.Text = ls_path
End If

end event

type st_1 from statictext within w_main
integer x = 37
integer y = 32
integer width = 146
integer height = 76
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "PBL:"
alignment alignment = right!
boolean focusrectangle = false
end type

type dw_objects from datawindow within w_main
integer y = 384
integer width = 3145
integer height = 1472
integer taborder = 20
string title = "none"
string dataobject = "d_object_list"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event constructor;Long ll_column
String ls_color, ls_border,ls_dw_color

ls_dw_color = This.Describe("datawindow.color")
ls_color  = "0~t if(getrow()=currentrow(), 29935871, "+ls_dw_color+")"
ls_border = "0~t if(getrow()=currentrow(), 5, 0)"

For ll_column = 1 To Long(This.Object.datawindow.column.count)
	If  Not (ll_column = 7  ) Then
		This.Modify("#"+String(ll_column)+".background.color = '"+ls_color+"'")
		This.Modify("#"+String(ll_column)+".border           = '"+ls_border+"'")
	End If
Next
end event

event itemchanged;Long ll_found

Choose Case dwo.Name
	Case "chk"
		If This.RowCount() = 0 Then Return
		If Data = "Y" Then
			If row > 1 And row < This.RowCount() Then
				ll_found = This.Find(  "chk = 'N'",  1, row -1) +  This.Find(  "chk = 'N'",  row + 1, This.RowCount())
			Else
				If row = 1 Then
					ll_found = This.Find(  "chk = 'N'",  2, This.RowCount())
				Else
					ll_found = This.Find(  "chk = 'N'",  1, This.RowCount() - 1)
				End If
			End If
			If ll_found = 0 Then
				This.SetItem(1, "chkall", "Y")
			Else
				This.SetItem(1, "chkall", "N")
			End If
		Else
			This.SetItem(1, "chkall", "N")
		End If
End Choose


end event

event clicked;String ls_chk, ls_chkall
Long ll_row
Long ll_found

Choose Case dwo.Name
	Case "chkall"
		If This.RowCount() = 0 Then Return
		ls_chkall = This.GetItemString(1, "chkall")
		If IsNull(ls_chkall) Or Len(Trim(ls_chkall)) = 0 Then ls_chkall = "N"
		If ls_chkall = "N" Then
			ls_chkall = "Y"
		Else
			ls_chkall = "N"
		End If
		For ll_row = 1 To This.RowCount()
			This.SetItem(ll_row, "chk", ls_chkall)
		Next
		This.SetItem(1, "chkall", ls_chkall)
		
End Choose


end event

type sle_pbl from singlelineedit within w_main
integer x = 219
integer y = 32
integer width = 2158
integer height = 84
integer taborder = 10
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
borderstyle borderstyle = stylelowered!
end type

