//
//  DisclaimerView.swift
//  ForRest
//
//  Created by Steven Rafaelie on 02/11/20.
//

import SwiftUI

struct DisclaimerView: View {
    var body: some View {
        ScrollView{
            VStack(alignment: .leading){
                Group{
                    Text("Disclaimer\nLast updated: November 02, 2020\n\nInterpretation and Definitions\n\nInterpretation\n\nThe words of which the initial letter is capitalized have meanings defined under the following conditions.\n\nThe following definitions shall have the same meaning regardless of whether they appear in singular or in plural.\n\nDefinitions").fontWeight(.bold)
                    
                    Text("\nFor the purposes of this Disclaimer\n- Company (referred to as either & the Company We &Us or Our in this Disclaimer) refers to Boo ForRest.\nService refers to the Application.\n - You means the individual accessing the Service, or the company, or other legal entity on behalf of which such individual is accessing or using the Service, as applicable.\n- Application means the software program provided by the Company downloaded by You on any electronic device named Boo ForRest\n")
                    
                    Text("Disclaimer").fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                    
                    Text("\nThe information contained on the Service is for general information purposes only. The Company assumes no responsibility for errors or omissions in the contents of the Service. In no event shall the Company be liable for any special, direct, indirect, consequential, or incidental damages or any damages whatsoever, whether in an action of contract, negligence or other tort, arising out of or in connection with the use of the Service or the contents of the Service. The Company reserves the right to make additions, deletions, or modifications to the contents on the Service at any time without prior notice. This Disclaimer has been created with the help of the Disclaimer Generator.\nThe Company does not warrant that the Service is free of viruses or other harmful components.\n")
                    
                    Text("External Links Disclaimer").fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                    
                    Text("\nThe Service may contain links to external websites that are not provided or maintained by or in any way affiliated with the Company.\nPlease note that the Company does not guarantee the accuracy, relevance, timeliness, or completeness of any information on these external websites.\n")
                    
                    Text("Errors and Omissions Disclaimer").fontWeight(.bold)
                    
                    Text("\nThe information given by the Service is for general guidance on matters of interest only. Even if the Company takes every precaution to insure that the content of the Service is both current and accurate, errors can occur. Plus, given the changing nature of laws, rules and regulations, there may be delays, omissions or inaccuracies in the information contained on the Service.\nThe Company is not responsible for any errors or omissions, or for the results obtained from the use of this information.\n")
                    
                    Text("Fair Use Disclaimer").fontWeight(.bold)
                    
                    Text("\nThe Company may use copyrighted material which has not always been specifically authorized by the copyright owner. The Company is making such material available for criticism, comment, news reporting, teaching, scholarship, or research.\nThe Company believes this constitutes a fair use of any such copyrighted material as provided for in section 107 of the United States Copyright law. If You wish to use copyrighted material from the Service for your own purposes that go beyond fair use, You must obtain permission from the copyright owner.\n")
                }
                
                Text("No Responsibility Disclaimer").fontWeight(.bold)
                
                Text("\nThe information on the Service is provided with the understanding that the Company is not herein engaged in rendering legal, accounting, tax, or other professional advice and services. As such, it should not be used as a substitute for consultation with professional accounting, tax, legal or other competent advisers\nIn no event shall the Company or its suppliers be liable for any special, incidental, indirect, or consequential damages whatsoever arising out of or in connection with your access or use or inability to access or use the Service.\n")
                
                Text("Use at Your Own Risk Disclaimer\n").fontWeight(.bold)
                
                Text("All information in the Service is provided with no guarantee of completeness, accuracy, timeliness or of the results obtained from the use of this information, and without warranty of any kind, express or implied, including, but not limited to warranties of performance, merchantability and fitness for a particular purpose.\nThe Company will not be liable to You or anyone else for any decision made or action taken in reliance on the information given by the Service or for any consequential, special or similar damages, even if advised of the possibility of such damages.\n")
                
                Text("Contact Us").fontWeight(.bold)
                
                Text("\nIf you have any questions about this \nDisclaimer, You can contact Us\nBy email: boo.forrest.app@gmail.com")
                
                
            }.font(.body).foregroundColor(.accentColor).padding()
        }.navigationBarTitleDisplayMode(.inline)
    }
}

struct DisclaimerView_Previews: PreviewProvider {
    static var previews: some View {
        DisclaimerView()
    }
}
