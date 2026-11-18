import SwiftUI

struct LoaderView: View {
    @State private var showShooter = false

    var body: some View {
        ZStack {
            LinearGradient(
                gradient: Gradient(colors: [
                    Color(red: 0.05, green: 0.06, blue: 0.12),
                    Color(red: 0.10, green: 0.08, blue: 0.18),
                    Color(red: 0.14, green: 0.06, blue: 0.10)
                ]),
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            )
            .ignoresSafeArea()

            VStack(spacing: 26) {
                Spacer()

                ZStack {
                    Circle()
                        .fill(Color.orange.opacity(0.18))
                        .frame(width: 120, height: 120)
                    Image(systemName: "scope")
                        .font(.system(size: 54, weight: .bold))
                        .foregroundColor(.orange)
                }

                VStack(spacing: 8) {
                    Text("Шутер")
                        .font(.system(size: 40, weight: .bold))
                        .foregroundColor(.white)
                    Text("Отдельный загрузчик с чит-меню")
                        .font(.subheadline)
                        .foregroundColor(.white.opacity(0.7))
                }

                Button {
                    SFX.click()
                    Haptics.medium()
                    showShooter = true
                } label: {
                    HStack(spacing: 10) {
                        Image(systemName: "play.fill")
                        Text("LOAD")
                            .font(.title2.bold())
                    }
                    .foregroundColor(.white)
                    .frame(maxWidth: 240)
                    .padding(.vertical, 16)
                    .background(
                        LinearGradient(
                            gradient: Gradient(colors: [Color.orange, Color.red]),
                            startPoint: .leading,
                            endPoint: .trailing
                        ),
                        in: RoundedRectangle(cornerRadius: 18, style: .continuous)
                    )
                    .shadow(color: .orange.opacity(0.4), radius: 12, y: 6)
                }
                .buttonStyle(.plain)

                Spacer()

                Text("Нажмите LOAD, чтобы открыть шутер с чит-меню")
                    .font(.footnote)
                    .foregroundColor(.white.opacity(0.55))
                    .multilineTextAlignment(.center)
                    .padding(.horizontal, 24)
                    .padding(.bottom, 24)
            }
            .padding()
        }
        .fullScreenCover(isPresented: $showShooter) {
            ZStack(alignment: .topLeading) {
                ShooterView(cheatsUnlocked: true, autoShowCheats: true)
                    .ignoresSafeArea()
                Button {
                    SFX.tap()
                    showShooter = false
                } label: {
                    HStack(spacing: 6) {
                        Image(systemName: "chevron.left")
                        Text("Назад")
                    }
                    .font(.subheadline.bold())
                    .foregroundColor(.white)
                    .padding(.horizontal, 12)
                    .padding(.vertical, 8)
                    .background(.ultraThinMaterial, in: Capsule())
                }
                .buttonStyle(.plain)
                .padding(.leading, 12)
                .padding(.top, 10)
            }
        }
    }
}
