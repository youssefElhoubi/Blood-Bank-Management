package com.example.bbm.enums;

import java.util.EnumSet;
import java.util.Set;

public enum BloodType {
    A_POSITIVE,
    A_NEGATIVE,
    B_POSITIVE,
    B_NEGATIVE,
    AB_POSITIVE,
    AB_NEGATIVE,
    O_POSITIVE,
    O_NEGATIVE;
    public Set<BloodType> getCompatibleDonors() {
        switch (this) {
            case A_POSITIVE:
                return EnumSet.of(A_POSITIVE, A_NEGATIVE, O_POSITIVE, O_NEGATIVE);
            case A_NEGATIVE:
                return EnumSet.of(A_NEGATIVE, O_NEGATIVE);
            case B_POSITIVE:
                return EnumSet.of(B_POSITIVE, B_NEGATIVE, O_POSITIVE, O_NEGATIVE);
            case B_NEGATIVE:
                return EnumSet.of(B_NEGATIVE, O_NEGATIVE);
            case AB_POSITIVE:
                // Universal recipient — can receive from all types
                return EnumSet.allOf(BloodType.class);
            case AB_NEGATIVE:
                return EnumSet.of(AB_NEGATIVE, A_NEGATIVE, B_NEGATIVE, O_NEGATIVE);
            case O_POSITIVE:
                return EnumSet.of(O_POSITIVE, O_NEGATIVE);
            case O_NEGATIVE:
                // Universal donor — can only receive from O-
                return EnumSet.of(O_NEGATIVE);
            default:
                return EnumSet.noneOf(BloodType.class);
        }
    }
}
