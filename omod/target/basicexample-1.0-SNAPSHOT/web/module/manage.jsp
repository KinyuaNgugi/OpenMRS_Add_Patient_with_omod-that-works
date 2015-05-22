<%@ include file="/WEB-INF/template/include.jsp"%>
<%@ include file="/WEB-INF/template/header.jsp"%>
<%@ include file="template/localHeader.jsp"%>

<div class ="row">

    <%--<p>Hello ${user.systemId}!</p>--%>
    <h2 class="text-center">List of All patients</h2>

    <table class="table table-striped" width="647">
        <thead>
        <tr class="success">
            <th>First Name</th>
            <th>Middle Name</th>
            <th>Family Name</th>
            <th>Age</th>
            <th>Gender</th>
            <th>Identifier</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach var="patient" items="${patientList}" varStatus="status">

            <tr>

                <td><a href="encounter.form?patientId=${patient.patientId}">${patient.givenName}</a></td>
                <td>${patient.middleName}</td>
                <td>${patient.familyName}</td>
                <td>${patient.age}</td>
                <td>${patient.gender}</td>
                <td>${patient.identifiers}</td>

            </tr>
        </c:forEach>
        </tbody>
    </table>
    <br>
    <br>


    <h2 class="text-center">Register a new patient</h2>
    <div class = "form-group col-md-offset-2 col-md-2">
        <form role="form" action="<c:url value='/module/patientlist/register.form' />" method='get'>

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
            Age:<br>
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

        </form>

    </div>
</div>
<%@ include file="/WEB-INF/template/footer.jsp"%>