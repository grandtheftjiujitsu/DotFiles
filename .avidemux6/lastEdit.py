#PY  <- Needed to identify #
#--automatically built--

adm = Avidemux()
adm.loadVideo("/tmp/InShot_20190930_111509074.mp4")
adm.clearSegments()
adm.addSegment(0, 0, 853472000)
adm.markerA = 42223227
adm.markerB = 42223227
adm.setPostProc(3, 3, 0)
adm.videoCodec("Copy")
adm.audioClearTracks()
adm.setSourceTrackLanguage(0,"und")
adm.audioAddExternal("/tmp/2019-10-04 12.02.04.mp3")
adm.setSourceTrackLanguage(1,"und")
adm.audioAddTrack(1)
adm.audioCodec(0, "copy");
adm.audioSetDrc(0, 0)
adm.audioSetShift(0, 0, 0)
adm.setContainer("MKV", "forceDisplayWidth=False", "displayWidth=1280", "displayAspectRatio=0")
