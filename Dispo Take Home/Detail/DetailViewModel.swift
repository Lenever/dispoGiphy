//
//  DetailViewModel.swift
//  Dispo Take Home
//
//  Created by Ikechukwu Onuorah on 18/01/2022.
//

import Foundation

class DetailViewModel {
    var gifRepository: RemoteRepository?
    
    init() {
        self.gifRepository = RemoteRepository()
    }
    
    func fetchGif(gifId: String, success: @escaping (GifObject) -> (), failure: @escaping (String) -> ()) {
        gifRepository?.getGif(
            gifId: gifId,
            success: {gifInfo in
                success(gifInfo)
                print(gifInfo, "<<||>>")
            },
            failure: {error in
                failure(error)
            }
        )
    }
}
