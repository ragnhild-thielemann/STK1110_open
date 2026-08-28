
younger = c(29, 34, 33, 27, 28, 32, 31, 34, 32, 27)

older = c(18, 15, 23, 13, 12)

t.test(younger, older,  alternative = c("two.sided", "less", "greater"))
m_y = mean(younger)
m_o = mean(older)

summary (test)
st_y = var(younger)
st_o = var(older)

n_y = length(younger)
n_o = length(older)
df = 7.55
print(m_y)
error = sqrt(st_y/n_y + st_o/n_o)
m = m_y - m_o - 10
intervall = m / error
print(intervall)



