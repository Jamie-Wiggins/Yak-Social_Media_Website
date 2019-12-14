# users

10.times do |n|
    username = Faker::Name.first_name
    email = Faker::Internet.email
    password = "1Password"
    User.create!(
        username: username,
        first_name: "jamie",
        last_name: "wiggins",
        email: email,
        password: password,
        password_confirmation: password)
    puts "created user #{n+1}"
end

# groups
j=0
1.times do |x|
    j+= 1
    group = "group"
    Group.create!(
        name: group)
    puts "created group #{j}"
end

# posts

z=0
10.times do |x|
    z+= 1
    content = "this is lots and lots of content"
    color = "#d73f3f"
    text_color = "#ffffff"
    font_type = "Tahoma"
    font_size = "30"
    Post.create!(
        content: content,
        user_id: 1,
        group_id: 1,
        color: color,
        text_color: text_color,
        font_type: font_type,
        font_size: font_size)
    puts "created post #{z}"
end

n=0
10.times do |y|
    n+= 1
    content = "lots more of extra content from yours truley jamie wiggins yyyyyyyaaaaaaaaayyyyyy!!!!!"
    color = "#194052"
    text_color = "#ffffff"
    font_type = "Tahoma"
    font_size = "24"
    Post.create!(
        content: content,
        user_id: n,
        group_id: 1,
        color: color,
        text_color: text_color,
        font_type: font_type,
        font_size: font_size)
    puts "created post #{n}"
end

#replies
