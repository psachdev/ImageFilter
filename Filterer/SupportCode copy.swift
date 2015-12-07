//
// This file (and all other Swift source files in the Sources directory of this playground) will be precompiled into a framework which is automatically made available to ImagePart1.playground.
//
import UIKit

public class ImageProcessor {
    let redfactor : Int
    let bluefactor : Int
    let greenfactor : Int
    let lowerfactor : Int
    let upperfactor : Int
    let factor : Int
    
    public init(redfactor : Int, bluefactor : Int, greenfactor : Int, lowerfactor : Int, higherfactor : Int, factor : Int){
        self.redfactor = redfactor
        self.bluefactor = bluefactor
        self.greenfactor = greenfactor
        self.lowerfactor = lowerfactor
        self.upperfactor = higherfactor
        self.factor = factor
    }
    
    public func filter_red_blue_green(image: UIImage) -> UIImage {
        let rgbaImage = RGBAImage(image: image)!
        
        var totalRed=0
        var totalBlue=0
        var totalGreen=0
        
        //Find average RGB of the given image
        for y in 0..<rgbaImage.height {
            for x in 0..<rgbaImage.width {
                let index = y * rgbaImage.width + x
                let pixel = rgbaImage.pixels[index]
                
                totalRed += Int(pixel.red)
                totalBlue += Int(pixel.blue)
                totalGreen += Int(pixel.green)
            }
        }
        
        let pixelCount = rgbaImage.width * rgbaImage.height
        let avgGreen = totalGreen / pixelCount
        let avgBlue = totalBlue / pixelCount
        let avgRed = totalRed / pixelCount
        let sum = avgGreen + avgBlue + avgRed
        
        
        for y in 0..<rgbaImage.height {
            for x in 0..<rgbaImage.width {
                let index = y * rgbaImage.width + x
                var pixel = rgbaImage.pixels[index]
                
                let redDelta = Int(pixel.red) - avgRed
                let blueDelta = Int(pixel.blue) - avgBlue
                let greenDelta = Int(pixel.green) - avgGreen
                
                
                pixel.red = UInt8(max(0, min(255, (avgRed) + (redDelta * redfactor))))
                pixel.green = UInt8(max(0, min(255, (avgGreen) + (greenDelta * greenfactor))))
                pixel.blue = UInt8(max(0, min(255, (avgBlue) + (blueDelta * bluefactor))))
                
                rgbaImage.pixels[index]=pixel
            }
        }
        let newImageIncreaseContrast = rgbaImage.toUIImage()!
        return newImageIncreaseContrast
    }

    
    
    public func filter_contrast_equal(image: UIImage) -> UIImage {
        let rgbaImage = RGBAImage(image: image)!
        
        var totalRed=0
        var totalBlue=0
        var totalGreen=0
        
        //Find average RGB of the given image
        for y in 0..<rgbaImage.height {
            for x in 0..<rgbaImage.width {
                let index = y * rgbaImage.width + x
                let pixel = rgbaImage.pixels[index]
                
                totalRed += Int(pixel.red)
                totalBlue += Int(pixel.blue)
                totalGreen += Int(pixel.green)
            }
        }
        
        let pixelCount = rgbaImage.width * rgbaImage.height
        let avgGreen = totalGreen / pixelCount
        let avgBlue = totalBlue / pixelCount
        let avgRed = totalRed / pixelCount
        let sum = avgGreen + avgBlue + avgRed
        
        
        for y in 0..<rgbaImage.height {
            for x in 0..<rgbaImage.width {
                let index = y * rgbaImage.width + x
                var pixel = rgbaImage.pixels[index]
                
                let redDelta = Int(pixel.red) - avgRed
                let blueDelta = Int(pixel.blue) - avgBlue
                let greenDelta = Int(pixel.green) - avgGreen
                
                
                pixel.red = UInt8(max(0, min(255, (avgRed) + (redDelta * factor))))
                pixel.green = UInt8(max(0, min(255, (avgGreen) + (greenDelta * factor))))
                pixel.blue = UInt8(max(0, min(255, (avgBlue) + (blueDelta * factor))))
                
                rgbaImage.pixels[index]=pixel
            }
        }
        let newImageIncreaseContrast = rgbaImage.toUIImage()!
        return newImageIncreaseContrast
    }

    
    public func filter_contrast_unequal(image: UIImage) -> UIImage {
        let rgbaImage = RGBAImage(image: image)!
        
        var totalRed=0
        var totalBlue=0
        var totalGreen=0
        
        //Find average RGB of the given image
        for y in 0..<rgbaImage.height {
        for x in 0..<rgbaImage.width {
            let index = y * rgbaImage.width + x
            let pixel = rgbaImage.pixels[index]
        
            totalRed += Int(pixel.red)
            totalBlue += Int(pixel.blue)
            totalGreen += Int(pixel.green)
            }
        }
        
        let pixelCount = rgbaImage.width * rgbaImage.height
        let avgGreen = totalGreen / pixelCount
        let avgBlue = totalBlue / pixelCount
        let avgRed = totalRed / pixelCount
        let sum = avgGreen + avgBlue + avgRed

        var factor = 0
        
        for y in 0..<rgbaImage.height {
        for x in 0..<rgbaImage.width {
            let index = y * rgbaImage.width + x
            var pixel = rgbaImage.pixels[index]
    
            let redDelta = Int(pixel.red) - avgRed
            let blueDelta = Int(pixel.blue) - avgBlue
            let greenDelta = Int(pixel.green) - avgGreen
    
            if (Int(pixel.red) + Int(pixel.green) + Int(pixel.blue) < sum) {
                factor = self.upperfactor
            }else{
                factor = self.lowerfactor
            }
    
            pixel.red = UInt8(max(0, min(255, (avgRed) + (redDelta * factor))))
            pixel.green = UInt8(max(0, min(255, (avgGreen) + (greenDelta * factor))))
            pixel.blue = UInt8(max(0, min(255, (avgBlue) + (blueDelta * factor))))
    
            rgbaImage.pixels[index]=pixel
            }
        }
        let newImageIncreaseContrast = rgbaImage.toUIImage()!
        return newImageIncreaseContrast
    }
    
    public func brightness_increase_50(image: UIImage) -> UIImage {
        let rgbaImage = RGBAImage(image: image)!
        
        for y in 0..<rgbaImage.height {
            for x in 0..<rgbaImage.width {
                let index = y * rgbaImage.width + x
                var pixel = rgbaImage.pixels[index]
                
                
                
                pixel.red = UInt8(max(0, min(255, Int(pixel.red) + 100)))
                pixel.green = UInt8(max(0, min(255, Int(pixel.green) + (100))))
                pixel.blue = UInt8(max(0, min(255, Int(pixel.blue) + (100))))
                
                
                rgbaImage.pixels[index]=pixel
            }
        }
        let newImageIncreaseBrightness = rgbaImage.toUIImage()!
        return newImageIncreaseBrightness
    }
    
    public func brightness_increase_70(image: UIImage) -> UIImage {
        let rgbaImage = RGBAImage(image: image)!
        
        for y in 0..<rgbaImage.height {
            for x in 0..<rgbaImage.width {
                let index = y * rgbaImage.width + x
                var pixel = rgbaImage.pixels[index]
                
                
                
                pixel.red = UInt8(max(0, min(255, Int(pixel.red) + 150)))
                pixel.green = UInt8(max(0, min(255, Int(pixel.green) + (150))))
                pixel.blue = UInt8(max(0, min(255, Int(pixel.blue) + (150))))
                rgbaImage.pixels[index]=pixel
            }
        }
        let newImageIncreaseContrast = rgbaImage.toUIImage()!
        return newImageIncreaseContrast
        
        
    }

    
    public func contrast_increase_2X(image: UIImage) -> UIImage {
        return filter_contrast_equal (image)
    }
    
    public func contrast_increase_10X(image: UIImage) -> UIImage {
        return filter_contrast_equal (image)
    }
    
    public func bright_increase_contrast_increase_50(image: UIImage) -> UIImage{
        var brightImage : UIImage = brightness_increase_50(image)
        return contrast_increase_2X(brightImage)
    }
    
    
    public enum DefaultFilter : String {
        case IncreaseBrightness50 = "50% Brightness"
        case IncreaseBrightness70 = "70% Brightness"
        case IncreaseContrast2X = "2X Contrast"
        case IncreaseContrast10X = "10X Contrast"
        case IncreaseBrightness50Contrast2x = "50% Brightness 2X Contrast"
    }
    
    public func applyDefaultFilter(image: UIImage, filter : String) -> UIImage{
        let filteredImage : UIImage
        if let enumFilter = DefaultFilter(rawValue: filter) {
            switch enumFilter {
            case DefaultFilter.IncreaseBrightness50 :
                filteredImage = brightness_increase_50(image)
            case DefaultFilter.IncreaseBrightness70:
                filteredImage = brightness_increase_70(image)
            case DefaultFilter.IncreaseContrast2X:
                filteredImage = contrast_increase_2X(image)
            case DefaultFilter.IncreaseContrast10X:
                filteredImage = contrast_increase_10X(image)
            case DefaultFilter.IncreaseBrightness50Contrast2x:
                filteredImage = bright_increase_contrast_increase_50(image)
            }
        }else{
            filteredImage=image
        }
        return filteredImage
    }
    
    public func applyOrderedFilter( image : UIImage, filterorder : [Int] ) -> UIImage {
        let rgbaImage = RGBAImage(image: image)!
        var filteredImage : UIImage = image
        for i in filterorder{
            switch i {
                case 1 :
                    filteredImage = self.filter_red_blue_green(filteredImage)
                case 2 :
                    filteredImage = self.filter_contrast_unequal(filteredImage)
                case 3 :
                    filteredImage = self.filter_contrast_equal(filteredImage)
                default :
                filteredImage = image
            }
        }
        return filteredImage
    }
    
    public func applyRedFilter( image : UIImage, red : Int ) -> UIImage{
        let rgbaImage = RGBAImage(image: image)!
        
        for y in 0..<rgbaImage.height {
            for x in 0..<rgbaImage.width {
                let index = y * rgbaImage.width + x
                var pixel = rgbaImage.pixels[index]
                
                //pixel.red = UInt8(max(0, min(255, Int(pixel.red) + 150)))
                pixel.red = UInt8(max(0, min(255, Int(pixel.red) + red)))

                rgbaImage.pixels[index]=pixel
            }
        }
        let newImage = rgbaImage.toUIImage()!
        return newImage
    }
    
    public func applyBlueFilter( image : UIImage, blue : Int ) -> UIImage{
        let rgbaImage = RGBAImage(image: image)!
        
        for y in 0..<rgbaImage.height {
            for x in 0..<rgbaImage.width {
                let index = y * rgbaImage.width + x
                var pixel = rgbaImage.pixels[index]
                
                //pixel.blue = UInt8(max(0, min(255, Int(pixel.blue) + 150)))
                pixel.blue = UInt8(max(0, min(255, Int(pixel.blue) + blue)))

                rgbaImage.pixels[index]=pixel
            }
        }
        let newImage = rgbaImage.toUIImage()!
        return newImage
    }
    
    public func applyGreenFilter( image : UIImage, green : Int ) -> UIImage{
        let rgbaImage = RGBAImage(image: image)!
        
        for y in 0..<rgbaImage.height {
            for x in 0..<rgbaImage.width {
                let index = y * rgbaImage.width + x
                var pixel = rgbaImage.pixels[index]
                
                //pixel.green = UInt8(max(0, min(255, Int(pixel.green) + 150)))
                pixel.green = UInt8(max(0, min(255, Int(pixel.green) + green)))

                rgbaImage.pixels[index]=pixel
            }
        }
        let newImage = rgbaImage.toUIImage()!
        return newImage
    }
    
    public func applyYellowFilter( image : UIImage, green : Int, red : Int ) -> UIImage{
        let rgbaImage = RGBAImage(image: image)!
        
        for y in 0..<rgbaImage.height {
            for x in 0..<rgbaImage.width {
                let index = y * rgbaImage.width + x
                var pixel = rgbaImage.pixels[index]
                
                if(pixel.green > 100){
                    //pixel.green = UInt8(max(0, min(255, Int(pixel.green) + 100)))
                    pixel.green = UInt8(max(0, min(255, Int(pixel.green) + green)))

                }
                if(pixel.red > 100){
                    //pixel.red = UInt8(max(0, min(255, Int(pixel.red) + 100)))
                    pixel.red = UInt8(max(0, min(255, Int(pixel.red) + red)))

                }
                rgbaImage.pixels[index]=pixel
            }
        }
        let newImage = rgbaImage.toUIImage()!
        return newImage
    }
    
    public func applyPurpleFilter( image : UIImage, x : Int, y : Int ) -> UIImage{
        let rgbaImage = RGBAImage(image: image)!
        
        for y in 0..<rgbaImage.height {
            for x in 0..<rgbaImage.width {
                let index = y * rgbaImage.width + x
                var pixel = rgbaImage.pixels[index]
                
                if(pixel.green > 100){
                    //pixel.green = UInt8(max(0, min(255, Int(pixel.green) - 100)))
                    pixel.green = UInt8(max(0, min(255, Int(pixel.green) - x)))

                }
                
                if(pixel.red > 150 ){
                    //pixel.red = UInt8(max(0, min(255, Int(pixel.red) - 50)))
                    pixel.red = UInt8(max(0, min(255, Int(pixel.red) - y)))

                }
                if(pixel.red < 100 ){
                    //pixel.red = UInt8(max(0, min(255, Int(pixel.red) + 50)))
                    pixel.red = UInt8(max(0, min(255, Int(pixel.red) + y)))

                }
                
                if(pixel.blue > 150 ){
                    //pixel.blue = UInt8(max(0, min(255, Int(pixel.blue) - 50)))
                    pixel.blue = UInt8(max(0, min(255, Int(pixel.blue) - y)))

                }
                if(pixel.blue < 100 ){
                    //pixel.blue = UInt8(max(0, min(255, Int(pixel.blue) + 50)))
                    pixel.blue = UInt8(max(0, min(255, Int(pixel.blue) + y)))

                }
                
                rgbaImage.pixels[index]=pixel
            }
        }
        let newImage = rgbaImage.toUIImage()!
        return newImage
    }
}









