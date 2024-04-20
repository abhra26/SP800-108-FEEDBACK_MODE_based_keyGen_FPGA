def text_to_binary(text):
  binary = ''.join(f'{ord(char):08b}' for char in text)
  num = len(binary)
  binary_str = bin(num)[2:]
  binary_str = '0' * (64 - len(binary_str)) + binary_str
  k = (512 - (num + 65)) % 512
  out = binary+'1'+(k*'0')+binary_str
  for i in range(1,len(out)+1):
    if i%32 == 0:
      print(out[i-1])
    else:
      print(out[i-1],end=" ")

  return out

# Example usage
text = "card?=4536000123456789Pin?=1234DeviceId?=co2w61ythtd7Name?=rahulroycvv?=555Expiry?=10-10-30"
out = text_to_binary(text)
print("Message Blocks = ", len(out)/512)