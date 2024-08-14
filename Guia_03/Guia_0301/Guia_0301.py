def complemento_de_1(num):

    negacao = num ^ 0b1111
    
    return negacao

def complemento_de_2(num):

    c1 = complemento_de_1(num);
    c2 = c1 + 1;

    return c2

numbers = [0b001010, 0b00001101, 0b101001, 0b0101111, 0b00110100]

comp1 = []
comp2 = []

for numero in numbers:
    comp1.append(complemento_de_1(numero))
    comp2.append(complemento_de_2(numero))

print("Complemento de 1:", [bin(c) for c in comp1])
print("Complemento de 2:", [bin(c) for c in comp2])
