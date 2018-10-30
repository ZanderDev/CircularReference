# CircularReference
CircularReference of swift


#swift 循环引用

- 几个容易产生循环引用的地方
	- lazy 属性
	- 异步回调的block


### Lazy 属性

		lazy var printName: ()->() = {
		    print("The name is \(self.name)")
		    //        The name is XiaoMing
		    //        Optional(A4Paper.Person)
		    //        nil
		}

		//    lazy var printName: ()->() = { [unowned self] in
		//        print("The name is \(self.name)")
		//        //        The name is XiaoMing
		//        //        Optional(A4Paper.Person)
		//        //        Person deinit XiaoMing
		//        //        nil
		//    }

		//    lazy var printName: ()->() = { [weak self] in
		//        guard let strongSelf = self else {
		//            return
		//        }
		//        print("The name is \(strongSelf.name)")
		////        The name is XiaoMing
		////        Optional(A4Paper.Person)
		////        Person deinit XiaoMing
		////        nil
		//    }


### block asyn 
		func printName() {
		//            Singleton.default.block = { print("The name is \(self.name)")}
		    Singleton.default.block = { [unowned self] in print("The name is \(self.name)") }
		//            Singleton.default.block = { [weak self] in print("The name is \(String(describing: self?.name))") }
		    Singleton.default.callBlockAsync()


		    // 1 nothing to do
		    /*
		    Optional(A4Paper.BlockSelf.Person)
		    nil
		    */

		    // 2 unowned self
		    /*
		    Optional(A4Paper.BlockSelf.Person)
		    Person deinit XiaoMing
		    Person deinit A4Paper.BlockSelf.Person
		    nil
		    Fatal error: Attempted to read an unowned reference but object 0x600002b36610 was already deallocated2018-10-30 09:43:09.887756+0800 A4Paper[3951:76031] Fatal error: Attempted to read an unowned reference but object 0x600002b36610 was already deallocated
		     */

		    // 3 weak self
		    /*
		    Optional(A4Paper.BlockSelf.Person)
		    Person deinit XiaoMing
		    Person deinit A4Paper.BlockSelf.Person
		    nil
		    */
		}
