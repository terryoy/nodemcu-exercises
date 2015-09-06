function list_file()
    for k,v in pairs(file.list()) do
        print("file: "..k..", size:"..v.." bytes")
    end
end

function cat_file(filename)
    file.open(filename)
    print(file.read())
    file.close()
end

function rm_file(filename)
    file.remove(filename)
end