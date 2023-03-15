<?php

namespace App\Component\LoyaltyPoints\Calculator;

class LoyaltyPointsCalculator implements LoyaltyPointsCalculatorInterface
{
    static public array $pricingPlans = [
        'default',
        'premium'
    ];

    static public array $weekDayWage = [
        1 => 3,
        2 => 3,
        3 => 3,
        4 => 3,
        5 => 5,
        6 => 5,
        7 => 5,
    ];

    public function calculateLoyaltyPoints(string $pricingPlanName, int $loyaltyPoints): int
    {
        return $loyaltyPoints * $this->getLoyaltyPointsMultiplier($pricingPlanName);
    }

    public function getLoyaltyPointsMultiplier(string $pricingPlanName): int
    {
        if($pricingPlanName === 'premium' && in_array($pricingPlanName, self::$pricingPlans)) {
            return self::$weekDayWage[date('N')];
        }

        return 1;
    }
}