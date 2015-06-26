Fabricator(:subscription) do
  user(fabricator: user)
  group(fabricator: group)
end