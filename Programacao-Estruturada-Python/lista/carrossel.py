def strToInt(nums):
    for i in range(len(nums)):
        nums[i] = int(nums[i])
    return nums
if __name__ == '__main__':

    max_seq = 0
    cur_seq = 0
    prev_num = -1

    n = int(input())
    nums = strToInt(input().split())
    nums = nums + nums
    for i in range(len(nums)):
        num = nums[i] 
        if num > prev_num:
            cur_seq += 1
            max_seq = cur_seq if cur_seq > max_seq else max_seq
        else:
            cur_seq = 1
        prev_num = num
    else: 
        print(max_seq)

# 55
# 6 1 5 8 7
