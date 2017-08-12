//
//  SpeechDetector.swift
//  SayMath
//
//  Created by Eric Newman on 8/9/17.
//  Copyright © 2017 Eric Newman. All rights reserved.
//

import Foundation
import Speech

class SpeechDetector: NSObject, SFSpeechRecognizerDelegate {
    
    let speechRecognizer: SFSpeechRecognizer? = SFSpeechRecognizer()
    let audioEngine = AVAudioEngine()
    var recognitionRequest : SFSpeechAudioBufferRecognitionRequest?
    var recognitionTask: SFSpeechRecognitionTask?
    var recording = false
    var authorized = false
    var error : String?
    var initialized = false
    
    func stopRecording() {
        audioEngine.stop()
        audioEngine.inputNode.removeTap(onBus: 0)
        recognitionRequest?.endAudio()
        recognitionRequest = nil
        recognitionTask?.cancel()
        recognitionTask = nil
        recording = false
    }
    
    func recognizeSpeech(with resultHandler: @escaping (String) -> (), errorWith errorHandler: @escaping (String) -> ()) throws  {
        if (!authorized) {
            try self.requestSpeechAuthorization()
        }
        
        // Cancel the previous task if it's running.
        if let recognitionTask = recognitionTask {
            //recognitionTask.cancel()
            //self.recognitionTask = nil
        }
        
        let audioSession = AVAudioSession.sharedInstance()
        try audioSession.setCategory(AVAudioSessionCategoryRecord)
        try audioSession.setMode(AVAudioSessionModeMeasurement)
        try audioSession.setActive(true, with: .notifyOthersOnDeactivation)
        
        recognitionRequest = SFSpeechAudioBufferRecognitionRequest()
        
        let inputNode = audioEngine.inputNode
        
        // Configure request so that results are returned before audio recording is finished
        recognitionRequest!.shouldReportPartialResults = true
        
        // A recognition task represents a speech recognition session.
        // We keep a reference to the task so that it can be cancelled.
        var count = 0
        var lastResponse : String = ""
        recognitionTask = speechRecognizer?.recognitionTask(with: recognitionRequest!) { result, error in
            print("1:recognize")
            
            
            print("5:recognize")
            count = count + 1
            // Stop audio if no audio for a bit
            //self.speechIdleTimer?.invalidate()
            //self.speechIdleTimer = nil
            print("10:recognize")
            
            //self.speechIdleTimer = Timer.scheduledTimer(withTimeInterval: SayMathConstants.speechIdleInterval, repeats: false) { [weak self] timer in
            //    print("10.1:recognize")
            //    self?.stopRecording()
            //    resultHandler(String(count) + " --- " + lastResponse)
            //}
            
            print("20:recognize")
            if let result = result {
                print("21:recognize:" + result.bestTranscription.formattedString)
                lastResponse = self.getLastWord(text: result.bestTranscription.formattedString) ?? ""
                print("30:recognize")
                resultHandler(lastResponse)
            }
            
            print("33:recognize")
            if error != nil {
                print("35:recognize " + (error?.localizedDescription)!)
                errorHandler(error!.localizedDescription)
            }
            print("40:recognize")
        }
        
        let recordingFormat = inputNode.outputFormat(forBus: 0)
        inputNode.installTap(onBus: 0, bufferSize: 1024, format: recordingFormat) { buffer, _ in
            self.recognitionRequest?.append(buffer)
        }
        
        recording = true
        audioEngine.prepare()
        try audioEngine.start()
    }
    
    
    
    
    //MARK: - Check Authorization Status
    
    func requestSpeechAuthorization() throws {
        SFSpeechRecognizer.requestAuthorization { authStatus in
            OperationQueue.main.addOperation {
                switch authStatus {
                case .authorized:
                    self.authorized = true
                case .denied:
                    self.error = "User denied access to speech recognition"
                case .restricted:
                    self.error =  "Speech recognition restricted on this device"
                case .notDetermined:
                    self.error = "Speech recognition not yet authorized"
                }
            }
        }
    }
    
    func getLastWord(text: String) -> String?
    {
        let split = text.components(separatedBy: " ")
        return split.last
    }
    
}



