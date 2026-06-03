class ReportGenerator 
  def generate_total_spending_report(user)
    puts "____Total spending report_____"
    puts "Name : #{user.name}"
    puts "Email : #{user.email}"
    puts "#{user.total_expense}"
  end
end

