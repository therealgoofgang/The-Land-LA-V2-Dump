Config = { }

-- Debug Mode: Set to 'true' for additional debug information or 'false' for production
-- Use it only for testing purposes because it will show all the prints in the console and it will be very annoying
Config.Debug = false

-- Framework Detection: Automatically detects ESX or QB-Core. Dont change this.
Config.FrameworkType = (GetResourceState('es_extended') == 'started' and 'ESX') or (GetResourceState('qb-core') == 'started' and 'QB')

-- Database Wrapper (e.g., 'oxmysql', 'ghmattimysql')
Config.DatabaseWrapper = 'oxmysql'

-- Payment Processing Method
-- Options: 'automatic', 'bill', 'none' (automatic is recommended). You can configure your Bill System in the server/open.lua. If you choose 'none', there will be no payment of any kind.
Config.PaymentMethod = 'automatic'

-- Payment Currency (if PaymentMethod is 'automatic')
-- Options: 'bank' (from bank account), 'cash' (from money/cash on hand), 'hybrid' (50% from bank, 50% from cash)
Config.PaymentCurrency = 'bank'

-- Bank System Selection (if PaymentMethod is 'automatic'). 
-- Options: 'NFS', 'OKOK', 'QB', 'ESX', 'FD', 'TGG', 'WASABI'. You can configure your Bank System in the server/open.lua
Config.BankSystem = 'ESX'

-- FD Banking configuration (used when Config.BankSystem = 'FD' or Config.BillingSystem/SocietyMethod = 'FD')
-- Configure one of the following as your treasury target:
-- - TargetAccountId: numeric account id to receive tax transfers
-- - TargetBusiness: business identifier to resolve account dynamically
Config.FDBanking = {
    TargetAccountId = nil, -- e.g., 1001
    TargetBusiness = '',   -- e.g., 'government'
    Reason = 'Tax Payment'
}

-- TGG Banking configuration (used when Config.BankSystem = 'TGG' or Config.SocietyMethod = 'TGG')
-- Configure one of the following as your treasury target for transfers:
-- - TargetIban: numeric IBAN to receive tax transfers
-- - TargetSociety: society identifier (e.g., 'government', 'police') to resolve account dynamically
Config.TGGBanking = {
    TargetIban = nil, -- e.g., 123456
    TargetSociety = '', -- e.g., 'government'
    Reason = 'Tax Payment'
}

-- Billing System Selection (if PaymentMethod is 'bill')
-- Options: 'OKOK', 'QUASAR', 'JAKSAM', 'QB', 'ESX', 'FD', 'TGG'. You can configure your Billing System in the server/open.lua
Config.BillingSystem = 'ESX'

-- JAKSAM Billing Configuration (only used when Config.BillingSystem = 'JAKSAM')
Config.JaksamBilling = {
    TargetSociety = 'society_police', -- Society that will receive the tax payments
    SenderIdentifier = 'government' -- Identifier used as the sender for tax bills
}

-- TGG Billing Configuration (only used when Config.BillingSystem = 'TGG')
Config.TGGBilling = {
    SenderSociety = 'government', -- Society/job id or '__personal'
    SenderIdentifier = 'government', -- Logical sender id
    SenderCompanyName = 'Government', -- Display name of sender
    TaxPercentage = 0, -- Extra tax percentage line in invoice
    Notes = 'Tax Payment' -- Default invoice note
}

-- Society System Selection (if Config.CompanyTax and Config.SocietyPayments are enabled)
-- Options: 'FORGE', 'OKOK', 'QB', 'ESX', 'FD', 'TGG', 'WASABI'. You can configure your Society System in the server/open.lua
Config.SocietyMethod = 'ExcludeJobVehicles' -- Buy Forge Boss Menu here: https://codeforge.tebex.io/category/sleek-series

-- Apply Taxes to Offline Players. Keep in mind that if you put true this will result in high consumption if there are many players.
-- Personally, I wouldn’t enable it. If a player hasn’t logged in for a while, when they finally do, they’ll see they have very little money and they’re going to complain!
Config.TaxOfflinePlayers = false

-- Tax Collection Schedule
-- Set as a number (hours)
Config.TaxCollectionInterval = 6 -- Collect taxes every 3 hours. To test it, you can set it to 0.01 for 1 minute.

-- User Interface Settings
Config.UISettings = {
    EnableKeyAccess = true, -- Enable UI access via key press
    AccessKey = 166, -- Key to open the UI (https://docs.fivem.net/docs/game-references/controls/)
    EnableCommandAccess = true, -- Enable UI access via command
    AccessCommand = 'openTaxUI' -- Command to open the UI
}

-- Maybe its not neccesary to use this feature because you can use WhitelistedModels to exclude specific vehicle models from taxation.
Config.ExcludeJobVehicles = false -- Exclude job vehicles from taxation. If you want to use it, you must add the function in server/open.lua

-- Player Classification Criteria
-- Remember not to leave any gap between the values, because it will cause errors of "not set class. I recommend you to use the same values as the example.
Config.PlayerClasses = {
    low = {
        DisplayName = 'Low Class', -- Name to display in the UI
        Color = '255, 137, 86', -- Color in RGB format
        Criteria = { -- Can be any of the three criteria, not all at once
            { TotalWealth = 59999 }, -- Money in total (bank + cash)
            { TotalWealth = { 0, 39999 }, PropertiesOwned = 1 }, -- Money in total and properties
            { TotalWealth = { 0, 39999 }, VehiclesOwned = 2 } -- Money in total and vehicles
        }
    },
    middle = {
        DisplayName = 'Middle Class', -- Name to display in the UI
        Color = '170, 170, 170',
        Criteria = {
            { TotalWealth = { 60000, 799999 } }, -- Money in total
            { TotalWealth = { 40000, 99999 }, PropertiesOwned = 2 }, -- Money in total and properties
            { TotalWealth = { 40000, 99999 }, VehiclesOwned = 5 } -- Money in total and vehicles
        }
    },
    high = {
        DisplayName = 'High Class', -- Name to display in the UI
        Color = '255, 173, 0',
        Criteria = {
            { TotalWealth = 800000 }, -- Money in total
            { TotalWealth = { 100000, 799999 }, PropertiesOwned = 5 }, -- Money in total and properties
            { TotalWealth = { 100000, 799999 }, VehiclesOwned = 10 } -- Money in total and vehicles
        }
    }
}

-- Custom Classes
-- This is intended to be a class that you apply to whoever you want. Like to officials to pay less taxes or to VIPs!
Config.CustomClasses = {
    CustomClass = { 
        DisplayName = 'Custom Class', -- Name to display in the UI
        Color = '128, 0, 128', -- Color in RGB format
        Criteria = {
            Jobs = {
                Enabled = false, -- Enable or disable job-based criteria
                List = { 'mechanic' } -- Jobs that qualify for this class
            },
            Identifiers = {
                Enabled = false, -- Enable or disable identifier-based criteria
                List = { 'steam:110000100000000', 'license:1234567890abcdef' } -- Specific identifiers
            }
        },
        AdminCommand = {
            Enabled = true, -- Enable or disable the admin command
            Command = 'setCustomClass', -- Command for admins to assign this class
            Description = 'Set custom role'
        },
        AdminCommandRemove = {
            Enabled = true, -- Enable or disable the admin command
            Command = 'removeCustomClass', -- Command for admins to remove this class
            Description = 'Remove custom role' -- Description of the command
        }
    }
}

-- Taxation Configuration
-- This is the main configuration for the taxation system. You can configure the taxation for each type of tax.
Config.TaxSettings = {
    -- Vehicle Tax
    VehicleTax = {
        Enabled = true, -- Enable or disable vehicle taxation
        WhitelistedModels = {
            Enabled = false, -- Enable or disable vehicle model whitelist
            Models = {
                'police', 'police2', 'police3', -- Police vehicles
                'ambulance', 'emsnspeedo', -- Medical vehicles
                'taxi', -- Public service vehicles
                -- Add more models here as needed
            }
        },
        TaxAmounts = { -- In this case cant be percentage rates because we cant know the price of the vehicle
            high = 500, -- Fixed tax per vehicle for HighClass
            middle = 250, -- Fixed tax per vehicle for MiddleClass
            low = 100, -- Fixed tax per vehicle for LowClass
            CustomClass = 0 -- Fixed tax per vehicle for CustomClass
        }
    },
    -- Bank Account Tax
    BankTax = {
        Enabled = true, -- Enable or disable bank taxation
        CalculationMethod = 'percentage', -- 'fixed' or 'percentage'
        FixedAmounts = {
            high = 1000, -- Fixed tax for HighClass
            middle = 500, -- Fixed tax for MiddleClass
            low = 250, -- Fixed tax for LowClass
            CustomClass = 0 -- Fixed tax for CustomClass
        },
        PercentageRates = {
            high = 0.02, -- 2% of bank balance
            middle = 0.01, -- 1% of bank balance
            low = 0.005, -- 0.5% of bank balance
            CustomClass = 0 -- 0% of bank balance for CustomClass
        }
    },
    -- Cash Tax
    CashTax = {
        Enabled = false, -- Enable or disable cash taxation
        CalculationMethod = 'percentage', -- 'fixed' or 'percentage'
        FixedAmounts = {
            high = 100, -- Fixed tax for HighClass
            middle = 50, -- Fixed tax for MiddleClass
            low = 25, -- Fixed tax for LowClass
            CustomClass = 0 -- Fixed tax for CustomClass
        },
        PercentageRates = {
            high = 0.01, -- 1% of cash on hand
            middle = 0.005, -- 0.5% of cash on hand
            low = 0.002, -- 0.2% of cash on hand
            CustomClass = 0 -- 0% of cash on hand for CustomClass
        }
    },
    -- Property Tax
    PropertyTax = {
        Enabled = false, -- Enable or disable property taxation
        TaxAmounts = { -- In this case cant be percentage rates because we cant know the price of the property
            high = 10000, -- Fixed tax per property for HighClass
            middle = 5000, -- Fixed tax per property for MiddleClass
            low = 1000, -- Fixed tax per property for LowClass
            CustomClass = 0 -- Fixed tax per property for CustomClass
        }
    }
}

-- Company Tax
-- This is the main configuration for the company taxation system. You can configure the taxation for each company.
Config.CompanyTax = {
    Enabled = true, -- Enable or disable company taxation
    -- Per-society rules. Each entry defines a Method and an Amount.
    -- Method: 'fixed' | 'percentage'
    -- Amount: number. If Method='fixed' => fixed dollars. If 'percentage' => fraction (e.g., 0.04 means 4%).
    Companies = {
        ['police'] = { Method = 'percentage', Amount = 0.04 }, -- 4% of balance
        ['mechanic'] = { Method = 'percentage', Amount = 0.07 }, -- 7% of balance
        ['ambulance'] = { Method = 'fixed', Amount = 10000 } -- fixed amount
    }
}

-- Society Payment Destinations
-- This is in case you want the money collected to go to one or more organizations.
Config.SocietyPayments = { 
    Enabled = true, -- Enable or disable society destinations
    Destinations = {
        ['police'] = 0.7, -- 70% of the money will go to the police
        ['ambulance'] = 0.3 -- 30% of the money will go to the ambulance
    } -- Destinations that will receive the money
}

-- Admin Group Exemptions
Config.AdminExemptions = { 
    ESX = { 'management', 'owner' }, -- Exemptions for ESX
    QB = { 'admin', 'god' } -- Exemptions for QB-Core
}

-- Database Table Configuration
-- This is the configuration for the database tables. You can configure the tables for each framework.
Config.DatabaseTables = { 
    ESX = {
        Vehicles = {
            table = 'owned_vehicles', -- Vehicle ownership table
            ownerColumn = 'owner' -- Column that identifies the owner of the vehicle
        },
        Properties = {
            table = 'datastore_data', -- Property ownership table
            ownerColumn = 'owner'
        }
    },
    QB = {
        Vehicles = {
            table = 'player_vehicles', -- Vehicle ownership table
            ownerColumn = 'citizenid' -- Column that identifies the owner of the vehicle
        },
        Properties = {
            table = 'player_houses', -- Property ownership table
            ownerColumn = 'citizenid' -- Column that identifies the owner of the property
        }
    }
}

-- Functions
-- This is the configuration for the functions. More functions in server/open.lua and client/open.lua
Config.Functions = { 
    -- Notification Function
    Notify = function(text) 
        if Config.FrameworkType == 'ESX' then
            ESX.ShowNotification(text)
        elseif Config.FrameworkType == 'QB' then
            QBCore.Functions.Notify(text)
        end
    end

}

-- Localization Settings
-- This is the configuration for the localization. You can configure the localization for each language.
Config.Locale = 'en' -- en, fr, es, de, it, pt, tr or your language

Config.Translations = { 
    ['en'] = { 
        translation = {
            heading = 'Taxes',
            slogan = 'The state is all of us',
            description = 'Depending on your wealth, you will be HIGH, MIDDLE, or LOW CLASS',
            paymentText = 'TIME FOR THE NEXT <br/> <span>NEXT TAX PAYMENT:</span>',
            LOGS_TAXES_PAID_TITLE = 'All dues settled: Taxes have been paid!',
            LOGS_TAX_BILLS_SENT_TITLE = 'Attention: New tax invoices dispatched!',
            LOGS_TOTAL_FUNDS_COLLECTED = 'Grand total amassed: $%s. Taxed players: %s. Payment method: %s',
            LOGS_TOTAL_INVOICES_SENT = 'Total invoices dispatched: $%s. Taxed players: %s',
            NOTIFICATION_ADMIN_TAX_EXEMPT = 'As an admin, you enjoy a tax-free status!',
            NOTIFICATION_TAX_PAYMENT = 'You have successfully contributed $%s in taxes. Thank you!',
            NOTIFICATION_TAX_PAYMENT_BANK = 'You have successfully contributed $%s in taxes from your bank account. Thank you!',
            NOTIFICATION_TAX_PAYMENT_CASH = 'You have successfully contributed $%s in taxes from your cash. Thank you!',
            NOTIFICATION_TAX_PAYMENT_HYBRID = 'You have successfully contributed $%s in taxes ($%s from bank, $%s from cash). Thank you!',
            NOTIFICATION_TAX_PAYMENT_HYBRID_REDISTRIBUTED = 'You have contributed $%s in taxes ($%s from bank, $%s from cash). Some funds were redistributed between accounts to complete the payment from the original $%s.',
            NOTIFICATION_NEW_TAX_INVOICE = 'Heads up! New tax invoices have arrived. Check them out!',
            NOTIFICATION_SET_CUSTOM_CLASS = 'You have been added to a special social class. Congratulations!',
            NOTIFICATION_REMOVE_CUSTOM_CLASS = 'You have been removed from the special Social Class!',
            BOSS_MENU_DEPOSITING_PLAYER = 'Government Tax',
            BOSS_MENU_DEPOSIT_REASON = 'Government Deposit',
            BOSS_MENU_WITHDRAWER = 'Government Tax',
            BOSS_MENU_WITHDRAW_REASON = 'Tax Payment'
        }
    },
    ['fr'] = {
        translation = {
            heading = 'Impôts',
            slogan = 'L\'État, c\'est nous tous',
            description = 'Selon votre richesse, vous serez de CLASSE ÉLEVÉE, MOYENNE ou BASSE',
            paymentText = 'TEMPS POUR LA SUIVANTE <br/> <span>PROCHAIN ​​PAIEMENT D\'IMPÔT:</span>',
            LOGS_TAXES_PAID_TITLE = 'Tous les paiements réglés : Les impôts ont été payés !',
            LOGS_TAX_BILLS_SENT_TITLE = 'Attention : Nouvelles factures fiscales envoyées !',
            LOGS_TOTAL_FUNDS_COLLECTED = 'Grand total amassed: $%s. Taxed players: $%s',
            LOGS_TOTAL_INVOICES_SENT = 'Total invoices dispatched: $%s. Taxed players: $%s',
            NOTIFICATION_ADMIN_TAX_EXEMPT = 'En tant qu\'admin, vous bénéficiez d\'une exonération fiscale !',
            NOTIFICATION_TAX_PAYMENT = 'Vous avez contribué avec succès $%s en impôts. Merci !',
            NOTIFICATION_TAX_PAYMENT_BANK = 'Vous avez contribué avec succès $%s en impôts depuis votre compte bancaire. Merci !',
            NOTIFICATION_TAX_PAYMENT_CASH = 'Vous avez contribué avec succès $%s en impôts depuis votre liquide. Merci !',
            NOTIFICATION_TAX_PAYMENT_HYBRID = 'Vous avez contribué avec succès $%s en impôts ($%s depuis le compte bancaire, $%s en liquide). Merci !',
            NOTIFICATION_TAX_PAYMENT_HYBRID_REDISTRIBUTED = 'Vous avez contribué $%s en impôts ($%s depuis le compte bancaire, $%s en liquide). Certains fonds ont été redistribués entre les comptes pour compléter le paiement d\'origine de $%s.',
            NOTIFICATION_NEW_TAX_INVOICE = 'Attention ! De nouvelles factures fiscales sont arrivées. Vérifiez-les !',
            NOTIFICATION_SET_CUSTOM_CLASS = 'You have been added to a special social class. Congratulations!', 
            NOTIFICATION_REMOVE_CUSTOM_CLASS = 'You have been removed from the special Social Class!',
            BOSS_MENU_DEPOSITING_PLAYER = 'Gouvernement',
            BOSS_MENU_DEPOSIT_REASON = 'Dépôt du gouvernement',
            BOSS_MENU_WITHDRAWER = 'Gouvernement',
            BOSS_MENU_WITHDRAW_REASON = 'Paiement des impôts'
        }
    },
    ['es'] = {
        translation = {
            heading = 'Impuestos',
            slogan = 'El estado somos todos',
            description = 'Dependiendo de tu riqueza, serás de CLASE ALTA, MEDIA o BAJA',
            paymentText = 'TIEMPO PARA EL PRÓXIMO <br/> <span>PRÓXIMO PAGO DE IMPUESTOS:</span>',
            LOGS_TAXES_PAID_TITLE = 'Todos los pagos realizados: ¡Los impuestos han sido pagados!',
            LOGS_TAX_BILLS_SENT_TITLE = 'Atención: ¡Nuevas facturas de impuestos enviadas!',
            LOGS_TOTAL_FUNDS_COLLECTED = 'Total acumulado: $%s. Jugadores gravados: %s',
            LOGS_TOTAL_INVOICES_SENT = 'Total de facturas enviadas: $%s. Jugadores gravados: %s',
            NOTIFICATION_ADMIN_TAX_EXEMPT = '¡Como administrador, disfrutas de un estado libre de impuestos!',
            NOTIFICATION_TAX_PAYMENT = 'Has contribuido exitosamente con $%s en impuestos. ¡Gracias!',
            NOTIFICATION_TAX_PAYMENT_BANK = 'Has contribuido exitosamente con $%s en impuestos desde tu cuenta bancaria. ¡Gracias!',
            NOTIFICATION_TAX_PAYMENT_CASH = 'Has contribuido exitosamente con $%s en impuestos desde tu efectivo. ¡Gracias!',
            NOTIFICATION_TAX_PAYMENT_HYBRID = 'Has contribuido exitosamente con $%s en impuestos ($%s desde el banco, $%s en efectivo). ¡Gracias!',
            NOTIFICATION_TAX_PAYMENT_HYBRID_REDISTRIBUTED = 'Has contribuido $%s en impuestos ($%s desde el banco, $%s en efectivo). Algunos fondos se han redistribuido entre las cuentas para completar el pago original de $%s.',
            NOTIFICATION_NEW_TAX_INVOICE = '¡Atención! Han llegado nuevas facturas de impuestos. ¡Revísalas!',
            NOTIFICATION_SET_CUSTOM_CLASS = 'Has sido añadido a una clase social especial. ¡Felicidades!',
            NOTIFICATION_REMOVE_CUSTOM_CLASS = '¡Has sido removido de la clase social especial!',
            BOSS_MENU_DEPOSITING_PLAYER = 'Impuesto del Gobierno',
            BOSS_MENU_DEPOSIT_REASON = 'Depósito del Gobierno',
            BOSS_MENU_WITHDRAWER = 'Impuesto del Gobierno',
            BOSS_MENU_WITHDRAW_REASON = 'Pago de Impuestos'
        }
    },
    ['de'] = {
        translation = {
            heading = 'Steuern',
            slogan = 'Der Staat sind wir alle',
            description = 'Je nach Ihrem Vermögen werden Sie in die HOHE, MITTLERE oder NIEDRIGE KLASSE eingestuft',
            paymentText = 'ZEIT FÜR DIE NÄCHSTE <br/> <span>NÄCHSTE STEUERZAHLUNG:</span>',
            LOGS_TAXES_PAID_TITLE = 'Alle Abgaben beglichen: Steuern wurden bezahlt!',
            LOGS_TAX_BILLS_SENT_TITLE = 'Achtung: Neue Steuerrechnungen verschickt!',
            LOGS_TOTAL_FUNDS_COLLECTED = 'Gesamtsumme gesammelt: $%s. Besteuerte Spieler: %s',
            LOGS_TOTAL_INVOICES_SENT = 'Gesamtzahl der verschickten Rechnungen: $%s. Besteuerte Spieler: %s',
            NOTIFICATION_ADMIN_TAX_EXEMPT = 'Als Admin genießen Sie einen steuerfreien Status!',
            NOTIFICATION_TAX_PAYMENT = 'Sie haben erfolgreich $%s an Steuern beigetragen. Danke!',
            NOTIFICATION_TAX_PAYMENT_BANK = 'Sie haben erfolgreich $%s an Steuern von Ihrem Bankkonto beigetragen. Danke!',
            NOTIFICATION_TAX_PAYMENT_CASH = 'Sie haben erfolgreich $%s an Steuern von Ihrem Bargeld beigetragen. Danke!',
            NOTIFICATION_TAX_PAYMENT_HYBRID = 'Sie haben erfolgreich $%s an Steuern beigetragen ($%s von Ihrem Bankkonto, $%s in Bargeld). Danke!',
            NOTIFICATION_TAX_PAYMENT_HYBRID_REDISTRIBUTED = 'Sie haben $%s an Steuern beigetragen ($%s von Ihrem Bankkonto, $%s in Bargeld). Einige Mittel wurden zwischen Konten umgeleitet, um den ursprünglichen Betrag von $%s zu bezahlen.',
            NOTIFICATION_NEW_TAX_INVOICE = 'Achtung! Neue Steuerrechnungen sind eingetroffen. Schauen Sie sie sich an!',
            NOTIFICATION_SET_CUSTOM_CLASS = 'Sie wurden einer speziellen sozialen Klasse hinzugefügt. Glückwunsch!',
            NOTIFICATION_REMOVE_CUSTOM_CLASS = 'Sie wurden aus der speziellen sozialen Klasse entfernt!',
            BOSS_MENU_DEPOSITING_PLAYER = 'Regierungssteuer',
            BOSS_MENU_DEPOSIT_REASON = 'Regierungseinzahlung',
            BOSS_MENU_WITHDRAWER = 'Regierungssteuer',
            BOSS_MENU_WITHDRAW_REASON = 'Steuerzahlung'
        }
    },
    ['it'] = {
        translation = {
            heading = 'Tasse',
            slogan = 'Lo stato siamo tutti noi',
            description = 'A seconda della tua ricchezza, sarai di CLASSE ALTA, MEDIA o BASSA',
            paymentText = 'TEMPO PER IL PROSSIMO <br/> <span>PROSSIMO PAGAMENTO DELLE TASSE:</span>',
            LOGS_TAXES_PAID_TITLE = 'Tutti i debiti saldati: Le tasse sono state pagate!',
            LOGS_TAX_BILLS_SENT_TITLE = 'Attenzione: Nuove fatture fiscali inviate!',
            LOGS_TOTAL_FUNDS_COLLECTED = 'Totale accumulato: $%s. Giocatori tassati: %s',
            LOGS_TOTAL_INVOICES_SENT = 'Totale fatture inviate: $%s. Giocatori tassati: %s',
            NOTIFICATION_ADMIN_TAX_EXEMPT = 'Come amministratore, godi di uno stato esente da tasse!',
            NOTIFICATION_TAX_PAYMENT = 'Hai contribuito con successo con $%s in tasse. Grazie!',
            NOTIFICATION_TAX_PAYMENT_BANK = 'Hai contribuito con successo con $%s in tasse dal tuo conto bancario. Grazie!',
            NOTIFICATION_TAX_PAYMENT_CASH = 'Hai contribuito con successo con $%s in tasse dal tuo denaro. Grazie!',
            NOTIFICATION_TAX_PAYMENT_HYBRID = 'Hai contribuito con successo con $%s in tasse ($%s dal conto bancario, $%s in denaro). Grazie!',
            NOTIFICATION_TAX_PAYMENT_HYBRID_REDISTRIBUTED = 'Hai contribuito $%s in tasse ($%s dal conto bancario, $%s in denaro). Alcuni fondi sono stati ripartiti tra i conti per completare il pagamento originale di $%s.',
            NOTIFICATION_NEW_TAX_INVOICE = 'Attenzione! Sono arrivate nuove fatture fiscali. Controllale!',
            NOTIFICATION_SET_CUSTOM_CLASS = 'Sei stato aggiunto a una classe sociale speciale. Congratulazioni!',
            NOTIFICATION_REMOVE_CUSTOM_CLASS = 'Sei stato rimosso dalla classe sociale speciale!',
            BOSS_MENU_DEPOSITING_PLAYER = 'Tassa del Governo',
            BOSS_MENU_DEPOSIT_REASON = 'Deposito del Governo',
            BOSS_MENU_WITHDRAWER = 'Tassa del Governo',
            BOSS_MENU_WITHDRAW_REASON = 'Pagamento delle Tasse'
        }
    },
    ['pt'] = {
        translation = {
            heading = 'Impostos',
            slogan = 'O estado somos todos nós',
            description = 'Dependendo da sua riqueza, você será de CLASSE ALTA, MÉDIA ou BAIXA',
            paymentText = 'TEMPO PARA O PRÓXIMO <br/> <span>PRÓXIMO PAGAMENTO DE IMPOSTOS:</span>',
            LOGS_TAXES_PAID_TITLE = 'Todas as dívidas saldadas: Os impostos foram pagos!',
            LOGS_TAX_BILLS_SENT_TITLE = 'Atenção: Novas faturas de impostos enviadas!',
            LOGS_TOTAL_FUNDS_COLLECTED = 'Total acumulado: $%s. Jogadores tributados: %s',
            LOGS_TOTAL_INVOICES_SENT = 'Total de faturas enviadas: $%s. Jogadores tributados: %s',
            NOTIFICATION_ADMIN_TAX_EXEMPT = 'Como administrador, você desfruta de um status isento de impostos!',
            NOTIFICATION_TAX_PAYMENT = 'Você contribuiu com sucesso com $%s em impostos. Obrigado!',
            NOTIFICATION_TAX_PAYMENT_BANK = 'Você contribuiu com sucesso com $%s em impostos do seu banco. Obrigado!',
            NOTIFICATION_TAX_PAYMENT_CASH = 'Você contribuiu com sucesso com $%s em impostos do seu dinheiro. Obrigado!',
            NOTIFICATION_TAX_PAYMENT_HYBRID = 'Você contribuiu com sucesso com $%s em impostos ($%s do banco, $%s em dinheiro). Obrigado!',
            NOTIFICATION_TAX_PAYMENT_HYBRID_REDISTRIBUTED = 'Você contribuiu $%s em impostos ($%s do banco, $%s em dinheiro). Alguns fundos foram redistribuídos entre as contas para completar o pagamento original de $%s.',
            NOTIFICATION_NEW_TAX_INVOICE = 'Atenção! Novas faturas de impostos chegaram. Confira!',
            NOTIFICATION_SET_CUSTOM_CLASS = 'Você foi adicionado a uma classe social especial. Parabéns!',
            NOTIFICATION_REMOVE_CUSTOM_CLASS = 'Você foi removido da classe social especial!',
            BOSS_MENU_DEPOSITING_PLAYER = 'Imposto do Governo',
            BOSS_MENU_DEPOSIT_REASON = 'Depósito do Governo',
            BOSS_MENU_WITHDRAWER = 'Imposto do Governo',
            BOSS_MENU_WITHDRAW_REASON = 'Pagamento de Impostos'
        }
    },
    ['tr'] = {
        translation = {
            heading = 'Vergiler',
            slogan = 'Devlet hepimiziz',
            description = 'Varlığınıza bağlı olarak YÜKSEK, ORTA veya DÜŞÜK SINIF olacaksınız',
            paymentText = 'BİR SONRAKİ <br/> <span>BİR SONRAKİ VERGİ ÖDEMESİ İÇİN ZAMAN:</span>',
            LOGS_TAXES_PAID_TITLE = 'Tüm borçlar ödendi: Vergiler ödendi!',
            LOGS_TAX_BILLS_SENT_TITLE = 'Dikkat: Yeni vergi faturaları gönderildi!',
            LOGS_TOTAL_FUNDS_COLLECTED = 'Toplam toplanan: $%s. Vergilendirilen oyuncular: %s',
            LOGS_TOTAL_INVOICES_SENT = 'Gönderilen toplam faturalar: $%s. Vergilendirilen oyuncular: %s',
            NOTIFICATION_ADMIN_TAX_EXEMPT = 'Bir yönetici olarak, vergiden muaf bir statüye sahipsiniz!',
            NOTIFICATION_TAX_PAYMENT = 'Başarıyla $%s vergi ödediniz. Teşekkürler!',
            NOTIFICATION_TAX_PAYMENT_BANK = 'Başarıyla $%s vergi ödediniz banka hesabından. Teşekkürler!',
            NOTIFICATION_TAX_PAYMENT_CASH = 'Başarıyla $%s vergi ödediniz nakitten. Teşekkürler!',
            NOTIFICATION_TAX_PAYMENT_HYBRID = 'Başarıyla $%s vergi ödediniz ($%s banka hesabından, $%s nakitten). Teşekkürler!',
            NOTIFICATION_TAX_PAYMENT_HYBRID_REDISTRIBUTED = 'Başarıyla $%s vergi ödediniz ($%s banka hesabından, $%s nakitten). Bazı fonlar hesaplar arasında yeniden dağıtıldı, başlangıç ödemesini tamamlamak için $%s.',
            NOTIFICATION_NEW_TAX_INVOICE = 'Dikkat! Yeni vergi faturaları geldi. Kontrol edin!',
            NOTIFICATION_SET_CUSTOM_CLASS = 'Özel bir sosyal sınıfa eklendiniz. Tebrikler!',
            NOTIFICATION_REMOVE_CUSTOM_CLASS = 'Özel Sosyal Sınıftan çıkarıldınız!',
            BOSS_MENU_DEPOSITING_PLAYER = 'Hükümet Vergisi',
            BOSS_MENU_DEPOSIT_REASON = 'Hükümet Mevduatı',
            BOSS_MENU_WITHDRAWER = 'Hükümet Vergisi',
            BOSS_MENU_WITHDRAW_REASON = 'Vergi Ödemesi'
        }
    }
}