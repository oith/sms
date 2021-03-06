<%@ page contentType='text/html; charset=UTF-8' language='java' %>

<%@ taglib prefix='c' uri='http://java.sun.com/jsp/jstl/core' %>
<%@ taglib prefix='spring' uri='http://www.springframework.org/tags' %>
<%@ taglib prefix='form' uri='http://www.springframework.org/tags/form' %>

<style>
    .error {
        color: #ff0000;
    }
    .errorblock {
        color: #000;
        background-color: #ffEEEE;
        border: 3px solid #ff0000;
        padding: 8px;
        margin: 16px;
    }
</style>

<script type='text/javascript'>
    function getCodableDTOAdmProcess(code, lblCaption){
        $.ajax({
            type : 'GET',
            url: '${pageContext.request.contextPath}/admProcess/getCodableDTO',
            data: {code: code},
            success: function(d) {
                //alert('ok:'+d)
                $('#'+lblCaption).text(d)
            },
            error: function(err) {
                //alert('err mac:'+err)
                $('#'+lblCaption).text(err)
            }
        });
    }
</script>

<form:errors path='*' cssClass='errorblock' element='div' />
<form:hidden path='id'/>
<div>  
    <div class='col-xs-12 col-sm-6 col-md-4 col-lg-3'>
        <div class='form-group'>
            <form:label path='slNo'><spring:message code='slNo' text='Sl No'/></form:label>
            <form:input class='form-control' path='slNo' type='number' size='15' maxlength='15'/>
            <form:errors path='slNo' cssClass='error' element='div'/>
        </div>
    </div>
    <div class='col-xs-12 col-sm-6 col-md-4 col-lg-3'>
        <div class='form-group'>
            <form:label class='required' path='admProcess'><spring:message code='admProcess' text='Adm Process'/></form:label>
            <form:input class='form-control' path='admProcess.code' required='true' onkeyup='getCodableDTOAdmProcess(this.value,"admProcess_caption")' type='text' size='8'/>
            <label id='admProcess_caption'>${admProcessDetail.admProcess.fullName}</label>
            <form:errors path='admProcess' cssClass='error' element='div'/>
        </div>
    </div>
    <div class='col-xs-12 col-sm-6 col-md-4 col-lg-3'>
        <div class='form-group'>
            <form:label class='required' path='admParam'><spring:message code='admParam' text='Adm Param'/></form:label>
            <form:select class='form-control' path='admParam.id' name='admParam' id='admParam' required='true' >
                <form:options items='${admParams}' itemValue='id'/>
            </form:select>
            <form:errors path='admParam' cssClass='error' element='div'/>
        </div>
    </div>
    <div class='col-xs-12 col-sm-6 col-md-4 col-lg-3'>
        <div class='form-group'>
            <form:label class='required' path='admZoneType'><spring:message code='admZoneType' text='Adm Zone Type'/></form:label>
            <form:select class='form-control' path='admZoneType' name='admZoneType' id='admZoneType' required='true' >
                <form:option value='SEARCH' label='SEARCH'/>
                <form:option value='PARAM_FIXED' label='PARAM FIXED'/>
                <form:option value='PARAM_QU' label='PARAM QU'/>
                <form:option value='PROCESS_BTN' label='PROCESS BTN'/>
            </form:select>
            <form:errors path='admZoneType' cssClass='error' element='div'/>
        </div>
    </div>

</div>   