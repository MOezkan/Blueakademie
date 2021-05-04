USE [BlueAkademie]
GO


Create proc education.spEnrollment
(
	
	 @prmCourseID int
     ,@prmStudentID int 
	 ,@prmClassID int
)	
AS
BEGIN

INSERT INTO Education.tblEnrollment 
 (CourseID, StudentID, ClassID)

 VALUES (
  @prmCourseID
 ,@prmStudentID
 ,@prmClassID )

 END
