
import Foundation

class Network {
    enum APIHandler {
        static let todos = "https://jsonplaceholder.typicode.com/todos"
    }
    
    func loadData(completion: @escaping ([Todos]) -> Void) {
        guard let url = URL(string: APIHandler.todos) else { return }
        let request = URLRequest(url: url)
        let dataTask = URLSession.shared.dataTask(with: request) { data, _, _ in
            guard let data else { return }
            let decoder = JSONDecoder()
            let todos: [Todos]? = try? decoder.decode([Todos].self, from: data)
            guard let todos else { return }
            completion(todos)
        }
        dataTask.resume()
    }
}
