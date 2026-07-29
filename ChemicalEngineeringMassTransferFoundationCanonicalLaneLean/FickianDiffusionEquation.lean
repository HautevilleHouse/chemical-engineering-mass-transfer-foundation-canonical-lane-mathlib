import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ChemicalEngineeringMassTransferFoundationCanonicalLaneLean

structure FickianDiffusionPackage where
  concentrationField : Type u
  diffusivity : Type v
  diffusionEquation : Prop
  boundaryConditions : Prop
  initialCondition : Prop

structure FickianDiffusionEvidence (F : FickianDiffusionPackage) where
  diffusionEquationClosed : F.diffusionEquation
  boundaryConditionsClosed : F.boundaryConditions
  initialConditionClosed : F.initialCondition

def FickianDiffusionClosed (F : FickianDiffusionPackage) : Prop :=
  F.diffusionEquation ∧ F.boundaryConditions ∧ F.initialCondition

theorem fickian_diffusion_closed_from_evidence (F : FickianDiffusionPackage) (E : FickianDiffusionEvidence F) :
    FickianDiffusionClosed F := by
  exact And.intro E.diffusionEquationClosed (And.intro E.boundaryConditionsClosed E.initialConditionClosed)

end ChemicalEngineeringMassTransferFoundationCanonicalLaneLean
end HautevilleHouse