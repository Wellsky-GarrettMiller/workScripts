/*

SELECT E.EpisodeKey
     , CONVERT( VARCHAR(10) , E.StartDate       , 101 ) 'StartDate'
     , CONVERT( VARCHAR(10) , E.EndDate         , 101 ) 'EndDate'
     , E.Active
     , E.fClinicBranchKey
     , A.AdmissionKey
     , CONVERT( VARCHAR(10) , A.StartOfCare     , 101 ) 'StartOfCare'
     , CONVERT( VARCHAR(10) , A.AdmissionDate   , 101 ) 'AdmissionDate'
     , CONVERT( VARCHAR(10) , A.DischargeDate   , 101 ) 'DischargeDate'
     , CONVERT( VARCHAR(10) , A.EndDate         , 101 ) 'EndDate'
     , A.Active
     , P.PatientKey
     , P.FirstName
     , P.LastName
        FROM Episode   E WITH (NOLOCK)
        JOIN Admission A WITH (NOLOCK) ON A.AdmissionKey = E.fAdmissionKey
        JOIN Patient   P WITH (NOLOCK) ON P.PatientKey   = A.fPatientKey
    WHERE P.PatientKey = 12628170
  ORDER BY 1

*/

SELECT *
    INTO FogBugz_SQLAdmin.dbo.Update_Episode_00813172  --Update
        FROM Episode
    WHERE EpisodeKey IN (13167218,13586029,14003623,14524308,16436051)

/*

BEGIN TRAN

UPDATE Episode
        SET fAdmissionKey = 7759206
    FROM Episode a
    JOIN FogBugz_SQLAdmin.dbo.Update_Episode_00813172 b --Update
        ON a.EpisodeKey = b.EpisodeKey

*/

-- COMMIT
-- ROLLBACK
