User.create!([
  {email: "langhals@osu.edu", encrypted_password: "$2a$11$naLHEm.OdfnQ8lfTXSj2.uUnPnVU.LY7JrFIxBALfheEz1f.KKVOS", reset_password_token: nil, reset_password_sent_at: nil, remember_created_at: nil, username: "AlyKat16", first_name: "Alyssa", last_name: "Langhals", gender: "Female", last_log_on: nil, confirmation_token: nil, confirmed_at: nil, confirmation_sent_at: nil, unconfirmed_email: nil, sign_in_count: 2, current_sign_in_at: "2018-11-30 13:42:45", last_sign_in_at: "2018-11-30 13:20:48", current_sign_in_ip: "127.0.0.1", last_sign_in_ip: "127.0.0.1"},
  {email: "cat@nottoday.com", encrypted_password: "$2a$11$fvG8sExAwij8m9KigCOiwuKmY9wosUNAUMsEhi0fL4dpISGMxQeqa", reset_password_token: nil, reset_password_sent_at: nil, remember_created_at: nil, username: "LasangaLover", first_name: "Garfield", last_name: "Cat", gender: "Male", last_log_on: nil, confirmation_token: nil, confirmed_at: nil, confirmation_sent_at: nil, unconfirmed_email: nil, sign_in_count: 1, current_sign_in_at: "2018-11-30 13:27:34", last_sign_in_at: "2018-11-30 13:27:34", current_sign_in_ip: "127.0.0.1", last_sign_in_ip: "127.0.0.1"},
  {email: "lassoof@truth.com", encrypted_password: "$2a$11$bDhG43D1lvKc9hJP0xXO6uCMDHH0lFN4iV0zRcLiPtagm0ayXxT2a", reset_password_token: nil, reset_password_sent_at: nil, remember_created_at: nil, username: "WWoman", first_name: "Diana", last_name: "Prince", gender: "Female", last_log_on: nil, confirmation_token: nil, confirmed_at: nil, confirmation_sent_at: nil, unconfirmed_email: nil, sign_in_count: 1, current_sign_in_at: "2018-11-30 13:35:45", last_sign_in_at: "2018-11-30 13:35:45", current_sign_in_ip: "127.0.0.1", last_sign_in_ip: "127.0.0.1"}
])
Follower.create!([
  {users_id: 2, user: 2, fTarget: 1},
  {users_id: 3, user: 3, fTarget: 2},
  {users_id: 1, user: 1, fTarget: 3},
  {users_id: 1, user: 1, fTarget: 2}
])
Book.create!([
  {author: "Eoin Colfer", general_media_id: 1},
  {author: "JK Rowling", general_media_id: 2}
])
CustomMediaEntry.create!([
  {key: "Playwright", value: "Andrew Lloyd Weber", custom_media_id: 1},
  {key: "I hate Mondays", value: "I hate Mondays", custom_media_id: 2},
  {key: "type", value: "every kind", custom_media_id: 3}
])
CustomMedium.create!([
  {typeOfMedia: "Musical", general_media_id: 4},
  {typeOfMedia: "Weekday", general_media_id: 5},
  {typeOfMedia: "food", general_media_id: 6}
])
GeneralMedium.create!([
  {name: "Artemis Fowl", timeStamp: nil},
  {name: "Harry Potter", timeStamp: nil},
  {name: "Leather and Lace", timeStamp: nil},
  {name: "Phantom Of the Opera", timeStamp: nil},
  {name: "Mondays", timeStamp: nil},
  {name: "Lasagna", timeStamp: nil},
  {name: "Superhero Friends", timeStamp: nil},
  {name: "Wonder Woman", timeStamp: nil}
])
HistoryLog.create!([
  {historyMessage: " created Artemis Fowl at ", users_id: 1},
  {historyMessage: " created Harry Potter at ", users_id: 1},
  {historyMessage: " created Leather and Lace at ", users_id: 1},
  {historyMessage: " created Phantom Of the Opera at ", users_id: 1},
  {historyMessage: " created Mondays at ", users_id: 2},
  {historyMessage: " created Lasagna at ", users_id: 2},
  {historyMessage: " created Superhero Friends at ", users_id: 3},
  {historyMessage: " created Wonder Woman at ", users_id: 3}
])
Movie.create!([
  {director: "Lynda Carter", general_media_id: 8}
])
Music.create!([
  {artist: "Stevie Nicks", album: "?", general_media_id: 3}
])
PersonalMediaParameter.create!([
  {score: 10, currentStatus: "Finished", favorite: true, comments: "Loved the series", source: "", replay: 6, users_id: 1, general_media_id: 1},
  {score: 10, currentStatus: "Finished", favorite: true, comments: "", source: "", replay: 20, users_id: 1, general_media_id: 2},
  {score: 8, currentStatus: "Started", favorite: true, comments: "", source: "", replay: 5, users_id: 1, general_media_id: 3},
  {score: 8, currentStatus: "Finished", favorite: nil, comments: "", source: "", replay: 2, users_id: 1, general_media_id: 4},
  {score: 1, currentStatus: "Started...", favorite: nil, comments: "I hate Mondays", source: "", replay: 100, users_id: 2, general_media_id: 5},
  {score: 10, currentStatus: "Finished", favorite: true, comments: "I love lasagna", source: "", replay: 100000, users_id: 2, general_media_id: 6},
  {score: 5, currentStatus: "Started", favorite: true, comments: "", source: "", replay: 1, users_id: 3, general_media_id: 7},
  {score: nil, currentStatus: "Finished", favorite: true, comments: "10/10 girl power", source: "", replay: 10000, users_id: 3, general_media_id: 8}
])
Preference.create!([
  {wallpaper: nil, fontSize: nil, font: nil, profilePicture: nil, privacy: true, fontColor: nil, users_id: 1}
])
TvShow.create!([
  {numberOfSeasons: 2, totalEpisodes: 12, general_media_id: 7}
])
