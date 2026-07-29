import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ChemicalEngineeringMassTransferFoundationCanonicalLaneLean

def ConstrainedMassTransferClosure (A : AdmissibleClass) : Prop :=
  bridgeClosed A ∧ gateClosed A

theorem constrained_mass_transfer_endgame (A : AdmissibleClass) :
    ConstrainedMassTransferClosure A := by
  exact And.intro (bridge_from_admissible_class A) (gate_from_admissible_class A)

end ChemicalEngineeringMassTransferFoundationCanonicalLaneLean
end HautevilleHouse