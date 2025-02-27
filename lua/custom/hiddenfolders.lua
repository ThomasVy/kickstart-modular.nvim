local hiddenfolders = {
    '.git',
    'node_modules',
    '.github',
    '.next',
    '.DS_Store',
    '.vscode',
    '.idea',
    '.cache',
    '.vs',
}

local hiddenfolders_pattern = {}
for _, folder in ipairs(hiddenfolders) do
    table.insert(hiddenfolders_pattern, folder .. '/*')
end

return { hiddenfolders = hiddenfolders, hiddenfolders_pattern = hiddenfolders_pattern }
