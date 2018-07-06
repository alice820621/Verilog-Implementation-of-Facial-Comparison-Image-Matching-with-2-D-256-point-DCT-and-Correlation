import numpy as np
import matplotlib.pyplot as plt
from PIL import Image

def grayscale(path):
    openimg = Image.open(path)
    resizeimg = openimg.resize((256,256),Image.ANTIALIAS)
    npgray = np.array(resizeimg.convert('L'))
    listgray = npgray.tolist()
    return listgray

#a is number of photo
for a in range(10):
    photo = "C:\\Users\\alice\\Desktop\\{0}.png".format(a)
    gray = grayscale(photo)
    with open("C:\\Users\\alice\\Desktop\\row_in{0}.txt".format(a), "w") as f:
        for s in gray:
            for i in range(256):
                #f.write(str(s[i]<<10))      #shift 10-bit for verilog fraction
                #f.write(str(s[i]<<30))      #shift 30-bit
                f.write(str(s[i]<<15))      #shift 15-bit
                f.write(" ")
            f.write("\n")
    plt.subplot(2,5,a+1)
    plt.title("gray{0}".format(a))
    plt.imshow(gray, cmap = plt.get_cmap('gray'))
plt.show()
