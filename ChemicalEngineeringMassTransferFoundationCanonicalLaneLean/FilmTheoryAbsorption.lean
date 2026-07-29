import HautevilleHouse.ChemicalEngineeringMassTransferFoundationCanonicalLaneLean.FickDiffusionPDE

namespace HautevilleHouse
namespace ChemicalEngineeringMassTransferFoundationCanonicalLaneLean

structure FilmTheoryAbsorptionPackage {F : FickDiffusionPDEPackage} where
  filmThickness : Prop
  interfacialConcentration : Prop
  massTransferCoefficient : Prop
  fluxExpression : Prop

structure FilmTheoryAbsorptionEvidence {F : FickDiffusionPDEPackage}
    (A : FilmTheoryAbsorptionPackage F) where
  filmThicknessClosed : A.filmThickness
  interfacialConcentrationClosed : A.interfacialConcentration
  massTransferCoefficientClosed : A.massTransferCoefficient
  fluxExpressionClosed : A.fluxExpression

def FilmTheoryAbsorptionClosed {F : FickDiffusionPDEPackage}
    (A : FilmTheoryAbsorptionPackage F) : Prop :=
  A.filmThickness ∧ A.interfacialConcentration ∧
  A.massTransferCoefficient ∧ A.fluxExpression

theorem film_theory_absorption_closed_from_evidence
    {F : FickDiffusionPDEPackage} (A : FilmTheoryAbsorptionPackage F)
    (E : FilmTheoryAbsorptionEvidence A) : FilmTheoryAbsorptionClosed A := by
  exact And.intro E.filmThicknessClosed
    (And.intro E.interfacialConcentrationClosed
      (And.intro E.massTransferCoefficientClosed E.fluxExpressionClosed))

end ChemicalEngineeringMassTransferFoundationCanonicalLaneLean
end HautevilleHouse
