import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ChemicalEngineeringMassTransferFoundationCanonicalLaneLean

structure ColumnDesignPackage where
  packingType : String
  columnDiameter : ℝ
  heightEquivalentToTheoreticalPlate : Prop
  pressureDropModel : Prop
  floodingCorrelation : Prop

structure ColumnDesignEvidence (C : ColumnDesignPackage) where
  heightEquivalentToTheoreticalPlateClosed : C.heightEquivalentToTheoreticalPlate
  pressureDropModelClosed : C.pressureDropModel
  floodingCorrelationClosed : C.floodingCorrelation

def ColumnDesignClosed (C : ColumnDesignPackage) : Prop :=
  C.heightEquivalentToTheoreticalPlate ∧ C.pressureDropModel ∧ C.floodingCorrelation

theorem column_design_closed_from_evidence (C : ColumnDesignPackage) (E : ColumnDesignEvidence C) :
    ColumnDesignClosed C := by
  exact And.intro E.heightEquivalentToTheoreticalPlateClosed (And.intro E.pressureDropModelClosed E.floodingCorrelationClosed)

end ChemicalEngineeringMassTransferFoundationCanonicalLaneLean
end HautevilleHouse