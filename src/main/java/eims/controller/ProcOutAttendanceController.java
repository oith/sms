package eims.controller;

import eims.model.acad.ProcOutAttendance;
import eims.dto._SearchDTO;
import eims.exception.ProcOutAttendanceNotFoundException;
import eims.service.ProcOutAttendanceService;
import eims.service.StudentService;
import eims.model.acad.Student;
import eims.service.ProcOutCourseScheduleService;
import eims.model.acad.ProcOutCourseSchedule;

import java.util.ArrayList;
import java.util.List;
import java.util.LinkedHashSet;
import java.util.Set;
import java.math.BigInteger;
import javax.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
@RequestMapping(value = "/procOutAttendance")
@SessionAttributes({"students","procOutCourseSchedules"}) 
public class ProcOutAttendanceController extends _OithController {

    protected static final String MODEL = "procOutAttendance";
    
    protected static final String MODELS = MODEL + "s";
    protected static final String INDEX = MODEL + "/index";
    protected static final String CREATE = MODEL + "/create";
    protected static final String EDIT = MODEL + "/edit";
    protected static final String COPY = MODEL + "/copy";
    protected static final String SHOW = MODEL + "/show";

    @Autowired
    private ProcOutAttendanceService procOutAttendanceService;

    @Autowired
    private StudentService studentService;
    @Autowired
    private ProcOutCourseScheduleService procOutCourseScheduleService;




    @ModelAttribute("students")
    public Iterable<Student> students() {
        return studentService.findAll();
    }
    @ModelAttribute("procOutCourseSchedules")
    public Iterable<ProcOutCourseSchedule> procOutCourseSchedules() {
        return procOutCourseScheduleService.findAll();
    }
 

    private void commonPost(ProcOutAttendance currObject) {
            try {
                currObject.setStudent(studentService.findById(currObject.getStudent().getId()));
            } catch (Exception exp) {
                currObject.setStudent(null);
            }
            try {
                currObject.setProcOutCourseSchedule(procOutCourseScheduleService.findById(currObject.getProcOutCourseSchedule().getId()));
            } catch (Exception exp) {
                currObject.setProcOutCourseSchedule(null);
            }

    }

    @RequestMapping(value = "/create", method = RequestMethod.GET)
    public String create(ModelMap model) { 
        model.addAttribute(MODEL, new ProcOutAttendance());
        return CREATE;
    }

    @RequestMapping(value = "/create", method = RequestMethod.POST)
    public String save(@ModelAttribute(MODEL) @Valid ProcOutAttendance currObject, BindingResult bindingResult, ModelMap model, RedirectAttributes attributes ) {



    commonPost(currObject);

        if (!bindingResult.hasErrors()) {
            try {
                ProcOutAttendance procOutAttendance = procOutAttendanceService.create(currObject);
                addFeedbackMessage(attributes, FEEDBACK_MESSAGE_KEY_CREATED, procOutAttendance.getId());
                return "redirect:/" + SHOW + "/" + procOutAttendance.getId();
            } catch (Exception e) {
                errorHandler(bindingResult, e);
            }
        } 
        return CREATE;
    }

    @RequestMapping(value = "/edit/{id}", method = RequestMethod.GET)
    public String edit(@PathVariable("id") BigInteger id, ModelMap model, RedirectAttributes attributes) {
       
        ProcOutAttendance procOutAttendance = procOutAttendanceService.findById(id);
        
        if (procOutAttendance == null) {
            addErrorMessage(attributes, ERROR_MESSAGE_KEY_EDITED_WAS_NOT_FOUND);
            return createRedirectViewPath(REQUEST_MAPPING_LIST);
        }
        model.addAttribute(MODEL, procOutAttendance);
        return EDIT;
    }

    @RequestMapping(value = "/edit", method = RequestMethod.POST)
    public String update(@ModelAttribute(MODEL) @Valid ProcOutAttendance currObject, BindingResult bindingResult, ModelMap model, RedirectAttributes attributes ) {



    commonPost(currObject);

        if (!bindingResult.hasErrors()){
            try {
                ProcOutAttendance procOutAttendance = procOutAttendanceService.update(currObject);
                addFeedbackMessage(attributes, FEEDBACK_MESSAGE_KEY_EDITED, procOutAttendance.getId());
                return "redirect:/" + SHOW + "/" + procOutAttendance.getId();
            } catch (Exception e) {
                errorHandler(bindingResult, e);
            }
        }
        return EDIT;
    }
    
    @RequestMapping(value = "/copy/{id}", method = RequestMethod.GET)
    public String copy(@PathVariable("id") BigInteger id, ModelMap model, RedirectAttributes attributes) {

        ProcOutAttendance procOutAttendance = procOutAttendanceService.findById(id);

        if (procOutAttendance == null) {
            addErrorMessage(attributes, ERROR_MESSAGE_KEY_EDITED_WAS_NOT_FOUND);
            return createRedirectViewPath(REQUEST_MAPPING_LIST);
        }
        model.addAttribute(MODEL, procOutAttendance);
        return COPY;
    }

    @RequestMapping(value = "/copy", method = RequestMethod.POST)
    public String copied(@ModelAttribute(MODEL) @Valid ProcOutAttendance currObject, BindingResult bindingResult, ModelMap model, RedirectAttributes attributes ) {



    commonPost(currObject);

        if (!bindingResult.hasErrors()) {
            try {
               ProcOutAttendance procOutAttendance = procOutAttendanceService.copy(currObject);
               addFeedbackMessage(attributes, FEEDBACK_MESSAGE_KEY_EDITED, procOutAttendance.getId());
               return "redirect:/" + SHOW + "/" + procOutAttendance.getId();
            } catch (Exception e) {
               errorHandler(bindingResult, e);
            }
        } 
        return COPY;
    }
    
    @RequestMapping(value = {"/", "/index"}, method = RequestMethod.POST)
    public String search(@ModelAttribute(SEARCH_CRITERIA) _SearchDTO searchCriteria, ModelMap model) {
        /*
        String searchTerm = searchCriteria.getSearchTerm();
        List<ProcOutAttendance> procOutAttendances;
   
        if (searchTerm != null && !searchTerm.trim().isEmpty()) {
            procOutAttendances = procOutAttendanceService.search(searchCriteria);
        } else {
            procOutAttendances = procOutAttendanceService.findAll(searchCriteria);
        }
        model.addAttribute(MODELS, procOutAttendances);
        model.addAttribute(SEARCH_CRITERIA, searchCriteria);
        
        List<Integer> pages = new ArrayList<>();
        for (int i = 1; i <= searchCriteria.getTotalPages(); i++) {
            pages.add(i);
        }
        model.addAttribute("pages", pages);
        */
        Iterable<ProcOutAttendance> procOutAttendances = procOutAttendanceService.findAll();
        model.addAttribute(MODELS, procOutAttendances);
        return INDEX;
    }

    @RequestMapping(value = {"/", "/index"}, method = RequestMethod.GET)
    public String index(ModelMap model) {
        /*_SearchDTO searchCriteria = new _SearchDTO();
        searchCriteria.setPage(1);
        searchCriteria.setPageSize(5);
        
        List<ProcOutAttendance> procOutAttendances = procOutAttendanceService.findAll(searchCriteria);

        model.addAttribute(MODELS, procOutAttendances);
        model.addAttribute(SEARCH_CRITERIA, searchCriteria);
    
        List<Integer> pages = new ArrayList<>();
        for (int i = 1; i <= searchCriteria.getTotalPages(); i++) {
            pages.add(i);
        }
        model.addAttribute("pages", pages);
        */
        Iterable<ProcOutAttendance> procOutAttendances = procOutAttendanceService.findAll();
        model.addAttribute(MODELS, procOutAttendances);
        return INDEX;
    }

    @RequestMapping(value = "/show/{id}", method = RequestMethod.GET)
    public String show(@PathVariable("id") BigInteger id, ModelMap model, RedirectAttributes attributes) {
       
        ProcOutAttendance procOutAttendance = procOutAttendanceService.findById(id);

        if (procOutAttendance == null) {
            addErrorMessage(attributes, ERROR_MESSAGE_KEY_EDITED_WAS_NOT_FOUND);
            return createRedirectViewPath(REQUEST_MAPPING_LIST);
        }
        model.addAttribute(MODEL, procOutAttendance);
        return SHOW;
    }

    @RequestMapping(value = "/delete/{id}", method = RequestMethod.GET)
    public String delete(@PathVariable("id") BigInteger id, RedirectAttributes attributes) {
       
        try {
            ProcOutAttendance deleted = procOutAttendanceService.delete(id);
            addFeedbackMessage(attributes, FEEDBACK_MESSAGE_KEY_DELETED, deleted.getId());
        } catch (ProcOutAttendanceNotFoundException e) {
            addErrorMessage(attributes, ERROR_MESSAGE_KEY_DELETED_WAS_NOT_FOUND);
        }
        return "redirect:/" + INDEX;
    }
}
