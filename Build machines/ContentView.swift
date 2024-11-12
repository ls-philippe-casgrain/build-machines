//
//  ContentView.swift
//  Build machines
//
//  Created by Philippe Casgrain on 2024-11-11.
//

import SwiftUI
import DeckUI

struct ContentView: View {

    var body: some View {
        Presenter(deck: self.deck, showCamera: true)
    }
}

extension ContentView {
    var deck: Deck {
        Deck(title: "Build machines—Nov 2024 Platform meeting") {
            Slide(alignment: .center) {
                RawView {
                    Text("Build machines\nState of the Union")
                        .font(.system(size: 180, weight: .bold, design: .monospaced))
                        .foregroundColor(.white)
                        .padding(80)
                        .border(.white.opacity(0.5), width: 20)
                        .multilineTextAlignment(.center)
                }
            }
            Slide(alignment: .center) {
                Title("Quick refresher")

                Columns {
                    Column {
                        Bullets(style: .bullet) {
                            Words("Build machines are managed with Ansible")
                            Words("Machines can't be shared across orgs")
                            Words("Check out hosts.yml for more")
                            Words("👉")
                        }
                    }

                    Column {
                        Bullets {
                            Words("hosts.yml")
                        }
                        Code(.none) {
"""
build_machines:
children:
    hospitality_build_machines:
    retail_build_machines:
hospitality_build_machines:
children:
    lsk_build_machines:
    lsl_build_machines:
    lsu_build_machines:
[...]
retail_build_machines:
hosts:
    # build1.atlightspeed.net:
    build2.atlightspeed.net:
    build3.atlightspeed.net:
[...]
"""
                        }
                    }
                }
            }

            Slide {
                Title("Installing Xcode versions")
                Bullets {
                    Words("Update xcode_wanted_versions in your build machine's vars.yml")
                    Words("Run build-machine-config.yml")
                    Words("Build machines of the same class are deemed to all have the same capabilities")
                    Words("Don't mix-and-match different machines (OS versions, processor architecture")
                }
            }

            Slide {
                Title("Current state of the machines")
                Bullets {

                    Words("LSK are all M1/M2 minis running Sonoma")
                    Words("LSL is one M1 mini running Sonoma")
                    Words("LSU is two M1 minis running Sonoma")
                    Words("LSR is two Intel minis running Sonoma, and one disabled Intel mini running Sequoia")
                    Words("One LSR Intel mini running Sequoia, disabled as a build agent")
                    Words("Reminder")
                    Words("Ventura can run Xcode 14.x and 15.1")
                    Words("Sonoma can run Xcode 15.1, 15.4, 16.0 and 16.1")
                    Words("Sequoia can only run Xcode 16.0 and 16.1")
                }
            }

            Slide {
                Title("The plan")
                Bullets {

                    Words("LSR Minis are active, but EOL")
                    Words("Build1 (Sequoia) is available as a screen-sharing, test machine")
                    Words("Reminder that Build1 is an Intel machine")
                    Words("New M4 minis are getting ordered for LSR")
                    Words("We may re-commission Build1 if we update LSR to Xcode 16")
                    Words("When that happens we will de-commission the two Minis build2 and build3")
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
