//
//  SoundsExt.swift
//  ABC Freeze Tag
//
//  Created by Lawrence Herman on 8/1/17.
//  Copyright © 2017 Lawrence Herman. All rights reserved.
//

import SceneKit


extension MainScene {
    
    func loadSounds() {
        rdySet = SCNAudioSource(named: "ABC_READY_SET_1.mp3")
        rdySet.isPositional = false
        rdySet.load()
        
        go = SCNAudioSource(named: "ABC_GO_1.mp3")
        go.isPositional = false
        go.load()
        
        startScream1 = SCNAudioSource(named: "ABC_START_SCREAM_1.mp3")
        startScream1.isPositional = false
        startScream1.load()
        
        kidPlayGround1 = SCNAudioSource(named: "KIDS_PLAYGROUND_1.mp3")
        kidPlayGround1.volume = 0.8
        kidPlayGround1.isPositional = false
        kidPlayGround1.loops = true
        kidPlayGround1.shouldStream = true
        
        freezeTag = SCNAudioSource(named: "ABC_FREEZE_TAG_GROUP_1.mp3")
        freezeTag.isPositional = false
        freezeTag.load()
        
        letterTapSound = SCNAudioSource(named: "ABC_LETTER_TAP_FX_1.mp3")
        letterTapSound.volume = 0.8
        letterTapSound.load()
        
        winMusic = SCNAudioSource(named: "ABC_WIN_MX_1.mp3")
        winMusic.load()
        
        greatjob = SCNAudioSource(named: "ABC_GREAT_JOB_SKY_1.mp3")
        greatjob.load()
        
        youCaughtEverybody = SCNAudioSource(named: "ABC_YOU_CAUGHT_EVERYBODY_GRACE_1.mp3")
        youCaughtEverybody.load()
        
        yae1 = SCNAudioSource(named: "ABC_YEAAA_GRACE_1.mp3")
        yae1.load()
        
        yae2 = SCNAudioSource(named: "ABC_YEAAAA_SKY_1.mp3")
        yae2.load()
        
        toSlow = SCNAudioSource(named: "ABC_TO_SLOW_SKY_1.mp3")
        toSlow.volume = 0.5
        toSlow.load()
        
        giggle1 = SCNAudioSource(named: "KID_GIRL_GIGGLE_5.mp3")
        giggle1.load()
        
        giggle2 = SCNAudioSource(named: "KID_GIRL_GIGGLE_6.mp3")
        giggle2.load()
        
        overHere = SCNAudioSource(named: "ABC_OVER_HERE_GRACE_1.mp3")
        overHere.volume = 0.5
        overHere.load()
        
        cantCatchMe = SCNAudioSource(named: "ABC_YOU_CANT_CATCH_ME_GRACE_1.mp3")
        cantCatchMe.volume = 0.5
        cantCatchMe.load()
        
        mx70BPM = SCNAudioSource(named: "ABC_FT_1_70.mp3")
        mx70BPM.isPositional = false
        mx70BPM.volume = 0.3
        mx70BPM.loops = true
        mx70BPM.shouldStream = true
        mx70BPMPlayer = SCNAudioPlayer(source: mx70BPM)
        
        mx100BPM = SCNAudioSource(named: "ABC_FT_2_100.mp3")
        mx100BPM.isPositional = false
        mx100BPM.volume = 0.3
        mx100BPM.loops = true
        mx100BPM.shouldStream = true
        mx100BPMPlayer = SCNAudioPlayer(source: mx100BPM)
        
        mx130BPM = SCNAudioSource(named: "ABC_FT_3_130.mp3")
        mx130BPM.isPositional = false
        mx130BPM.volume = 0.3
        mx130BPM.loops = true
        mx130BPM.shouldStream = true
        mx130BPMPlayer = SCNAudioPlayer(source: mx130BPM)
        
        mx160BPM = SCNAudioSource(named: "ABC_FT_4_160.mp3")
        mx160BPM.volume = 0.3
        mx160BPM.isPositional = false
        mx160BPM.loops = true
        mx160BPM.shouldStream = true
        mx160BPMPlayer = SCNAudioPlayer(source: mx160BPM)
        
        aSound = SCNAudioSource(named: "ABC_GROUP_LETTER_A.mp3")
        aSound.load()
        
        bSound = SCNAudioSource(named: "ABC_GROUP_LETTER_B.mp3")
        bSound.load()
        
        cSound = SCNAudioSource(named: "ABC_GROUP_LETTER_C.mp3")
        cSound.load()
        
        dSound = SCNAudioSource(named: "ABC_GROUP_LETTER_D.mp3")
        dSound.load()
        
        eSound = SCNAudioSource(named: "ABC_GROUP_LETTER_E.mp3")
        eSound.load()
        
        fSound = SCNAudioSource(named: "ABC_GROUP_LETTER_F.mp3")
        fSound.load()
        
        gSound = SCNAudioSource(named: "ABC_GROUP_LETTER_G.mp3")
        gSound.load()
        
        hSound = SCNAudioSource(named: "ABC_GROUP_LETTER_H.mp3")
        hSound.load()
        
        iSound = SCNAudioSource(named: "ABC_GROUP_LETTER_I.mp3")
        iSound.load()
        
        jSound = SCNAudioSource(named: "ABC_GROUP_LETTER_J.mp3")
        jSound.load()
        
        kSound = SCNAudioSource(named: "ABC_GROUP_LETTER_K.mp3")
        kSound.load()
        
        lSound = SCNAudioSource(named: "ABC_GROUP_LETTER_L.mp3")
        lSound.load()
        
        mSound = SCNAudioSource(named: "ABC_GROUP_LETTER_M.mp3")
        mSound.load()
        
        nSound = SCNAudioSource(named: "ABC_GROUP_LETTER_N.mp3")
        nSound.load()
        
        oSound = SCNAudioSource(named: "ABC_GROUP_LETTER_O.mp3")
        oSound.load()
        
        pSound = SCNAudioSource(named: "ABC_GROUP_LETTER_P.mp3")
        pSound.load()
        
        qSound = SCNAudioSource(named: "ABC_GROUP_LETTER_Q.mp3")
        qSound.load()
        
        rSound = SCNAudioSource(named: "ABC_GROUP_LETTER_R.mp3")
        rSound.load()
        
        sSound = SCNAudioSource(named: "ABC_GROUP_LETTER_S.mp3")
        sSound.load()
        
        tSound = SCNAudioSource(named: "ABC_GROUP_LETTER_T.mp3")
        tSound.load()
        
        uSound = SCNAudioSource(named: "ABC_GROUP_LETTER_U.mp3")
        uSound.load()
        
        vSound = SCNAudioSource(named: "ABC_GROUP_LETTER_V.mp3")
        vSound.load()
        
        wSound = SCNAudioSource(named: "ABC_GROUP_LETTER_W.mp3")
        wSound.load()
        
        xSound = SCNAudioSource(named: "ABC_GROUP_LETTER_X.mp3")
        xSound.load()
        
        ySound = SCNAudioSource(named: "ABC_GROUP_LETTER_Y.mp3")
        ySound.load()
        
        zSound = SCNAudioSource(named: "ABC_GROUP_LETTER_Z.mp3")
        zSound.load()
    }
    
    
}
