import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mobile_banking_app/app_colors.dart';
import 'package:mobile_banking_app/features/home/domain/models/plastic_card_model.dart';

class PlasticCard extends StatelessWidget {
  final PhysicalCard card;
  final showCvv = false;

  const PlasticCard({
    super.key,
    required this.card,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 200,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(18),
        gradient: const LinearGradient(
          colors: [
            AppColors.cardGradientStart,
            AppColors.cardGradientEnd,
          ],
          begin: Alignment.topLeft,
          end: Alignment.centerRight,
        ),
        border: Border.all(
            color: AppColors.surfacePrimary.withOpacity(0.08), width: 1),
        boxShadow: [
          BoxShadow(
            color: AppColors.inkBase.withOpacity(0.15),
            blurRadius: 12,
            offset: const Offset(0, 6),
          )
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                width: 44,
                height: 28,
                child: SvgPicture.asset(
                  'assets/svg/card-providers/card-chip.svg',
                  fit: BoxFit.cover,
                ),
              ),
              Transform.rotate(
                angle: 90 * 3.1416 / 180, // 90 grados
                child: const Icon(Icons.wifi,
                    color: AppColors.onDarkHigh, size: 28),
              ),
            ],
          ),
          const Spacer(),
          Text(
            card.cardNumber,
            style: const TextStyle(
              color: AppColors.surfacePrimary,
              fontSize: 22,
              letterSpacing: 1.6,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: 15),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    _buildInfoBlock('Card Holder', card.cardHolderName),
                    _buildInfoBlock('Expiry Date', card.expiryDate),
                    _buildInfoBlock('CVV', showCvv ? card.cvv : '***'),
                  ],
                ),
              ),
              const SizedBox(width: 12),
              if (_selectCardSvg() != null)
                SizedBox(
                  width: 44,
                  height: 28,
                  child: SvgPicture.asset(
                    _selectCardSvg()!,
                    fit: BoxFit.cover,
                  ),
                ),
            ],
          )
        ],
      ),
    );
  }

  Widget _buildInfoBlock(String label, String value) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(color: AppColors.onDarkMedium, fontSize: 10),
        ),
        Text(
          value,
          style: const TextStyle(color: AppColors.surfacePrimary, fontSize: 14),
        ),
      ],
    );
  }

  String? _selectCardSvg() {
    if (card.cardNumber.startsWith('4')) {
      return 'assets/svg/card-providers/visa.svg';
    } else if (card.cardNumber.startsWith('5')) {
      return 'assets/svg/card-providers/mastercard.svg';
    } else {
      return null;
    }
  }
}
