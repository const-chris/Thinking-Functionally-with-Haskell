type Matrix a = [[a]]

transpose :: Matrix a -> Matrix a
transpose ([]:_) = []
transpose rs = map head rs : transpose (map tail rs)
