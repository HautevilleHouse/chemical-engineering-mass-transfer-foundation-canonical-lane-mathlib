import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ChemicalEngineeringMassTransferFoundationCanonicalLaneLean

structure ChemicalAdmittedObject where
  componentSystem : Type
  concentrationField : Type
  diffusiveFlux : Type
  massConservation : Prop
  fickFirstLaw : Prop
  massConservationTerm : massConservation
  fickFirstLawTerm : fickFirstLaw

structure AdmissibleClass where
  object : ChemicalAdmittedObject
  endpointSatisfied : Prop
  remainderRecorded : Prop
  gateWitness : endpointSatisfied ∨ remainderRecorded

def admittedClosure (A : AdmissibleClass) : Prop :=
  ChemicalWitnessClosed A.object ∧ (A.endpointSatisfied ∨ A.remainderRecorded)

def ChemicalWitnessClosed (O : ChemicalAdmittedObject) : Prop :=
  O.massConservation ∧ O.fickFirstLaw

end ChemicalEngineeringMassTransferFoundationCanonicalLaneLean
end HautevilleHouse