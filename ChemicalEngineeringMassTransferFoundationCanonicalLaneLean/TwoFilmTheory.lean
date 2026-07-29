import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ChemicalEngineeringMassTransferFoundationCanonicalLaneLean

structure TwoFilmTheoryPackage {F : FickDiffusionPackage} {C : ConvectiveMassTransferPackage F} {M : MassTransferCoefficientPackage C} where
  interfaceEquilibrium : Prop
  filmResistances : Prop
  overallCoefficient : Prop
  twoFilmModelDerived : Prop

structure TwoFilmTheoryEvidence {F : FickDiffusionPackage} {C : ConvectiveMassTransferPackage F} {M : MassTransferCoefficientPackage C}
    (T : TwoFilmTheoryPackage F C M) where
  interfaceEquilibriumClosed : T.interfaceEquilibrium
  filmResistancesClosed : T.filmResistances
  overallCoefficientClosed : T.overallCoefficient
  twoFilmModelDerivedClosed : T.twoFilmModelDerived

def TwoFilmTheoryClosed {F : FickDiffusionPackage} {C : ConvectiveMassTransferPackage F} {M : MassTransferCoefficientPackage C}
    (T : TwoFilmTheoryPackage F C M) : Prop :=
  T.interfaceEquilibrium ∧ T.filmResistances ∧ T.overallCoefficient ∧ T.twoFilmModelDerived

theorem two_film_theory_closed_from_evidence
    {F : FickDiffusionPackage} {C : ConvectiveMassTransferPackage F} {M : MassTransferCoefficientPackage C}
    (T : TwoFilmTheoryPackage F C M) (E : TwoFilmTheoryEvidence T) : TwoFilmTheoryClosed T := by
  exact And.intro E.interfaceEquilibriumClosed (And.intro E.filmResistancesClosed (And.intro E.overallCoefficientClosed E.twoFilmModelDerivedClosed))

end ChemicalEngineeringMassTransferFoundationCanonicalLaneLean
end HautevilleHouse
