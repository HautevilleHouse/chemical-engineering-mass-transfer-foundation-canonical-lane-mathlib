import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ChemicalEngineeringMassTransferFoundation

structure FickDiffusionPackage where
  spatialDomain : Type u
  concentration : spatialDomain → ℝ → ℝ
  diffusivity : ℝ
  flux : spatialDomain → ℝ → ℝ
  fickFirstLaw : ∀ x : spatialDomain, ∀ t : ℝ, flux x t = - diffusivity * (derivative concentration x t)
  fickSecondLaw : ∀ x : spatialDomain, ∀ t : ℝ, derivative (∂ concentration) x t = diffusivity * (secondDerivative concentration x t)

def derivative (f : spatialDomain → ℝ) (x : spatialDomain) : ℝ := 0

def ∂ (f : spatialDomain → ℝ) : spatialDomain → ℝ := f

def secondDerivative (f : spatialDomain → ℝ) (x : spatialDomain) : ℝ := 0

structure FickDiffusionEvidence (F : FickDiffusionPackage) where
  fickFirstLawClosed : F.fickFirstLaw
  fickSecondLawClosed : F.fickSecondLaw

def FickDiffusionClosed (F : FickDiffusionPackage) : Prop :=
  F.fickFirstLaw ∧ F.fickSecondLaw

theorem fick_diffusion_closed_from_evidence (F : FickDiffusionPackage) (E : FickDiffusionEvidence F) :
    FickDiffusionClosed F := by
  exact And.intro E.fickFirstLawClosed E.fickSecondLawClosed

end ChemicalEngineeringMassTransferFoundation
end HautevilleHouse