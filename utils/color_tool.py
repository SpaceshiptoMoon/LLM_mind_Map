import matplotlib.colors as mcolors
import numpy as np

def generate_single_color_gradient(hex_color, n_steps=256, mode='brightness'):
    """
    基于单个颜色生成渐变色列表
    
    参数:
    hex_color: 字符串，基础的十六进制颜色字符串 (如 "#FF0000")
    n_steps: 整型，渐变的总步数（颜色数）
    mode: 字符串，渐变模式。可选 'brightness'（亮度）, 'saturation'（饱和度）, 或 'hue'（色相）
    
    返回:
    gradient_hex: 列表，包含n_steps个十六进制颜色字符串的渐变色列表
    """
    # 将十六进制颜色转换为RGB，再转换为0-1范围的RGB元组
    rgb_color = mcolors.to_rgb(hex_color)
    # 将RGB转换为HSV
    h, s, v = mcolors.rgb_to_hsv(rgb_color)
    
    gradient_hsv = []
    
    if mode == 'brightness':
        # 亮度渐变: 保持色相和饱和度不变，改变亮度
        for i in range(n_steps):
            t = i / (n_steps - 1)  # 从0到1
            new_v = t  # 亮度从0到1变化
            gradient_hsv.append((h, s, new_v))
            
    elif mode == 'saturation':
        # 饱和度渐变: 保持色相和亮度不变，改变饱和度
        for i in range(n_steps):
            t = i / (n_steps - 1)  # 从0到1
            new_s = t  # 饱和度从0到1变化
            gradient_hsv.append((h, new_s, v))
            
    elif mode == 'hue':
        # 色相渐变: 保持饱和度和亮度不变，改变色相
        for i in range(n_steps):
            t = i / (n_steps - 1)  # 从0到1
            new_h = t  # 色相从0到1变化 (对应0°到360°)
            gradient_hsv.append((new_h, s, v))
    
    else:
        raise ValueError("模式参数必须是 'brightness', 'saturation' 或 'hue'")
    
    # 将HSV转换回RGB，再转换为十六进制
    gradient_rgb = [mcolors.hsv_to_rgb(hsv) for hsv in gradient_hsv]
    gradient_hex = [mcolors.to_hex(rgb) for rgb in gradient_rgb]
    
    return gradient_hex
