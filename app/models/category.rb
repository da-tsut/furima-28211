class Category < ActiveHash::Base
  self.data = [
    { id: 1, name: '--' },
    { id: 2, name: 'レディース' },
    { id: 3, name: 'メンズ' },
    { id: 4, name: 'ベビー・キッズ' },
    { id: 5, name: 'インテリア・住まい・小物' },
    { id: 6, name: '本・音楽・ゲーム' },
    { id: 7, name: 'おもちゃ・ボビー・グッズ' },
    { id: 8, name: '家電・スマホ・カメラ' },
    { id: 9, name: 'スポーツ・レジャー' },
    { id: 10, name: 'ハンドメイド' },
    { id: 11, name: 'その他' },
  ]
end

#    <option value="1">--</option>
#    <option value="2">レディース</option>
#    <option value="3">メンズ</option>
#    <option value="4">ベビー・キッズ</option>
#    <option value="5">インテリア・住まい・小物</option>
#    <option value="6">本・音楽・ゲーム</option>
#    <option value="7">おもちゃ・ボビー・グッズ</option>
#    <option value="8">家電・スマホ・カメラ</option>
#    <option value="9">スポーツ・レジャー</option>
#    <option value="10">ハンドメイド</option>
#    <option value="11">その他</option>
#  </select>
#end
