import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ChemicalEngineeringMassTransferFoundationCanonicalLaneLean

structure ConvectiveMassTransferPackage where
  velocityField : Type
  concentrationField : Type
  convectiveFlux : Type
  massTransportEquation : Prop
  boundaryLayerModel : Prop
  transportEquationClosed : massTransportEquation
  boundaryLayerClosed : boundaryLayerModel

structure ConvectiveMassTransferEvidence (C : ConvectiveMassTransferPackage) where
  transportEquationClosed : C.massTransportEquation
  boundaryLayerClosed : C.boundaryLayerModel

def ConvectiveMassTransferClosed (C : ConvectiveMassTransferPackage) : Prop :=
  C.massTransportEquation ∧ C.boundaryLayerModel

theorem convective_mass_transfer_closed_from_evidence
    (C : ConvectiveMassTransferPackage)
    (E : ConvectiveMassTransferEvidence C) : ConvectiveMassTransferClosed C := by
  exact And.intro E.transportEquationClosed E.boundaryLayerClosed

end ChemicalEngineeringMassTransferFoundationCanonicalLaneLean
end HautevilleHouse