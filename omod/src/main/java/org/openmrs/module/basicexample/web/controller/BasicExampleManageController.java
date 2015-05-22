/**
 * The contents of this file are subject to the OpenMRS Public License
 * Version 1.0 (the "License"); you may not use this file except in
 * compliance with the License. You may obtain a copy of the License at
 * http://license.openmrs.org
 *
 * Software distributed under the License is distributed on an "AS IS"
 * basis, WITHOUT WARRANTY OF ANY KIND, either express or implied. See the
 * License for the specific language governing rights and limitations
 * under the License.
 *
 * Copyright (C) OpenMRS, LLC.  All Rights Reserved.
 */
package org.openmrs.module.basicexample.web.controller;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.openmrs.*;
import org.openmrs.api.context.Context;
import org.openmrs.web.WebConstants;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpSession;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

/**
 * The main controller.
 */
@Controller
public class  BasicExampleManageController {
	
	protected final Log log = LogFactory.getLog(getClass());
	
	@RequestMapping(value = "/module/basicexample/manage", method = RequestMethod.GET)
	public void manage(ModelMap model) {
		//model.addAttribute("user", Context.getAuthenticatedUser());
		List<Patient> allPatients = Context.getPatientService().getAllPatients();
		model.addAttribute("patientList", allPatients);
	}

    @RequestMapping(value = "/module/patientlist/register.form", method = RequestMethod.GET)
    public String registrationform(HttpSession httpSession,
                                 @RequestParam(value = "patient_first_name", required = false) String first_name,
                                 @RequestParam(value = "patient_middle_name", required = false) String middle_name,
                                 @RequestParam(value = "patient_family_name", required = false) String family_name,
                                 @RequestParam(value = "patient_openMRSId", required = false) String openMRSId,
                                 @RequestParam(value = "patient_address", required = false) String address,
                                 @RequestParam(value = "patient_dob", required = false) String dob,
                                 @RequestParam(value = "patient_gender", required = false) String gender
    ) {
        int id = Integer.parseInt(openMRSId);//converting to int

        String expectedPattern = "dd/MM/yyyy";
        SimpleDateFormat formatter = new SimpleDateFormat(expectedPattern);
        try {
            // give the formatter a String that matches the SimpleDateFormat pattern
            Date date = formatter.parse(dob);


            Patient patient = new Patient();
            PersonName personName = new PersonName();
            PersonAddress personAddress = new PersonAddress();

            PatientIdentifier patientIdentifier = new PatientIdentifier();
            PatientIdentifierType patientIdentifierType = Context.getPatientService().getPatientIdentifierTypeByUuid("8d79403a-c2cc-11de-8d13-0010c6dffd0f");
            patientIdentifier.setDateCreated(new Date());
            patientIdentifier.setIdentifierType(patientIdentifierType);
            patientIdentifier.setLocation(Context.getLocationService().getDefaultLocation());
            patientIdentifier.setIdentifier(String.valueOf(id));
            patientIdentifier.setPreferred(true);

			/*patientIdentifier.setPatientIdentifierId(id);*/


            personName.setGivenName(first_name);
            personName.setMiddleName(middle_name);
            personName.setFamilyName(family_name);


            personAddress.setAddress1(address);

            patient.addAddress(personAddress);
            patient.addName(personName);
            patient.setBirthdate(date);
            patient.addIdentifier(patientIdentifier);
            patient.setGender(gender);
            Context.getPatientService().savePatient(patient);
            httpSession.setAttribute(WebConstants.OPENMRS_MSG_ATTR, "Registered Successfully");
            return "redirect:manage.jsp";
        } catch (ParseException ex) {
            httpSession.setAttribute(WebConstants.OPENMRS_MSG_ATTR, ex.getLocalizedMessage());
            return "redirect:manage.form";
        }
    }
}