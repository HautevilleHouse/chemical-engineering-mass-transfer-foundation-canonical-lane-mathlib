import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ChemicalEngineeringMassTransferFoundationCanonicalLaneLean

def bridgeClosed (A : AdmissibleClass) : Prop :=
  ChemicalWitnessClosed A.object

theorem bridge_from_admissible_class (A : AdmissibleClass) :
    bridgeClosed A := by
  exact A.object.massConservationTerm.and A.object.fickFirstLawTerm

end ChemicalEngineeringMassTransferFoundationCanonicalLaneLean
end HautevilleHouse