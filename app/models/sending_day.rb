class SendingDay < ApplicationRecord
  self.data = [
    { id: 1, name: '--' },
    { id: 2, name: '1〜2日で発送' },
    { id: 3, name: '2〜3日で発送' },
    { id: 4, name: '4〜7日で発送' },
    { id: 5, name: 'やや傷や汚れあり' },
    { id: 6, name: '傷や汚れあり' },
    { id: 7, name: '全体的に状態が悪い' },
  ]
end
