//
//  DACSDKMAAdImageGenerator.swift
//  DACSDKMA
//
//  Copyright (c) 2015 D.A.Consortium Inc. All rights reserved.
//

import UIKit
import DACSDKMA


// --------------------------------------------------
// MARK: - class
// --------------------------------------------------
/// 画像クラス生成クラス
@objc
public class DACSDKMAAdImageGenerator: NSObject {

    // MARK: playButtonIconImage
    /// 再生ボタン・アイコン画像
    public static let playButtonIconImage: UIImage? = DACSDKMAAdImageGenerator.generateImage(
        "iVBORw0KGgoAAAANSUhEUgAAACAAAAAgCAYAAABzenr0AAAAAXNSR0ICQMB9xQAAAAlwSFlzAAAXEgAAFxIBZ5/SUgAAABl0RVh0U29mdHdhcmUATWljcm9zb2Z0IE9mZmljZX/tNXEAAAGMSURBVFjDY2hsbGQYSMww6oBB44D///8zMjAwMA+YA2bOnMmzbt26U1u2bOmurq5Wo7sDBAUFeU6ePPkJGBL/L168+APokJUTJ050prcDXvxHAg8fPvy/d+/ek3Pnzk02Njbmo7sDYODTp0//jx8//njFihXt1I4eohwAA//+/ft/4cIFqkYPSQ7AEj0nKI0esh2AHD3Hjh17vHLlyjZyoodiB2CLnp6eHme6O4Dc6KGJA0iJHpo6ABlcu3bt165du7YsWrTIa0Ac8PHjx//79u17Mn/+/Cy6OuDKlSv/t2/fvnX69Ol+wMqOiS5R8P379/+nT59+s2bNmikNDQ2GdEuEL168+H/w4MHLwHgujI2NFadbNgQF8zYgmDp1qj+pbQqyHQALZmAbgmAwU9UBsGBesmRJAbHBTBUHgIJ5x44d24CpOYCaTTe8DoAF8/r16ydTEsxEO+DMmTNvYMF84MCBK9DULEaXJll5eTnv5s2bnwPjdxe1g5koB6xatYq5o6NDfrRnNOoAemMAiMOeaUdejDsAAAAASUVORK5CYII="
    )
    
    // MARK: pauseButtonIconImage
    /// 一時停止ボタン・アイコン画像
    public static let pauseButtonIconImage: UIImage? = DACSDKMAAdImageGenerator.generateImage(
        "iVBORw0KGgoAAAANSUhEUgAAACAAAAAgCAYAAABzenr0AAAAAXNSR0ICQMB9xQAAAAlwSFlzAAAXEgAAFxIBZ5/SUgAAABl0RVh0U29mdHdhcmUATWljcm9zb2Z0IE9mZmljZX/tNXEAAAEfSURBVFjD7ZY9a4NgEMdNoHuHlBaELgG/lV/B1VHdnAISEmq6OfmCL4N+BHVzMJhIoB36JTI4mDvoA1WwoFCakDs4kON3x++Z/HOapnH/2RwJkMBVCxiG8SzLMi+KYqcVReFN03xkHH7jrM9JksTruv7Stu1stIDruvM4jvdlWZ6Louh0VVVn27bXjPU8b4WzPoe7cOMIIg+jBaDmWZZ9tgMVBME7Y33f3w5xeZ5/wa1pAmmann4RePshsB7i8BEkQAIkQAIkQAK3KwDLH0OHoyjaMTYMw82f/I6TJDlANRAsOl3XdQMhZMNYx3EMnPU5CCkN3DgJgjBe4DuSvULUWkKi6bSqqkuIYU+MsyxrgbM+h7t4Y1Iko1RMAncjcAFXMkia2gIbYwAAAABJRU5ErkJggg=="
    )
    
    // MARK: replayButtonLabelImage
    /// リプレイボタン・ラベル画像
    public static let replayButtonLabelImage: UIImage? = DACSDKMAAdImageGenerator.generateImage(
        "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"
    )
    
    // MARK: volumeOnButtonIconImage
    /// 音量ONボタン・アイコン画像
    public static let volumeOnButtonIconImage: UIImage? = DACSDKMAAdImageGenerator.generateImage(
        "iVBORw0KGgoAAAANSUhEUgAAACoAAAApCAYAAABDV7v1AAAAAXNSR0ICQMB9xQAAAAlwSFlzAAAXEgAAFxIBZ5/SUgAAABl0RVh0U29mdHdhcmUATWljcm9zb2Z0IE9mZmljZX/tNXEAAANsSURBVFjD7Zjda1JxGMdHN42ioBG9XBTE6qYgYgV1UZdBUZddNwj6AyJ6gepCiK666qKi4dycex/bHHvDoRI5dHM4t7XNvTj0zJmK4lvM6ZxP3+cwxWTVBid1cIQHz/mdn57P+f6+v+d5tEKhUFTsh9gXkDKoDCqDyqASBxEdQJxGHC530AvBYDDudDo98Xhci/MH5Qp60eFwkEajoZGREVpeXqZ0Oq3D+NmyAAXIwa2trQ94r7Xb7QmlUklNTU1UX19PJpOJoK6b1S4pKADOAcQci8VwSI8FQUiNjo5Sc3OzCKtSqUiv1zOsA9ePlAQUN74dDod9Op2OJicnGfQW4ibUfevxeAJdXV05ZaempiiVSn0pOiiAnkC9TG9vL9XV1dHc3ByDXkkkEu/W1ta+AsofCoVEZdmzarWaXC4Xz7lUFNBtPypXVlZyy9vQ0ECzs7MMUeP3+81DQ0PEkclkYvBsmq83NjbS2NgYb66P/x0UIOeTyaQZNxe9x6AtLS2FoHqtVis+ABQXNjc37X19faKqnZ2dBLU9mFcpCSi+6Oj6+rrR6/Xa8wNLFzEYDKLnGDAbhaAMxmNWqzUO9T+bzWbxnIPTF17XpAI9xTmwp6eH2IPZaGtrE72WD/knUFbcYrHw2Ovp6ekgf47nzczM8FitVKAnlpaWYrxcvLzZKAT8l6Lj4+M89hwP/Z0fkn06MTHBYy8lBf0b3B5An8EyVvYng8IOBDsoyhH0BWp/oaKvpAI9ubi4mCwEZZ+xHXYLuu3RN/BlzqPwK489kgq0KhqNOqFqKD/m5+epu7tbvOFuQJE3f2KZP+2w669Llkc5RSGOFcQ9tHEBo9H4W4raCZTzqNvtFgBq6+/vF1eio6ODVldXf2DeoWJUpmokfUt+0t+pMg0MDHBlimKp0zyPl56VRWlVFq3Wc2WBUiouo6wUt3Xbtb5mY2PjPdd61HxfJBIRFec5vJGgMM+5Woru6SmqJLW3t4vdEV43uOngnQ5lvVwwsq0e73ashLqU/eidQCAALj+D3sWxYLPZclWMbTE8PExQl+WsKnWHXw0/mvB+H7vanU1jvOF44wHSh2uXy+k303H4Ntja2kqDg4O0sLBA8Oy3vf4MKQZoJTp+AbU9DBUNOH9Ytn9AAO4MKyv/UyKDyqAyqAxa2vgFl/e0IQLfnMEAAAAASUVORK5CYII="
    )
    
    // MARK: volumeOffButtonIconImage
    /// 音量OFFボタン・アイコン画像
    public static let volumeOffButtonIconImage: UIImage? = DACSDKMAAdImageGenerator.generateImage(
        "iVBORw0KGgoAAAANSUhEUgAAACkAAAApCAYAAACoYAD2AAAAAXNSR0ICQMB9xQAAAAlwSFlzAAAXEgAAFxIBZ5/SUgAAABl0RVh0U29mdHdhcmUATWljcm9zb2Z0IE9mZmljZX/tNXEAAARJSURBVFjD7VhJaFNRFHVWVFAURdCNCC5cqSAuBFfqRkTEAaQ7QVyISt2qYFcqClJRMU3TuaVDOpp0svPc0pmmLZ0b2rTpmM5zr+c8+iWIgkoSs/gfLvy+937u+eeee9773RQUFLTJ38PvAeogdZA6SB3kP4aIHEecQuz2W5Bzc3PWnp4esdvt/Wtra58B9qTfgXS5XNasrCyJj4+XqqoqGRkZmQHQe14HiSS7/mBNIJh7NTExEW+1WiUyMlIFwQ4ODmJanngN5OLi4lskb0eSc79bg/k38/PzMj09HYH1xv7+fsnJyZGIiAiJiYlR4XA4CPSyx0HiRy8sLS0JmUGSRfz94Kf5fevr62mtra2Sm5tLkNEY24+4tLKyklpZWblGNqOjoyUjI0PGxsb6/rSh/gbkwdXV1S/d3d2SlJQkXV1dAtZMGN+OOAH2mmtqaiQ0NFQKCgpkZmbmC8bPTE1NZUObhbh35efnK0bDw8OFL4Prsbc0GeB0OifT0tKkoqJCAK4RIIbIcFhYmConQc7OzgZj7R2+jNlsFjzjArvOhIQEtSY9PZ1jNqzZ4kkmdyJ2bNyfR2lbCgsLVTI2A1nUGoQgYT8fsO5GY2OjGAwGKS0tXcYzlpKSknWyyWhvp7zltEdA4ofuTk5O2nt7e+1oBHtfX18bvM8xOjoqdXV1KmFLS4tgXuLi4lSjuIM0mUxSVFREeRg7Ojp6YmNj1TOcw/XQUyCfEgTLlJiYqIKJyFpzc7Owg/k3mWXnMvn4+Ph7PHed99RgXl6eLC8vm9AwX3FJVFSUlJWVCRzgk6dAPqqvr1egyJQWBEYdEtzw8LBkZmaqF4D2yFoInrvW0NCgQNLU6ZsAZWADESSBY63ZqyC1IIiUlBQZGBiQ2tpaBaCpqWkWGmxgmY1Go7IusJsM8MEc4xrKAjKy+AQkg0npgTabTWhTlEZ1dbUMDQ0Jy5uamipwgSR4rYkMakzCqsxe0ySthIl+Vf7y8nI2jmRnZ0tycrLq/s7OTo6Fo9m+0RE0TcJ7P3gKZIB7d2+Eg01D9gheA8p7i8UiKPVX7DRmdj8rAEfgWCWYdmoWxOdx3fcUyM0bPukeexDPYUVqB9JYJUg2EhriLeavLCwsSFtbm9Ity0/b4kYQEhKi+eQprx/VkOQ2j2DsXu0Q4bbj3GJ3FxcXc69WumSpqVNaE3acYp+dJwHmLEB1cJt027t5yL0I5mw4+A6jq5VNYedRrOPFaFORPj30AtAhNEEudcaG4VENY0d5iEDJWwmc+sWOo8pPaZBl6NSMNYd9djKndsHOR3Y2jNuA+5fULDucUmADUQ6YW0Kpx2j+LDsMnvvjNp9+PiDhC8RrgsSB4sfxjJqk4VOriGNguALeybIH8gV9/o2DpFuR/B2/bcgkGaONYfyq+6cI4uZ//RCDT75EWacRdQDzDHHAH7+79yKO6P/B0EHqIHWQOkjvxndCu7vv7Dn8bAAAAABJRU5ErkJggg=="
    )

    // MARK: closeButtonIconImage
    /// 閉じるボタン・アイコン画像
    public static let closeButtonIconImage: UIImage? = DACSDKMAAdImageGenerator.generateImage(
        "iVBORw0KGgoAAAANSUhEUgAAACkAAAApCAYAAACoYAD2AAAAAXNSR0ICQMB9xQAAAAlwSFlzAAAXEgAAFxIBZ5/SUgAAABl0RVh0U29mdHdhcmUATWljcm9zb2Z0IE9mZmljZX/tNXEAAAKFSURBVFjD7ddNbxJBGAfw1s+giV68mHjwk3j35WB896BtTYytSj1oJX4KFQIs79zqN4AEThBjCIEAAcL7VQIh0MDj89/sNNuRTal0AeOQTJbdndnnt7M7z8xuOJ3OjXUvaw9USIVUSIX815BEdJXLzbVFMu7icDjM9no9/ku3zth2h8tHW5Ec4NJ4PP6RTCYpFApRt9udzAvleo9brRZ1Oh3cnMMWJF/4Ovfez1QqRR6Ph/x+P8ViMQSd8rnbp7R9AhxuzOfzEbD827cD+XI0GpHL5aJgMKgHlKB3LNo9BTAcDuv10RbQZrNJk8nkM5/fPNfHzRd14uIIYgG9KwGfmYGoHwgESNM0gTywZeAIKAKZodFo9ESPCqCAiS3qGo97z+4U9AmBABUAAS2VSkd8I9+KxeIfQBQDuLuUZM6BDgRUfvS5XE5/xDKw3W7/FXChGQc5T4Zi6/V6j/cl4OuVTIsc+EO5XD4SKHMRxyqVyojrvVrp3D2dTg8zmYw+6s1I9Gg2m8Uo1la6wOAeel6r1fqRSITk3sQ+3tFGo/GL691bCZIDb+FdA0YMEpGsBRSDCTdgTIf3l4rkgNsyEFuM6nQ6feK4BH2wrKXaziwg9guFAvE7+j2fz+s4C+hDu5dqlkAjzWwZ9RyYmcR8vSh0Xtwmj9L39Xr9OPfNAG5LbfaRR+UexSthQB+dN/ICryW1arVKbrfbsgdntHPIUDGHDwYDslo9LbrA+MrJWYeeBjRB3wko2mA9Go/HidenBT53w5aBw9AvnBuR/wB8MeeTeAsogIlEgvgTJMfHrtiaghjqPutyi+u/wbdRv9/P8//La/tJi5U6l2vqu1shFVIhFfI/RP4GLT3i7QRhYDoAAAAASUVORK5CYII="
    )
    
    // MARK: exitFullscreenButtonIconImage
    /// インライン化ボタン・アイコン画像
    public static let exitFullscreenButtonIconImage: UIImage? = DACSDKMAAdImageGenerator.generateImage(
        "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"
    )
    
    // MARK: exitFullscreenButtonLabelImage
    /// インライン化ボタン・ラベル画像を生成
    public static let exitFullscreenButtonLabelImage: UIImage? = DACSDKMAAdImageGenerator.generateImage(
        "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"
    )
    
    // MARK: enterFullscreenButtonIconImage
    /// フルスクリーン化ボタン・アイコン画像を生成
    public static let enterFullscreenButtonIconImage: UIImage? = DACSDKMAAdImageGenerator.generateImage(
        "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"
    )
    
    // MARK: enterFullscreenButtonLabelImage
    /// フルスクリーン化ボタン・ラベル画像を生成
    public static let enterFullscreenButtonLabelImage: UIImage? = DACSDKMAAdImageGenerator.generateImage(
        "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"
    )
    
    // MARK: detailButtonLabelImage
    /// 詳細を見るボタン・ラベル画像を生成
    public static let detailButtonLabelImage: UIImage? = DACSDKMAAdImageGenerator.generateImage(
        "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"
    )
    
    // MARK: prIconImage
    /// PR画像
    public static let prIconImage: UIImage? = DACSDKMAAdImageGenerator.generateImage(
        "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"
    )
    
    // MARK: skipIconImage
    /// スキップボタン・アイコン画像
    public static let skipIconImage: UIImage? = DACSDKMAAdImageGenerator.generateImage(
        "iVBORw0KGgoAAAANSUhEUgAAADAAAAAwCAYAAABXAvmHAAAAAXNSR0IArs4c6QAAAAlwSFlzAAALEwAACxMBAJqcGAAAA6hpVFh0WE1MOmNvbS5hZG9iZS54bXAAAAAAADx4OnhtcG1ldGEgeG1sbnM6eD0iYWRvYmU6bnM6bWV0YS8iIHg6eG1wdGs9IlhNUCBDb3JlIDUuNC4wIj4KICAgPHJkZjpSREYgeG1sbnM6cmRmPSJodHRwOi8vd3d3LnczLm9yZy8xOTk5LzAyLzIyLXJkZi1zeW50YXgtbnMjIj4KICAgICAgPHJkZjpEZXNjcmlwdGlvbiByZGY6YWJvdXQ9IiIKICAgICAgICAgICAgeG1sbnM6eG1wPSJodHRwOi8vbnMuYWRvYmUuY29tL3hhcC8xLjAvIgogICAgICAgICAgICB4bWxuczp0aWZmPSJodHRwOi8vbnMuYWRvYmUuY29tL3RpZmYvMS4wLyIKICAgICAgICAgICAgeG1sbnM6ZXhpZj0iaHR0cDovL25zLmFkb2JlLmNvbS9leGlmLzEuMC8iPgogICAgICAgICA8eG1wOk1vZGlmeURhdGU+MjAxNi0wMy0wMVQxODowMzo5OTwveG1wOk1vZGlmeURhdGU+CiAgICAgICAgIDx4bXA6Q3JlYXRvclRvb2w+UGl4ZWxtYXRvciAzLjQuMjwveG1wOkNyZWF0b3JUb29sPgogICAgICAgICA8dGlmZjpPcmllbnRhdGlvbj4xPC90aWZmOk9yaWVudGF0aW9uPgogICAgICAgICA8dGlmZjpDb21wcmVzc2lvbj41PC90aWZmOkNvbXByZXNzaW9uPgogICAgICAgICA8dGlmZjpSZXNvbHV0aW9uVW5pdD4yPC90aWZmOlJlc29sdXRpb25Vbml0PgogICAgICAgICA8dGlmZjpZUmVzb2x1dGlvbj43MjwvdGlmZjpZUmVzb2x1dGlvbj4KICAgICAgICAgPHRpZmY6WFJlc29sdXRpb24+NzI8L3RpZmY6WFJlc29sdXRpb24+CiAgICAgICAgIDxleGlmOlBpeGVsWERpbWVuc2lvbj40ODwvZXhpZjpQaXhlbFhEaW1lbnNpb24+CiAgICAgICAgIDxleGlmOkNvbG9yU3BhY2U+MTwvZXhpZjpDb2xvclNwYWNl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"
    )
    
    /**
     base64文字列をUIImageに変換する。
     */
    private class func generateImage(base64String :String) -> UIImage? {
        if let decodedData = NSData(base64EncodedString: base64String, options: NSDataBase64DecodingOptions.IgnoreUnknownCharacters) {
            return UIImage (data: decodedData)
        }
        else {
            return nil
        }
    }
    
}