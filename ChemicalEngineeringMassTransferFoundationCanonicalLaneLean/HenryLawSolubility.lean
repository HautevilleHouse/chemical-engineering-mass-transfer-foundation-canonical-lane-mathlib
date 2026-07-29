import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ChemicalEngineeringMassTransferFoundation

structure HenryLawPackage where
  species : Type u
  solvent : Type v
  henryConstant : species → ℝ
  partialPressure : species → ℝ
  moleFraction : species → ℝ
  henryLawValid : ∀ s : species, moleFraction s = henryConstant s * partialPressure s
  temperatureControlled : Prop
  idealDiluteAssumption : Prop

structure HenryLawEvidence (H : HenryLawPackage) where
  henryLawValidClosed : H.henryLawValid
  temperatureControlledClosed : H.temperatureControlled
  idealDiluteAssumptionClosed : H.idealDiluteAssumption

def HenryLawClosed (H : HenryLawPackage) : Prop :=
  H.henryLawValid ∧ H.temperatureControlled ∧ H.idealDiluteAssumption

theorem henry_law_closed_from_evidence (H : HenryLawPackage) (E : HenryLawEvidence H) :
    HenryLawClosed H := by
  exact And.intro E.henryLawValidClosed
    (And.intro E.temperatureControlledClosed E.idealDiluteAssumptionClosed)

end ChemicalEngineeringMassTransferFoundation
end HautevilleHouse