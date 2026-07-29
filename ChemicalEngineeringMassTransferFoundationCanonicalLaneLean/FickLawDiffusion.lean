import HautevilleHouse.ChemicalEngineeringMassTransferFoundationCanonicalLaneLean.MassTransferAdmissibleClass

namespace HautevilleHouse
namespace ChemicalEngineeringMassTransferFoundationCanonicalLaneLean

structure FickLawPackage {A : AdmittedMassTransferObject} where
  concentrationField : Type u
  diffusivity : Type v
  molarFlux : Type w
  fickFirstLaw : Prop
  fickSecondLaw : Prop
  boundaryConditions : Prop

structure FickLawEvidence {A : AdmittedMassTransferObject} (F : FickLawPackage A) where
  fickFirstLawClosed : F.fickFirstLaw
  fickSecondLawClosed : F.fickSecondLaw
  boundaryConditionsClosed : F.boundaryConditions

def FickLawClosed {A : AdmittedMassTransferObject} (F : FickLawPackage A) : Prop :=
  F.fickFirstLaw ∧ F.fickSecondLaw ∧ F.boundaryConditions

theorem fick_law_closed_from_evidence
    {A : AdmittedMassTransferObject} (F : FickLawPackage A) (E : FickLawEvidence F) :
    FickLawClosed F := by
  exact And.intro E.fickFirstLawClosed (And.intro E.fickSecondLawClosed E.boundaryConditionsClosed)

end ChemicalEngineeringMassTransferFoundationCanonicalLaneLean
end HautevilleHouse