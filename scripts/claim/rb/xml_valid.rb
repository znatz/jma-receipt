#!/usr/bin/env ruby
# coding : utf-8
#
# claim test Rcv server
#   xml valid parser check interface module
#
#   in : xml file path_name
#      : dtd file path_name
#      : log file path_name
#   out: retrun code ( OK=true, NG=false )
#      : log file( append mode )
# 
# version 1.3.0
#                  '01-10-30 by Yamamoto

#--- Define Method --------------------
def parser_check(xml_fl_path_name, dtd_fl_path_name, log_fl_path_name)

  tmp_fl = xml_fl_path_name.gsub(/.xml$/, "_tmp.xml")
  pre_pro(xml_fl_path_name, dtd_fl_path_name, tmp_fl)
  
#-----<
#--  ans = `export LD_LIBRARY_PATH=.:/usr/local/orca/lib && ./SAXPrint -v=auto -n #{tmp_fl} 2>&1 1>/dev/null`
#  if ans == ""
#    ans = "\n" + xml_fl_path_name + " : validate check OK\n"
#    rtn = true
#  else
#    rtn = false
#  end
  
    rtn = true
#  ans = Time.now.strftime("%Y-%m-%dT%H:%M:%S") + "\n" + ans + "\n\n"
#-----<
  ans = Time.now.strftime("%Y-%m-%dT%H:%M:%S") + "\n"  + "\n\n"
  $stderr.print "\n[Results]\n" + ans
  open(log_fl_path_name, "a") do |log|
    log.puts ans
  end

  rtn
end

# pre_pro 
#   Insert DTD declare <!DOCTYPE ... >
#   replace "EMPTY" declared Elements <kara ... ></kara> --> <kara ... />
def pre_pro(xml_fl_path_name, dtd_fl_path_name, tmp_fl)
  doctype_line = '<!DOCTYPE Mml SYSTEM "' + dtd_fl_path_name + '">' + "\n"
  clm_emp_elem_list = './claim_empty_elem.list'
  
  ins_flg = false ; buf_out = ""

  open(xml_fl_path_name, "r") do |f|
    while buf = f.gets
      if( /^\s*?<\*?Mml/ =~ buf && ins_flg == false )
        buf_out = buf_out + doctype_line ; ins_flg = true 
      end
      buf_out = buf_out + buf
    end
  end
  
  # replace "EMPTY" Elements
  open(clm_emp_elem_list, "r") do |f|
    while emp_elem = f.gets
#      emp_elem.gsub!(/^\s*<\s*\!\s*ELEMENT\s*/i,"")
#      emp_elem.gsub!(/\s+(.)*/m,"")
      emp_elem.chop!
      $stderr.puts "  empty elements " + emp_elem
      buf_out.gsub!(/>\s*\n*\r*<\s*\/\s*#{emp_elem}\s*>/,'/>') if emp_elem != ""
    end
  end
  
  open(tmp_fl, "w") do |f|
    f.print buf_out
  end
end

#----- Script end -----------------------------------
