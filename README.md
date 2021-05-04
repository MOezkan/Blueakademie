# BlueAkademieDBR
LOGICAL WORK FLOW ORDER
1-Course is created.
  tblCourse (sp_CourseCreate)

2-The program is created.
  tblProgramm (sp_ProgrammCreate)

3-Class is created.
  tblClass (sp_ClassCreate)

4-Student is created.
  tblStudent (sp_StudentInsert)

5-Student is registered.
  tblEnrollment (sp_EnrollmentInsert)

6-Incoming payments are recorded in the payment table.
  tblPayment (sp_PaymentInsert)

7-Invoice is created.
  tblInvoice (sp_InvoiceCreate)

  
* History (H) Files for deleted/inserted/updated informations.
