# MVVM

This is a really simple project to show an example of MVVM design pattern in iOS.
With binding (implemented in Dynamic.swift) and protocol extension
(see HomeM.swift) in swift

(you can also see an example of stackView in the storyboard)


### Dynamic.swift

Binding is provided by Dynamic.swift :
```swift
class Dynamic<T> {
    typealias Listener = T -> Void
    var listener = Array<Listener?>()

    func bind(listener: Listener?) {
        self.listener.append(listener)
    }

    func bindAndFire(listener: Listener?) {
        self.listener.append(listener)
        listener?(value)
    }

    var value: T {
        didSet {
            self.listener.forEach { (listener) in
                listener?(value)
            }
        }
    }

    init(_ v: T) {
        value = v
    }
}
```
