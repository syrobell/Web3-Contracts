//SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;


contract ToDoList{
    //Todo bilgileri için struct oluşturuyoruz.
    struct Todo{
        string text;
        bool completed;
    }
    // Todo struct'ını array olarak hazırlıyoruz.
    Todo[] public todos;

    //Todo oluşturmak için fonksiyona sadece text gönderiyoruz.
    // Call data gas save için önemli.
    function create(string calldata _text) external{
        //todos arrayinin içine Todo struct'ının bilgilerinden fonksiyon dışı
        //gelen _text değişkenini ve completed değişkenini veren fonksiyon.
        todos.push(Todo({
            text: _text,
            completed: false
        }));
    }


    //Daha önce oluşturulan todo'nun textini değiştirmek için, gerekli fonksiyon.
    function updateText(uint _index, string calldata _text) external{
        //Burada eğer ki sadece 1 alan değişecekse gas kullanımı az olur.
        todos[_index].text = _text;

        //Fakat burada çoklu değişim yapılacaksa gas kullanımı yukarıdakinden
        // az olacaktır bunun sebebi ise array'e bir kere erişmekten kaynaklı
        // yukarıda çoklu erişim yaparsak her seferinde arrayi kontrol ederiz.
        
        //Todo storage todo = todos[_index];
        //todo.text = _text;
        
    }

    function get(uint _index) external view returns(string memory, bool){
        Todo memory todo = todos[_index];
        return (todo.text, todo.completed);
        
    }

    function toggleCompleted(uint _index) external{
        todos[_index].completed = !todos[_index].completed;
    }
} 