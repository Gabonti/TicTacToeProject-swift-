

import SwiftUI

struct LoginView: View {
    @State private var email = ""
    @State private var password = ""
    @State private var showAlert = false
    @EnvironmentObject var viewModel: AuthViewModel
    @AppStorage("isDarkMode") var isDarkMode = false
    
    var body: some View {
        NavigationStack {
            VStack {
                Text("LOGIN")
                    .font(.system(size: 40, weight: .bold))
                    .padding(.top, 100)
                
                VStack(spacing: 24) {
                    InputView(text: $email,
                              title: "Email Address",
                              placeholder: "name@example.com")
                    .autocapitalization(.none)
                    
                    InputView(text: $password,
                              title: "Password",
                              placeholder: "Enter your paasswrod",
                              isSecureField: true)
                }
                .padding(.horizontal)
                .padding(.top, 50)
                
                Button {
                    Task {
                        do {
                            try await viewModel.signIn(withEmail: email, password: password)
                        } catch {
                            showAlert = true
                        }
                    }
                } label: {
                    HStack {
                        Text("SIGN IN")
                            .fontWeight(.semibold)
                            
                        Image(systemName: "arrow.right")
                    }
                    .foregroundColor(isDarkMode ? .black : .white)
                    .padding()
                    .frame(height: 48)
                }
                .background(Color("AdaptiveColor"))
                .disabled(!formIsValid)
                .opacity(formIsValid ? 1.0 : 0.5)
                .cornerRadius(15)
                .padding(.top, 25)
                
                Spacer()
                
                NavigationLink {
                    RegistrationView()
                        .navigationBarBackButtonHidden(true)
                } label: {
                    HStack(spacing: 5) {
                        Text("Don't have an account?")
                        Text("Sign up")
                            .fontWeight(.bold)
                    }.foregroundColor(Color("AdaptiveColor"))
                }
            }.alert(isPresented: $showAlert) {
                Alert(title: Text("Error"), message: Text("Invalid email or password"), dismissButton: .default(Text("OK")))
            }
        }
    }
}

extension LoginView: AuthenticationFormProtocol {
    var formIsValid: Bool {
        return !email.isEmpty
        && email.contains("@")
        && !password.isEmpty
        && password.count > 5
    }
}

#Preview {
    LoginView()
}
