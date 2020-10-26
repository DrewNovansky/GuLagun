//
//  ButtonTemp.swift
//  MacroChalTestUnit
//
//  Created by Andrew Novansky Ignatius on 16/10/20.
//
import SwiftUI
struct Emotion : Identifiable {
    var id: Int
    
    let emotionEmoji: String
    let emotionDetails: String
}
var JoyList = [
    Emotion(id: 0, emotionEmoji: "Euphoric", emotionDetails: "Feeling intense excitement and happiness."),
    Emotion(id: 1, emotionEmoji: "Excited", emotionDetails: "Very enthusiastic and eager."),
    Emotion(id: 2, emotionEmoji: "Optimistic", emotionDetails: "Hopeful and confident about the future."),
    Emotion(id: 3, emotionEmoji: "Proud", emotionDetails: "Feeling deep satisfaction as a result of own achievements."),
    Emotion(id: 4, emotionEmoji: "Cheerful", emotionDetails: "Noticeably happy and optimistic."),
    Emotion(id: 5, emotionEmoji: "Happy", emotionDetails: "Feeling or showing pleasure or contentment."),
    Emotion(id: 6, emotionEmoji: "Content", emotionDetails: "in a state of peaceful happiness, willing to accept something."),
    Emotion(id: 7, emotionEmoji: "Peaceful", emotionDetails: "Free from disturbance."),
]

var SurpriseList = [
    Emotion(id: 0, emotionEmoji: "Moved", emotionDetails: "Touched, emotionally affected."),
    Emotion(id: 1, emotionEmoji: "Overcome", emotionDetails: "Succeed in dealing with a problem or difficulty."),
    Emotion(id: 2, emotionEmoji: "Amazed", emotionDetails: "Greatly surprised; astounded; filled with wonder."),
    Emotion(id: 3, emotionEmoji: "Confused", emotionDetails: "Unable to think clearly; bewildered."),
    Emotion(id: 4, emotionEmoji: "Stunned", emotionDetails: "So shocked, unable to react; astonished."),
]

var SadList = [
    Emotion(id: 0, emotionEmoji: "Gloomy", emotionDetails: "Causing or feeling depression or despondency."),
    Emotion(id: 1, emotionEmoji: "Lonely", emotionDetails: "Sad because one has no friends or company."),
    Emotion(id: 2, emotionEmoji: "Shameful", emotionDetails: "Worthy of or causing shame or disgrace."),
    Emotion(id: 3, emotionEmoji: "Disappointed", emotionDetails: "Sad or displeased because someone or something has failed to fulfil one's hopes or expectations."),
    Emotion(id: 4, emotionEmoji: "Unhappy", emotionDetails: "Not happy, unfortunate."),
    Emotion(id: 5, emotionEmoji: "Hurt", emotionDetails: "Cause pain or injury."),
]

var AngerList = [
    Emotion(id: 0, emotionEmoji: "Enraged", emotionDetails: "Very angry, furious."),
    Emotion(id: 1, emotionEmoji: "Exasperated", emotionDetails: "Intensely irritated and frustrated."),
    Emotion(id: 2, emotionEmoji: "Irritable", emotionDetails: "Having or showing a tendency to be easily annoyed."),
    Emotion(id: 3, emotionEmoji: "Jealous", emotionDetails: "Feeling or showing an envious resentment of someone or their achievements, possessions, or perceived advantages."),
    Emotion(id: 4, emotionEmoji: "Disgusted", emotionDetails: "Feeling or expressing revulsion or strong disapproval."),
]

var FearList = [
    Emotion(id: 0, emotionEmoji: "Scared",
            emotionDetails: "Fearful; frightened."),
    Emotion(id: 1, emotionEmoji: "Terrified", emotionDetails: "Cause to feel extreme fear."),
    Emotion(id: 2, emotionEmoji: "Insecure", emotionDetails: "Incertain or anxious about oneself."),
    Emotion(id: 3, emotionEmoji: "Nervous", emotionDetails: "Easily agitated or alarmed."),
    Emotion(id: 4, emotionEmoji: "Horified", emotionDetails: "Filled with horror; extremely shocked."),
]

var LoveList = [
    Emotion(id: 0, emotionEmoji: "Grateful",
            emotionDetails: "Feeling or showing an appreciation for something done or received."),
    Emotion(id: 1, emotionEmoji: "Sentimental", emotionDetails: "Prompted by feelings of tenderness, sadness, or nostalgia."),
    Emotion(id: 2, emotionEmoji: "Affectionate", emotionDetails: "Readily feeling or showing fondness or tenderness."),
    Emotion(id: 3, emotionEmoji: "Romantic", emotionDetails: "Conducive to or characterized by the expression of love."),
    Emotion(id: 4, emotionEmoji: "Enchanted", emotionDetails: "Placed under a spell; bewitched, filled with delight; charmed."),
]

struct Emotion2Page: View {
    var emotionChoosen = "Surprise"
    @State var emotionDetails:String = ""
    @State var ButtonActive = false
    @State var ShowDetails = false
    
    
    
    var body: some View {
        VStack{
            TitleTemp(title: "What kind of \(emotionChoosen) \ndid you feel?")
            CircleImage(imagename: emotionChoosen)
                .frame(width: 68, height: 68)
                .padding(30)
            ScrollView{
                VStack(spacing: 24)
                {
                    if emotionChoosen == "Joy"{
                        ForEach(0 ..< 8) { item in
                            buttonEmotion(selectedEmotion: $emotionDetails, emotion: JoyList[item].emotionEmoji, emotionDetails: JoyList[item].emotionDetails)
                        }
                    }
                    
                    if emotionChoosen == "Surprise"{
                        ForEach(0 ..< 5) { item in
                            buttonEmotion(selectedEmotion: $emotionDetails, emotion: SurpriseList[item].emotionEmoji, emotionDetails: SurpriseList[item].emotionDetails)
                        }
                    }
                    
                    if emotionChoosen == "Sad"{
                        
                        ForEach(0 ..< 6) { item in
                            buttonEmotion(selectedEmotion: $emotionDetails, emotion: SadList[item].emotionEmoji, emotionDetails: SadList[item].emotionDetails)
                        }
                    }
                    
                    if emotionChoosen == "Anger"{
                        
                        ForEach(0 ..< 5) { item in
                            buttonEmotion(selectedEmotion: $emotionDetails,emotion: AngerList[item].emotionEmoji, emotionDetails: AngerList[item].emotionDetails)
                        }
                    }
                    
                    if emotionChoosen == "Fear"{
                        ForEach(0 ..< 5) { item in
                            buttonEmotion(selectedEmotion: $emotionDetails,emotion: FearList[item].emotionEmoji, emotionDetails: FearList[item].emotionDetails)
                        }
                    }
                    
                    if emotionChoosen == "Love"{
                        ForEach(0 ..< 5) { item in
                            buttonEmotion(selectedEmotion: $emotionDetails,emotion: LoveList[item].emotionEmoji, emotionDetails: LoveList[item].emotionDetails)
                        }
                    }
                }
            }
            NavigationLink(
                destination: WritingPage(emotionChoosen: emotionChoosen, emotionDetails: emotionDetails,story: ""),
                label: {
                    buttonStyleTemplate(text: "Next")
                })
        }
    }
}


struct ButtonTemp_Previews: PreviewProvider {
    static var previews: some View {
        Emotion2Page()
    }
}
