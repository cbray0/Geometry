//Building the CZT detector total 50x50x4 cm

///// Uncomment these lines to run standalone 
//SurroundingSphere 100.0 0.0 0.0 0.0 100.0
//Include ../materials/Materials.geo
/////

Include CalorimeterCZTLogLayer.geo

//Building single layer of 1 segment, 40x40x4.2 cm
Volume CZTLayer
CZTLayer.Material Vacuum
CZTLayer.Visibility 0
CZTLayer.Shape BRIK 20.0 20.0 2.1

// Put the CZT segments into the layer
For I 8 -17.5 5.
    For J 8 -17.5 5.
    	CZTSegment.Copy CZTSegment_%I_%J
    	CZTSegment_%I_%J.Position $I $J 0.0
    	CZTSegment_%I_%J.Mother CZTLayer
    Done
Done

//Adds the segment to build the detector
Volume CZTLogDetector
CZTLogDetector.Material Vacuum
CZTLogDetector.Visibility 0
CZTLogDetector.Shape BRIK 20.0 20.0 2.1
// Include this to run in stand-alone
//CZTLogDetector.Mother 0

CZTLayer.Mother CZTLogDetector

//The side layer is the same as the segment in this geometry
Volume CZTSideLayer
CZTSideLayer.Material Vacuum
CZTSideLayer.Visibility 1
CSTSideLayer.Color 2
CZTSideLayer.Shape BRIK 19.5 2.25 0.4
// Include this to run in stand-alone
//CZTSideLayer.Mother 0

CZTSideSegment.Mother CZTSideLayer

