import SwiftUI

struct ContentView: View {
    //State : 값이 변경되면 UI가 자동으로 업데이트 되도록 함.
    @State private var username = ""
    @State private var password = ""
    @State private var isLoggedIn = false
    
    var body: some View {
        //SwiftUI에서 화면 간의 네비게이션을 관리하는 컨테이너
        NavigationView {
            VStack {
                // 타이틀
                // 화면에 텍스트를 표시하는 SwiftUI 뷰
                Text("로그인")
                    .font(.largeTitle) // 텍스트의 크기를 설정하는 Modifier
                    .padding(.top, 50) // 화면 상단에 여백을 추가하는 Modifier
                
                // ID 입력 필드
                // 사용자가 텍스트를 입력할 수 있는 UI 요소
                // $ 기호는 데이터 바인딩을 의미
                TextField("인트라넷 ID", text: $username)
                    .padding()
                    .background(RoundedRectangle(cornerRadius: 10).strokeBorder(Color.gray, lineWidth: 1)) // 텍스트 필드 주변에 둥근 테두리를 추가
                    .padding(.bottom, 20)
                
                // 비밀번호 입력 필드
                // 비밀번호와 같은 민감한 정보를 입력할 때 사용
                SecureField("인트라넷 PW", text: $password)
                    .padding()
                    .background(RoundedRectangle(cornerRadius: 10).strokeBorder(Color.gray, lineWidth: 1))
                    .padding(.bottom, 40)
                
                // 로그인 버튼
                // 사용자가 버튼을 클릭할 수 있도록 하는 UI 요소
                Button(action: {
                    // 로그인 로직
                    // 로그인 정보가 "admin"과 "password"일 때만 로그인 성공으로 처리
                    if username == "admin" && password == "password" {
                        isLoggedIn = true
                    }
                }) {
                    Text("로그인")
                        .font(.title2) // 버튼의 텍스트 크기를 설정
                        .foregroundColor(.white) // 텍스트 색을 흰색으로 설정
                        .padding() // 버튼 주위에 여백을 추가
                        .background(Color.blue) // 버튼의 배경색을 파란색으로 설정
                        .cornerRadius(10) // 버튼의 모서리를 둥글게 만듭니다.
                }
                
                // 로그인 성공 메시지
                if isLoggedIn {
                    Text("로그인 성공!")
                        .foregroundColor(.green) // 메시지 텍스트의 색을 초록색으로 설정
                        .padding(.top, 20) // 메시지 위에 여백을 추가
                }
            }
            .padding()
            .navigationBarHidden(true) // 네비게이션 바(Navigation Bar)를 숨기는 Modifier입니다
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
