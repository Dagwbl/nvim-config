-- 日记路径处理模块
local M = {}

-- 创建嵌套的年月目录结构
-- 返回: 完整的文件路径字符串
function M.generate_diary_path(base_dir, note_id)
  -- 获取当前日期信息
  local year = os.date("%Y")
  local month = os.date("%B") -- 英文月份名，如 "January"
  local filename = tostring(note_id)

  -- 转换 base_dir 为字符串并统一路径分隔符
  local dir_str = tostring(base_dir):gsub("\\", "/")

  -- 构建目标路径
  local target_dir = string.format("%s/%s/%s", dir_str, year, month)
  local file_path = string.format("%s/%s.md", target_dir, filename)

  -- 递归创建目录
  local success = vim.fn.mkdir(target_dir, "p")

  if success == 0 then
    vim.notify(string.format("Failed to create directory: %s", target_dir), vim.log.levels.ERROR)
    return nil
  end

  return file_path
end

-- 检查路径是否是日记目录
function M.is_diary_path(path_str)
  return path_str:match("content/diary") ~= nil
end

-- 从日期字符串解析年月（用于历史日记）
function M.parse_date_from_id(note_id)
  local id_str = tostring(note_id)
  -- 匹配格式: 2026-01-24
  local year, month, day = id_str:match("(%d%d%d%d)%-(%d%d)%-(%d%d)")

  if year and month and day then
    -- 转换月份数字为英文名
    local month_names = {
      "January",
      "February",
      "March",
      "April",
      "May",
      "June",
      "July",
      "August",
      "September",
      "October",
      "November",
      "December",
    }
    local month_num = tonumber(month)
    local month_name = month_names[month_num]
    
    -- 如果月份名称解析失败，使用当前月份
    if not month_name then
      vim.notify(string.format("Invalid month number: %s, using current month", month), vim.log.levels.WARN)
      month_name = os.date("%B")
    end
    
    return year, month_name
  end

  -- 如果解析失败，使用当前日期
  return os.date("%Y"), os.date("%B")
end

-- 生成带日期解析的日记路径（支持 yesterday/tomorrow）
function M.generate_diary_path_with_date(base_dir, note_id)
  local year, month = M.parse_date_from_id(note_id)
  local filename = tostring(note_id)

  -- 转换路径
  local dir_str = tostring(base_dir):gsub("\\", "/")
  local target_dir = string.format("%s/%s/%s", dir_str, year, month)
  local file_path = string.format("%s/%s.md", target_dir, filename)

  -- 创建目录
  vim.fn.mkdir(target_dir, "p")

  return file_path
end

return M
