import 'package:mobile_banking_app/features/history/domain/models/history_product_model.dart';

abstract class HistoryMockData {
  static const List<HistoryProduct> products = [
    HistoryProduct(
      id: 'cc-001',
      name: 'Visa Clasica',
      maskedIdentifier: '•••• 7654',
      type: HistoryProductType.creditCard,
      summaryItems: [
        HistorySummaryItem(label: 'Fecha de pago', value: '15 Mar 2026'),
        HistorySummaryItem(label: 'Fecha de corte', value: '28 Mar 2026'),
        HistorySummaryItem(
          label: 'Pago minimo',
          value: 'Q 425.35',
          highlight: true,
        ),
        HistorySummaryItem(label: 'Saldo al corte', value: 'Q 3,240.62'),
      ],
      movements: [
        HistoryMovement(
          description: 'Supermercado Central',
          category: 'Consumo',
          date: '08 Mar 2026',
          amount: -245.89,
        ),
        HistoryMovement(
          description: 'Gasolinera Norte',
          category: 'Consumo',
          date: '07 Mar 2026',
          amount: -60.00,
        ),
        HistoryMovement(
          description: 'Pago recibido',
          category: 'Abono',
          date: '05 Mar 2026',
          amount: 350.00,
        ),
        HistoryMovement(
          description: 'Restaurante El Buen Sabor',
          category: 'Consumo',
          date: '03 Mar 2026',
          amount: -120.73,
        ),
        HistoryMovement(
          description: 'Compra en linea',
          category: 'Consumo',
          date: '01 Mar 2026',
          amount: -89.00,
        ),
        HistoryMovement(
          description: 'Pago recibido',
          category: 'Abono',
          date: '28 Feb 2026',
          amount: 500.00,
        ),
        HistoryMovement(
          description: 'Pago recibido',
          category: 'Abono',
          date: '25 Feb 2026',
          amount: 200.00,
        ),
      ],
    ),
    HistoryProduct(
      id: 'ca-001',
      name: 'Monetaria Principal',
      maskedIdentifier: '•••• 6789',
      type: HistoryProductType.checkingAccount,
      summaryItems: [
        HistorySummaryItem(
          label: 'Saldo disponible',
          value: 'Q 8,920.14',
          highlight: true,
        ),
        HistorySummaryItem(label: 'Ingresos del mes', value: 'Q 3,100.00'),
        HistorySummaryItem(label: 'Egresos del mes', value: 'Q 2,215.35'),
      ],
      movements: [
        HistoryMovement(
          description: 'Transferencia enviada',
          category: 'Transferencia',
          date: '09 Mar 2026',
          amount: -500.00,
        ),
        HistoryMovement(
          description: 'Deposito de nomina',
          category: 'Ingreso',
          date: '08 Mar 2026',
          amount: 2200.00,
        ),
        HistoryMovement(
          description: 'Pago servicios',
          category: 'Pago',
          date: '07 Mar 2026',
          amount: -145.35,
        ),
      ],
    ),
    HistoryProduct(
      id: 'sa-001',
      name: 'Ahorro Metas',
      maskedIdentifier: '•••• 4455',
      type: HistoryProductType.savingsAccount,
      summaryItems: [
        HistorySummaryItem(
          label: 'Saldo disponible',
          value: 'Q 15,430.50',
          highlight: true,
        ),
        HistorySummaryItem(label: 'Ingresos del mes', value: 'Q 918.40'),
        HistorySummaryItem(label: 'Egresos del mes', value: 'Q 120.00'),
      ],
      movements: [
        HistoryMovement(
          description: 'Aporte programado',
          category: 'Ahorro',
          date: '09 Mar 2026',
          amount: 300.00,
        ),
        HistoryMovement(
          description: 'Interes acreditado',
          category: 'Interes',
          date: '01 Mar 2026',
          amount: 18.40,
        ),
        HistoryMovement(
          description: 'Retiro cajero',
          category: 'Retiro',
          date: '27 Feb 2026',
          amount: -120.00,
        ),
      ],
    ),
  ];
}
