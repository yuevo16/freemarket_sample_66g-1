crumb :root do
  link "メルカリ", root_path
end

crumb :mypage do
  link "マイページ", "/mypage/#{current_user.id}"
  parent :root
end

crumb :card do
  link "支払い方法", "#"
  parent :mypage
end

crumb :profile do
  link "プロフィール", "/mypage/#{current_user.id}/user_profile"
  parent :mypage
end

crumb :identification do
  link "本人情報の登録", "/mypage/#{current_user.id}/identification"
  parent :mypage
end

crumb :logout do
  link "ログアウト", "/mypage/#{current_user.id}/logout"
  parent :mypage
end

crumb :exhibition do
  link "出品した商品-出品中", "/mypage/#{current_user.id}/sell_list"
  parent :mypage
end

crumb :trading do
  link "出品した商品-取引中", "#"
  parent :mypage
end

crumb :sold do
  link "出品した商品-売却済み", "#"
  parent :mypage
end

#パンクずのリンク先を商品の名前にしたい
# crumb :item_name do
#   link :name, "/items/#{item.id}"
#   parent :mypage
# end