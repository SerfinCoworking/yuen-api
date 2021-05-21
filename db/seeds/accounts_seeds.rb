cash_type = AccountType.create(name: 'Efectivo')
account_type = AccountType.create(name: 'Cuentas')
AccountType.create(name: 'Tarjeta de crédito')
AccountType.create(name: 'Tarjeta de débito')
AccountType.create(name: 'Ahorro')
AccountType.create(name: 'Tarjeta prepago')
AccountType.create(name: 'Inversión')
AccountType.create(name: 'Descubierto bancario')
AccountType.create(name: 'Seguro')
AccountType.create(name: 'Otro')

Account.create(name: 'Billetera', account_type: cash_type, user_id: 1)
Account.create(name: 'MercadoPago', account_type: account_type, user_id: 1)