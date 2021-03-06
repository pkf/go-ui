module("label")

name = "Label"
base = "Frame"

funcs = [[
+ Init()
+ InitWithText(text string)
+ InitWithPixmap(pixmap *Pixmap)
@ SetText(text string)
@ Text() (text string)
@ SetWordWrap(b bool)
@ WordWrap() (b bool)
@ SetTextFormat(format int)
@ TextFormat() (format int)
@ SetPixmap(pixmap *Pixmap)
@ Pixmap() (pixmap *Pixmap)
* OnLinkActivated(fn func(string))
]]


qtdrv = {
inc = "<QLabel>",
name = "QLabel *",

Init = [[
drvNewObj(a0,new QLabel);
]],
InitWithText = [[
drvNewObj(a0, new QLabel(drvGetString(a1)));
]],
InitWithPixmap = [[
QLabel *label = new QLabel;
label->setPixmap(drvGetPixmap(a1));
drvNewObj(a0,label);
]],

SetText = "setText",
Text = "text",
SetWordWrap = "setWordWrap",
WordWrap = "wordWrap",
SetTextFormat = [[
self->setTextFormat((Qt::TextFormat)drvGetInt(a1));
]],
TextFormat = [[
drvSetInt(a1,self->textFormat());
]],
SetPixmap = "setPixmap",
Pixmap = "pixmap",

OnLinkActivated = [[
QObject::connect(self,SIGNAL(linkActivated(QString)),drvNewSignal(self,a1,a2),SLOT(call(QString)));
]],

}
