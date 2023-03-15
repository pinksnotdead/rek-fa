<?php

/*
 * This file is part of the Symfony package.
 *
 * (c) Fabien Potencier <fabien@symfony.com>
 *
 * For the full copyright and license information, please view the LICENSE
 * file that was distributed with this source code.
 */

namespace App\Tests\Utils;

use App\Component\LoyaltyPoints\Calculator\LoyaltyPointsCalculator;
use PHPUnit\Framework\TestCase;

class LoyaltyPointsCalculatorTest extends TestCase
{
    private LoyaltyPointsCalculator $calculator;

    private array $weekDayWage = [
        1 => 3,
        2 => 3,
        3 => 3,
        4 => 3,
        5 => 5,
        6 => 5,
        7 => 5,
    ];
    protected function setUp(): void
    {
        $this->calculator = new LoyaltyPointsCalculator();
    }

    public function testDefaultPlan(): void
    {
            $this->assertSame(1, $this->calculator->getLoyaltyPointsMultiplier('default'));
    }

    public function testPremiumPlan(): void
    {
            $this->assertSame(LoyaltyPointsCalculator::$weekDayWage[date('N')], $this->calculator->getLoyaltyPointsMultiplier('premium'));
    }

    public function testPointsDefault(): void
    {
        for ($i = 1; $i <= 3; $i++) {
            $this->assertSame($i, $this->calculator->calculateLoyaltyPoints('default', $i));
        }
    }

    public function testPointsPremium(): void
    {
        $this->assertSame(8 * LoyaltyPointsCalculator::$weekDayWage[date('N')], $this->calculator->calculateLoyaltyPoints('premium', 8));
    }
}
