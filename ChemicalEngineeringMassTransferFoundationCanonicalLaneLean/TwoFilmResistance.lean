import HautevilleHouse.ChemicalEngineeringMassTransferFoundationCanonicalLaneLean.FilmTheoryAbsorption

namespace HautevilleHouse
namespace ChemicalEngineeringMassTransferFoundationCanonicalLaneLean

structure TwoFilmResistancePackage {F : FickDiffusionPDEPackage}
    (A : FilmTheoryAbsorptionPackage F) where
  gasFilmCoefficient : Prop
  liquidFilmCoefficient : Prop
  overallMassTransferCoefficient : Prop
  interfaceEquilibrium : Prop

structure TwoFilmResistanceEvidence {F : FickDiffusionPDEPackage}
    {A : FilmTheoryAbsorptionPackage F} (T : TwoFilmResistancePackage A) where
  gasFilmCoefficientClosed : T.gasFilmCoefficient
  liquidFilmCoefficientClosed : T.liquidFilmCoefficient
  overallMassTransferCoefficientClosed : T.overallMassTransferCoefficient
  interfaceEquilibriumClosed : T.interfaceEquilibrium

def TwoFilmResistanceClosed {F : FickDiffusionPDEPackage}
    {A : FilmTheoryAbsorptionPackage F} (T : TwoFilmResistancePackage A) : Prop :=
  T.gasFilmCoefficient ∧ T.liquidFilmCoefficient ∧
  T.overallMassTransferCoefficient ∧ T.interfaceEquilibrium

theorem two_film_resistance_closed_from_evidence
    {F : FickDiffusionPDEPackage} {A : FilmTheoryAbsorptionPackage F}
    (T : TwoFilmResistancePackage A) (E : TwoFilmResistanceEvidence T) :
    TwoFilmResistanceClosed T := by
  exact And.intro E.gasFilmCoefficientClosed
    (And.intro E.liquidFilmCoefficientClosed
      (And.intro E.overallMassTransferCoefficientClosed E.interfaceEquilibriumClosed))

end ChemicalEngineeringMassTransferFoundationCanonicalLaneLean
end HautevilleHouse
