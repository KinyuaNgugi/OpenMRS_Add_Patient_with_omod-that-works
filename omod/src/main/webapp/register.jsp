<!DOCTYPE html>
<%@ include file="/WEB-INF/template/include.jsp"%>
<%@ include file="/WEB-INF/template/header.jsp"%>

<%@ include file="template/localHeader.jsp"%>

<%--<p>Hello ${user.systemId}!</p>--%>
<div class="row">
    <div class="jumbotron col-md-4 col-md-offset-4">



        <h2 class="text-center">Register a new patient</h2>
        <div class="form-group col-md-offset-2 col-md-8">
            <form role="form" action="<c:url value='/module/patientlist/register.form' />" method='get'>
                <div class="form-group">

                    First Name:
                    <br>
                    <input type="text" class="form-control" placeholder="first name" name="patient_first_name" size="30" required><br>
                    Middle Name:<br>
                    <input type="text" class="form-control" placeholder="middle name" name="patient_middle_name" size="30" required><br>
                    Family Name:<br>
                    <input type="text" class="form-control" placeholder="family name" name="patient_family_name" size="30" required><br>
                    National ID:<br>
                    <input type="text" class="form-control" placeholder="National ID" name="patient_openMRSId" size="30" required><br>
                    Address:<br>
                    <input type="text" class="form-control" placeholder="Address" name="patient_address" size="30" required><br>
                    Date OF Birth:<br>
                    <input type="date" class="form-control" placeholder="dd/mm/yyyy" name="patient_dob" size="30" required><br>
                    Gender:<br>
                    <select name="patient_gender" required >
                        <option >Select gender</option>
                        <option value="Male">Male</option>
                        <option value="Female">Female</option>

                    </select>
                    <br>
                    <br>

                    <input type="submit" class="btn btn-success" value="Register">
                </div>

            </form>
        </div>

<%@ include file="/WEB-INF/template/footer.jsp"%>