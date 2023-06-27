****************
/* STATA

	Assign non-compete status by state-year.

	Code assumes that the user's state-level data is already loaded. 

	Usage: do createCNCvars.do

	Steps:

	1.  Change the year and state variables to match your data
	2.  run `do createCNCvars.do

	Result: Creates 

	`cncChange` = {-1,1} for the direction of the change in the law
		-1 --> weak
		1 --> strong
	`note_LawChange' = Short desc. if debate or differ from Ewens and Marx

	Citation: Ewens, Michael, and Matt Marx. "Founder replacement and startup performance." 
	The Review of Financial Studies 31.4 (2017): 1532-1565.
	
	Contact: Michael Ewens, michael.ewens@gmail.com

	Last update: 11/12/2018

	Github: https://github.com/michaelewens/noncompete_law

*/
****************

	*****
	* CHANGE TO YOUR VARIABLE NAMES
	* State variable
	global stateVariable state
	* Year Variable
	global yearVariable year

	
*************
* BEGIN CODE

		* Default is .
		gen cncChange = .
		* Variable to hold notes
		gen note_LawChange = ""		

		* Alabama
 		replace cncChange = 1 if $stateVariable == "AL" & $yearVariable == 2016

		* Colorado
		replace cncChange = 1 if $stateVariable == "CO" & $yearVariable == 2011

		* Florida
		replace cncChange = 1 if $stateVariable == "FL" & $yearVariable == 1996
		
		* Georgia
		replace cncChange = 1 if $stateVariable == "GA" & $yearVariable == 2010
		
		* Idaho
		replace cncChange = 1 if $stateVariable == "ID" & $yearVariable == 2008

		* Illinois
		replace cncChange = 1 if $stateVariable == "IL" & $yearVariable == 2011

		 * Kentucky
		replace cncChange = -1 if $stateVariable == "KY" & $yearVariable == 2014

		* Lousiana
		replace cncChange = -1 if $stateVariable == "LA" & $yearVariable == 2002

		* New Hampshire
			* Another below
 		replace cncChange = -1 if $stateVariable == "NH" & $yearVariable == 2011
		
		* Ohio
 		replace cncChange = 1 if $stateVariable == "OH" & $yearVariable == 2004

		* Oregon
 		replace cncChange = -1 if $stateVariable == "OR" & $yearVariable == 2008

		* South Carolina
 		replace cncChange = -1 if $stateVariable == "SC" & $yearVariable == 2010
		
		* Texas
 		replace cncChange = 1 if $stateVariable == "TX" & $yearVariable == 2012

		* Vermont
 		replace cncChange = 1 if $stateVariable == "VT" & $yearVariable == 2005

		* Wisconsin
 		replace cncChange = 1 if $stateVariable == "WI" & $yearVariable == 2009

	

 		*----------------------------*
		* The following law changes were not used in Ewens and Marx for reasons specific to that research design.

		* Arkansas
 		replace cncChange = 1 if $stateVariable == "AR" & $yearVariable == 2016
 		replace note_LawChange = "Not used in Ewens and Marx (2017)" if $stateVariable == "AR" & $yearVariable == 2016

		* From Ewens and Marx: "[...] Hawaii’s 2015 reform, which banned non-compete agreements in the IT industry, was explicitly taken up in order to foster entrepreneurial activity."

		* Hawaii
		replace cncChange = -1 if $stateVariable == "HI" & $yearVariable == 2015
		replace note_LawChange = "From Ewens and Marx: '[...] Hawaii's 2015 reform, which banned non-compete agreements in the IT industry, was explicitly taken up in order to foster entrepreneurial activity.'" if $stateVariable == "HI" & $yearVariable == 2015


		
		* Michigan
		replace cncChange = 1 if $stateVariable == "MI" & $yearVariable == 1985
 		replace note_LawChange = "Not used in Ewens and Marx (2017)" if $stateVariable == "MI" & $yearVariable == 1985

		* MA
		replace cncChange = -1 if $stateVariable == "MA" & $yearVariable == 2018
 		replace note_LawChange = "Not used in Ewens and Marx (2017)" if $stateVariable == "MA" & $yearVariable == 2018

		* Montana
		replace cncChange = -1 if $stateVariable == "MT" & $yearVariable == 2009
 		replace note_LawChange = "Not used in Ewens and Marx (2017)" if $stateVariable == "MT" & $yearVariable == 2009
		
		* From Ewens and Marx: "New York and New Mexico also weakened enforceability of non-compete agreements 
		* during our sample. The New York reform was specific to workers in the broadcasting industry which is 
		* not highly relevant to venture capital activity. 
		
		* New York
		replace cncChange = -1 if $stateVariable == "NY" & $yearVariable == 1994
 		replace note_LawChange = "Not used in Ewens and Marx (2017).  'The New York reform was specific to workers in the broadcasting industry which is 
		not highly relevant to venture capital activity. '" if $stateVariable == "NY" & $yearVariable == 1994

		* Rhode Island (Only medical)
		replace cncChange = -1 if $stateVariable == "RI" & $yearVariable == 2016
 		replace note_LawChange = "Only impacted the medical industry. Not used in Ewens and Marx (2017)" if $stateVariable == "RI" & $yearVariable == 2016

		* New Hampshire (Medical)
		replace cncChange = -1 if $stateVariable == "NH" & $yearVariable == 2016
 		replace note_LawChange = "Only impacted the medical industry.  Not used in Ewens and Marx (2017)" if $stateVariable == "NH" & $yearVariable == 2016

		* Nevada
		* Removed June 2023: Golden mostly reaffirmed the reasonableness test (no change) but did curb the use of the nefarious “reformation” practice, 
		* so if anything it should be a slight weakening.  Also, this chnage was not used in the paper. 
		* replace cncChange = 1 if $stateVariable == "NV" & $yearVariable == 2016
		* replace note_LawChange = "Not used in Ewens and Marx (2017)" if $stateVariable == "NV" & $yearVariable == 2016

		* Idaho "ID 2016 is hard to classify. On the one hand, NDs are limited to 18 months; on the other hand, they are presumptively enforceable for executives."
		*replace cncChange = 1 if $stateVariable == "ID" & $yearVariable == 2016
	
		* CT (Medical)
		replace cncChange = 1 if $stateVariable == "CT" & $yearVariable == 2016
		replace note_LawChange = "Only medical. Not used in Ewens and Marx (2017)" if $stateVariable == "CT" & $yearVariable == 2016

		* Wisconsin
		replace cncChange = -1 if $stateVariable == "WI" & $yearVariable == 2015
		replace note_LawChange = "Not used in Ewens and Marx (2017)" if $stateVariable == "WI" & $yearVariable == 2015
		
		* Utah
		replace cncChange = -1 if $stateVariable == "UT" & $yearVariable == 2016
		replace note_LawChange = "Not used in Ewens and Marx (2017)" if $stateVariable == "UT" & $yearVariable == 2016
	
	**** END
	****************************
