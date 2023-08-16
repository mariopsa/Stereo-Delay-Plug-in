<Cabbage> bounds(0, 0, 0, 0)
form caption("CHANNEL DELAY") size(750, 450), guiMode("queue") pluginId("def1"),colour(158, 210, 190)
rslider bounds(564, 16, 100, 100), channel("DryWet"), range(0, 1, 0.62, 1, 0.01), text("DRY/WET"), trackerColour(70, 142, 103, 255), outlineColour(0, 0, 0, 50), textColour(0, 0, 0, 255) markerColour(70, 142, 103, 255)

groupbox bounds(6, 8, 229, 432) text("LEFT") colour(126, 170, 146, 255) outlineColour(130, 64, 6, 255) fontColour(60, 30, 2, 255) channel("groupbox1")
groupbox bounds(494, 252, 247, 184) text("REVERB") colour(126, 170, 146, 255) outlineColour(130, 64, 6, 255) fontColour(60, 30, 2, 255) channel("groupbox2")
groupbox bounds(494, 138, 247, 99) text("SYNC MODE") colour(126, 170, 146, 255) outlineColour(130, 64, 6, 255) fontColour(60, 30, 2, 255) channel("groupbox3")
groupbox bounds(244, 8, 230, 432) text("RIGHT") colour(126, 170, 146, 255) outlineColour(130, 64, 6, 255) fontColour(60, 30, 2, 255) channel("groupbox4")

rslider bounds(16, 46, 100, 100), channel("TimeLeft"), range(0, 2, 0, 1, 0.01), text("Time (s)"),trackerColour(166, 101, 42, 255), outlineColour(0, 0, 0, 50), textColour(0, 0, 0, 255) markerColour(130, 64, 6, 255)
rslider bounds(254, 46, 100, 100), channel("TimeRight"), range(0, 2, 0.215, 1, 0.001), text("Time (s)"),trackerColour(166, 101, 42, 255), outlineColour(0, 0, 0, 50), textColour(0, 0, 0, 255) markerColour(130, 64, 6, 255)

rslider bounds(16, 156, 100, 100), channel("FDB_Left"), range(0, 1, 0.32, 1, 0.01), text("Feedback"), trackerColour(166, 101, 42, 255), outlineColour(0, 0, 0, 50), textColour(0, 0, 0, 255) markerColour(130, 64, 6, 255)
rslider bounds(256, 156, 100, 100), channel("FDB_Right"), range(0, 1, 0.232, 1, 0.001), text("Feedback"), trackerColour(166, 101, 42, 255), outlineColour(0, 0, 0, 50), textColour(0, 0, 0, 255) markerColour(130, 64, 6, 255)

rslider bounds(508, 302, 100, 100), channel("Room"), range(0, 1, 0.384, 1, 0.001), text("Room Size"), trackerColour(214, 130, 20, 255), outlineColour(0, 0, 0, 50), textColour(0, 0, 0, 255) markerColour(214, 130, 20, 255)
rslider bounds(626, 302, 100, 100), channel("Damp"), range(0, 1, 0.232, 1, 0.001), text("Damp"), trackerColour(214, 130, 20, 255), outlineColour(0, 0, 0, 50), textColour(0, 0, 0, 255) markerColour(214, 130, 20, 255)

checkbox bounds(580, 180, 70, 34) text("Sync") channel("Sync")  colour:1(202, 27, 4, 255) fontColour:0(0, 0, 0, 255) fontColour:1(0, 0, 0, 255)
checkbox bounds(132, 108, 85, 34) text("Notes") channel("NotesL")  colour:1(202, 27, 4, 255) fontColour:0(0, 0, 0, 255) fontColour:1(0, 0, 0, 255)
checkbox bounds(376, 108, 84, 34) text("Notes") channel("NotesR")  colour:1(202, 27, 4, 255) fontColour:0(0, 0, 0, 255) fontColour:1(0, 0, 0, 255)

hslider bounds(288, 310, 150, 50) channel("LowR"), text("Low-cut"), range(20, 2000, 1296.38, 1, 0.001), textColour(0, 0, 0, 255) trackerColour(231, 164, 76, 255) colour(161, 59, 6, 255)
hslider bounds(34, 310, 150, 50) channel("LowL"), text("Low-cut"), range(20, 2000, 20, 1, 0.001), textColour(0, 0, 0, 255) trackerColour(231, 164, 76, 255) colour(161, 59, 6, 255)
hslider bounds(288, 374, 150, 50) channel("CutR"), text("High-cut"), range(2000, 16000, 16000, 1, 0.001), textColour(0, 0, 0, 255) trackerColour(231, 164, 76, 255) colour(161, 59, 6, 255)
hslider bounds(34, 374, 150, 50) channel("CutL"), text("High-cut"), range(2000, 16000, 16000, 1, 0.001), textColour(0, 0, 0, 255) trackerColour(231, 164, 76, 255) colour(161, 59, 6, 255) 

combobox bounds(134, 174, 80, 20), , channel("NoteQuantL") text("1/4", "1/8", "1/16")
combobox bounds(376, 174, 80, 20), , channel("NoteQuantR") text("1/4", "1/8", "1/16")


label bounds(318, 280, 88, 17) channel("label10020") text("EQ") fontColour(0, 0, 0, 255) colour(166, 101, 42, 255)
label bounds(70, 280, 88, 17) channel("label10020") text("EQ") fontColour(0, 0, 0, 255) colour(166, 101, 42, 255)
</Cabbage>
<CsoundSynthesizer>
<CsOptions>
-n -d -+rtmidi=NULL -M0 -m0d 
</CsOptions>
<CsInstruments>

/*
 -  Channel delay for L/R
 
 -  There are many trigger variables to update the GUI in sync mode
 
 -  Also the console will print some value for debugging proccess and learn


*/

; Initialize the global variables. 
ksmps = 32
nchnls = 2
0dbfs = 1


instr 1

/*  --- CHANNELS ---    */


/*Note quant*/
kBPM chnget "HOST_BPM" ;taking host BPM
kNoteOnL, kNoteOnLTrig cabbageGetValue "NotesL" 
kNoteOnR, kNoteOnRTrig cabbageGetValue "NotesR"
kNoteQuantL, kNoteQuantLTrig cabbageGetValue "NoteQuantL"
kNoteQuantR, kNoteQuantRTrig cabbageGetValue "NoteQuantR"

/*Wet-Dry effect knob*/
kDry cabbageGetValue "DryWet"

/*Delay parameters in each channel*/
kTimeL, kTimeLTrig cabbageGetValue "TimeLeft"
kTimeR, kTimeRTrig cabbageGetValue "TimeRight"
kFBL, kFBLTrig cabbageGetValue "FDB_Left"
kFBR, kFBRTrig cabbageGetValue "FDB_Right"

/*EQ by channels*/
kCutL, kCutLTrig cabbageGetValue "CutL"
kCutR, kCutRTrig cabbageGetValue "CutR"
kLowL, kLowLTrig cabbageGetValue "LowL"
kLowR, kLowRTrig cabbageGetValue "LowR"

/*Reverb*/
kRoom cabbageGetValue "Room"
kDamp cabbageGetValue "Damp"

/*Sync mode*/
kSync, kSyncTrig cabbageGetValue "Sync"

iMaxTime = 8
aIn inch 1
aIn inch 2

/*kBPM = 60 ---- SET A BPM TO TEST THE CONVERSION BPM TO DELAY TEMPO*/

/*  --- NOTE SECTION WITH BPM ---   */
if (kNoteOnL) == 1 then
printks "Note Mode R is on!\\n", 20
    
    if (kNoteQuantL) == 1 then
        
        kNoteL = 1
        printks "kNoteL set to 4\\n", 20
    
    endif
       
    if (kNoteQuantL) == 2 then
    
        kNoteL = 2
        printks "kNoteL set to 8\\n", 20
    
    endif  
    
    if (kNoteQuantL) == 3 then
    
        kNoteL = 4
        printks "kNoteL set to 16\\n", 20
                   
    endif

    kTimeL = (60/kBPM) * (1/kNoteL)
    
endif

if (kNoteOnR) == 1 then
printks "Note Mode R is on!\\n", 20
    
    if (kNoteQuantR) == 1 then
        
        kNoteR = 1
        printks "kNoteR set to 4\\n", 20
            
    elseif (kNoteQuantR) == 2 then
    
        kNoteR = 2
        printks "kNoteR set to 8\\n", 20
        
    elseif (kNoteQuantR) == 3 then
    
        kNoteR = 4
        printks "kNoteR set to 16\\n", 20
                        
    endif

    kTimeR = (60/kBPM) * (1/kNoteR)
    
endif


/*  --- DELAY DSP ---   */
aBufL    delayr  iMaxTime
aTapL    deltapi a(kTimeL)
         delayw  aIn + aTapL*kFBL

aBufR    delayr  iMaxTime
aTapR    deltapi a(kTimeR)
         delayw  aIn + aTapR*kFBR

printks "L ----Time = %f s, Feedback = %f, ---- \tR Time = %f s,  Feedback = %f \\n ", 1, kTimeL, kFBL, kTimeR, kFBR

/* --- GUI UPDATE WITH SYNC --- */
if kSync == 1 then
    if kSyncTrig == 1 then
        cabbageSetValue "TimeRight", kTimeL, kTimeLTrig
    endif
    
    cabbageSetValue "TimeRight", kTimeL, kTimeLTrig
    cabbageSetValue "TimeLeft", kTimeR, kTimeRTrig
endif

if kSync == 1 then
    if kSyncTrig == 1 then
        cabbageSetValue "FDB_Right", kFBL, kFBLTrig
    endif
    
    cabbageSetValue "FDB_Left", kFBR, kFBRTrig
    cabbageSetValue "FDB_Right", kFBL, kFBLTrig
endif


if kSync == 1 then
    if kSyncTrig == 1 then
        cabbageSetValue "NotesR", kNoteOnL, kNoteOnLTrig
    endif
    cabbageSetValue "NotesR", kNoteOnL, kNoteOnLTrig
    cabbageSetValue "NotesL", kNoteOnR, kNoteOnRTrig
endif

if kSync == 1 then
    if kSyncTrig == 1 then
        cabbageSetValue "NoteQuantR", kNoteQuantL, kNoteQuantLTrig
    endif
    cabbageSetValue "NoteQuantR", kNoteQuantL, kNoteQuantLTrig
    cabbageSetValue "NoteQuantL", kNoteQuantR, kNoteQuantRTrig
endif

if kSync == 1 then
    if kSyncTrig == 1 then
        cabbageSetValue "CutR", kNoteOnL, kNoteOnLTrig
    endif
    cabbageSetValue "CutR", kCutL, kCutLTrig
    cabbageSetValue "CutL", kCutR, kCutRTrig
endif

if kSync == 1 then
    if kSyncTrig == 1 then
        cabbageSetValue "LowR", kNoteOnL, kNoteOnLTrig
    endif
    cabbageSetValue "LowR", kLowL, kLowLTrig
    cabbageSetValue "LowL", kLowR, kLowRTrig
endif

/*  --- SYNC MODE DSP ---   */
if (kSync) == 1 then

printks "Sync is active! \n", 20

    kTimeR = kTimeL
    kFBR = kFBL
    kNoteOnR = kNoteOnL
    kNoteR = kNoteL
    kNoteQuantR = kNoteQuantL   
    kCutR = kCutR
    kLowR = kLowL 
    
endif


/* Reverb section */
aRevL, aRevR  freeverb aIn, aIn, kRoom, kDamp, sr, 0

/*Effect signal*/
aL = aTapL + aRevL
aR = aTapR + aRevR 

/*Filter delay section*/
aL butlp aL, kCutL
aR butlp aR, kCutR

aL buthp aL, kLowL
aR buthp aR, kLowR

/*Final output*/
aOutL = aIn + kDry*aL
aOutR = aIn + kDry*aR
    
    outs  aOutL, aOutR 
endin
</CsInstruments>
<CsScore>
;causes Csound to run for about 7000 years...
f0 z
;starts instrument 1 and runs it for a week
i1 0 [60*60*24*7] 
</CsScore>
</CsoundSynthesizer>
