//
//  Post.swift
//  1.3_iOS_navigation_and_life_cycle_UIViewController
//
//  Created by Никита Спевак on 27.05.2022.
//

import Foundation

struct PostModel {
    var author: String
    var description: String?
    var image: String
    var likes: Int
    var views: Int
    
    static func makeMockModel() -> [PostModel] {
        var model = [PostModel]()
        model.append(PostModel(author: "Арктур Менгск", description: "Говорят, человек узнает себя только тогда, когда его лишают свободы. Интересно, насколько хорошо знаешь себя ты, арестант №626? Убийца, пират, предатель… Сегодня ты выходишь на свободу, но скоро ты поймёшь, что даже у свободы есть цена — твоя тюрьма всегда будет с тобой. Добро пожаловать в новую клетку...", image: "Mengsk", likes: 2460, views: 2505))
        model.append(PostModel(author: "Джим Рейнор о Саре Керриган", description: "... В тот день началась наша революция. В день, когда Менгск уничтожил целую планету и назвал это «справедливостью...", image: "Kerrigan", likes: 2473 , views: 2602))
        model.append(PostModel(author: "За АЙУР!", description: "Наш гордый народ был обречён на изгнание, но никто не разрушит наше единство, ибо нас связывает Кхала — священный союз всех наших мыслей и эмоций. Сегодня мы вернём родной мир! И с ним — наше наследие!", image: "For AIUR!", likes: 8671, views: 13285))
        model.append(PostModel(author: "Артанис", description: " — Столько ребят погибло... воинов. \n — Смерть — судьба всех воинов. Судьба, которую вскоре можем встретить и мы. \n— Судьба — это не приговор.", image: "Artanis", likes: 1345, views: 1986))
        
        return model
    }
}
