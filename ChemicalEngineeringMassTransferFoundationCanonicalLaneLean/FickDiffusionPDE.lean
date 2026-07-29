import HautevilleHouse.ChemicalEngineeringMassTransferFoundationCanonicalLaneLean.MassTransferAdmissibleClass

namespace HautevilleHouse
namespace ChemicalEngineeringMassTransferFoundationCanonicalLaneLean

structure FickDiffusionPDEPackage where
  concentration : Type
  spatialDomain : Type
  diffusivityCoefficient : Prop
  fluxLaw : Prop
  boundaryConditions : Prop

structure FickDiffusionPDEEvidence (F : FickDiffusionPDEPackage) where
  diffusivityCoefficientClosed : F.diffusivityCoefficient
  fluxLawClosed : F.fluxLaw
  boundaryConditionsClosed : F.boundaryConditions

def FickDiffusionPDEClosed (F : FickDiffusionPDEPackage) : Prop :=
  F.diffusivityCoefficient ∧ F.fluxLaw ∧ F.boundaryConditions

theorem fick_diffusion_pde_closed_from_evidence (F : FickDiffusionPDEPackage)
    (E : FickDiffusionPDEEvidence F) : FickDiffusionPDEClosed F := by
  exact And.intro E.diffusivityCoefficientClosed
    (And.intro E.fluxLawClosed E.boundaryConditionsClosed)

end ChemicalEngineeringMassTransferFoundationCanonicalLaneLean
end HautevilleHouse
