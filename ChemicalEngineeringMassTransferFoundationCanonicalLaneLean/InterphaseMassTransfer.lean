import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ChemicalEngineeringMassTransferFoundationCanonicalLaneLean

structure InterphaseMassTransferPackage where
  phaseInterface : Type
  twoFilmModel : Prop
  overallMassTransferCoefficient : Type
  twoFilmModelValid : twoFilmModel
  overallCoefficientDefined : Prop
  overallCoefficientTerm : overallCoefficientDefined

structure InterphaseMassTransferEvidence (I : InterphaseMassTransferPackage) where
  twoFilmModelClosed : I.twoFilmModelValid
  overallCoefficientClosed : I.overallCoefficientDefined

def InterphaseMassTransferClosed (I : InterphaseMassTransferPackage) : Prop :=
  I.twoFilmModel ∧ I.overallCoefficientDefined

theorem interphase_mass_transfer_closed_from_evidence
    (I : InterphaseMassTransferPackage)
    (E : InterphaseMassTransferEvidence I) : InterphaseMassTransferClosed I := by
  exact And.intro E.twoFilmModelClosed E.overallCoefficientClosed

end ChemicalEngineeringMassTransferFoundationCanonicalLaneLean
end HautevilleHouse