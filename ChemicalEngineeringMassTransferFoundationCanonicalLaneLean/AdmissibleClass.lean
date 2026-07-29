import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ChemicalEngineeringMassTransferFoundationCanonicalLaneLean

structure ChemEngMassTransferAdmittedObject where
  fickDiffusion : FickDiffusionPackage
  convectiveMassTransfer : ConvectiveMassTransferPackage fickDiffusion
  massTransferCoefficient : MassTransferCoefficientPackage convectiveMassTransfer
  twoFilmTheory : TwoFilmTheoryPackage fickDiffusion convectiveMassTransfer massTransferCoefficient
  overallMassTransferClosed : Prop
  conclusion : overallMassTransferClosed

structure AdmissibleClass where
  object : ChemEngMassTransferAdmittedObject
  endpointSatisfied : Prop
  remainderRecorded : Prop
  gateWitness : endpointSatisfied ∨ remainderRecorded

def admittedClosure (A : AdmissibleClass) : Prop :=
  A.object.conclusion ∧ (A.endpointSatisfied ∨ A.remainderRecorded)

end ChemicalEngineeringMassTransferFoundationCanonicalLaneLean
end HautevilleHouse
