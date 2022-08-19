# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:

#Users
user1 = User.create(name: "James", email: "email@email.com", password: "123456")

#Groups
category1 = Group.create(name: 'Insurance', icon: 'map:insurance-agency', author_id: user1.id)
category2 = Group.create(name: 'Transportation', icon: 'emojione-v1:bus', author_id: user1.id)
category3 = Group.create(name: 'Housing', icon: 'noto:house-with-garden', author_id: user1.id)
category4 = Group.create(name: 'Medical & Healthcare ', icon: 'noto:health-worker-medium-light-skin-tone', author_id: user1.id)
category5 = Group.create(name: 'Entertainment', icon: 'logos:netflix-icon', author_id: user1.id)
category6 = Group.create(name: 'Debt', icon: 'flat-color-icons:debt', author_id: user1.id)
category7 = Group.create(name: 'Other', icon: 'icon-park-solid:other', author_id: user1.id)
category8 = Group.create(name: 'Food', icon: 'emojione:pot-of-food', author_id: user1.id)
category9 = Group.create(name: 'Utilities', icon: 'healthicons:electricity', author_id: user1.id)

#Expenses
expense1 = Expense.create(name: "Life Insurance", amount: 1000, author_id: user1.id, group_id: category1.id)
expense2 = Expense.create(name: "Health Insurance", amount: 100, author_id: user1.id, group_id: category1.id)
expense3 = Expense.create(name: "Mortgage", amount: 200, author_id: user1.id, group_id: category3.id)

#Group Expenses
group_expense1 = GroupExpense.create(group_id: category1.id, expense_id: expense1.id)
group_expense2 = GroupExpense.create(group_id: category1.id, expense_id: expense2.id)
group_expense3 = GroupExpense.create(group_id: category3.id, expense_id: expense3.id)