/*
 * Copyright 2024 The Android Open Source Project
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     https://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import Foundation

protocol FruittieApi {
    func getData(pageNumber: Int) async throws -> FruittiesResponse
}



class FruittieNetworkApi: FruittieApi {
    private let apiUrl: URL

    init(apiUrl: URL) {
        self.apiUrl = apiUrl
    }

    func getData(pageNumber: Int) async throws -> FruittiesResponse {
        let url = apiUrl.appending(path: "/\(pageNumber).json")
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        let (data, _) = try await URLSession.shared.data(for: request)

        return try JSONDecoder().decode(FruittiesResponse.self, from: data)
    }
}
