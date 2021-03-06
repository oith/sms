<%@ page language='java' contentType='text/html; charset=UTF-8' pageEncoding='UTF-8'%>

<%@ taglib uri='http://tiles.apache.org/tags-tiles' prefix='tiles'%>
<%@ taglib uri='http://java.sun.com/jsp/jstl/core' prefix='c'%>
<%@ taglib uri='http://www.springframework.org/tags' prefix='spring'%>
<%@ taglib uri='http://java.sun.com/jsp/jstl/functions' prefix='fn'%>
<%@ taglib uri='http://java.sun.com/jsp/jstl/fmt' prefix='fmt'%>
<%@ taglib uri='http://www.springframework.org/tags/form' prefix='form'%>

<tiles:insertDefinition name='main' >

    <tiles:putAttribute name='body'>
        
        <div class='content-wrapper'><!-- Content Wrapper. Contains page content -->
            <section class='content-header'><!-- Content Header (Page header) -->
                <h1><spring:message code='default.button.show.label' text='Show'/> Adm Process</h1>
                <ul class='top-links'>
                    <sec:access url='/admProcess/create'>
                        <li>
                            <a href='${pageContext.request.contextPath}/admProcess/create' class='btn btn-block btn-primary btn-xs'><i class='fa fa-plus-circle'></i> <spring:message code='default.button.create.label' text='New'/></a>
                        </li>
                    </sec:access>
                    <sec:access url='/admProcess/index'>
                        <li>
                            <a href='${pageContext.request.contextPath}/admProcess/index' class='btn btn-block btn-info btn-xs'><i class='fa fa-reorder'></i> <spring:message code='default.button.list.label' text='List'/></a>
                        </li>
                    </sec:access>
                </ul>
            </section><!-- /.content-header -->

            <section class='content-messages'>
                <%--<jsp:include page='../layouts/_flashMessage.jsp'/>--%>
            </section><!-- /.flesh-message -->

            <section class='content'><!-- Main content -->
                <div class='box box-primary'>
                    <div class='box-body'>
                        <fieldset class='show-page'>
                             <form:hidden path='id'/>
        <ol class='property-list'>

        <c:if test='${admProcess.code!=null && !admProcess.code.isEmpty()}'>
            <li class='fieldcontain first_item'>
                <span id='title' class='property-label'>
                    <spring:message code='code' text='Code'/>: 
                </span>
                <span class='property-value' aria-labelledby='code'>
                    <c:out value='${admProcess.code}'/>
                </span>
            </li>
        </c:if>

        <c:if test='${admProcess.fullName!=null && !admProcess.fullName.isEmpty()}'>
            <li class='fieldcontain first_item'>
                <span id='title' class='property-label'>
                    <spring:message code='fullName' text='Full Name'/>: 
                </span>
                <span class='property-value' aria-labelledby='fullName'>
                    <c:out value='${admProcess.fullName}'/>
                </span>
            </li>
        </c:if>

        <c:if test='${admProcess.admModule!=null}'>
            <li class='fieldcontain first_item'>
                <span id='title' class='property-label'>
                    <spring:message code='admModule' text='Adm Module'/>: 
                </span>
                <span class='property-value' aria-labelledby='admModule'>
                    <c:out value='${admProcess.admModule!=null ? admProcess.admModule :"N/A"}'/>
                </span>
            </li>
        </c:if>

        <c:if test='${admProcess.query!=null && !admProcess.query.isEmpty()}'>
            <li class='fieldcontain first_item'>
                <span id='title' class='property-label'>
                    <spring:message code='query' text='Query'/>: 
                </span>
                <span class='property-value' aria-labelledby='query'>
                    <c:out value='${admProcess.query}'/>
                </span>
            </li>
        </c:if>

        <c:if test='${admProcess.queryAlias!=null && !admProcess.queryAlias.isEmpty()}'>
            <li class='fieldcontain first_item'>
                <span id='title' class='property-label'>
                    <spring:message code='queryAlias' text='Query Alias'/>: 
                </span>
                <span class='property-value' aria-labelledby='queryAlias'>
                    <c:out value='${admProcess.queryAlias}'/>
                </span>
            </li>
        </c:if>

        <c:if test='${admProcess.isActive!=null}'>
            <li class='fieldcontain first_item'>
                <span id='title' class='property-label'>
                    <spring:message code='isActive' text='Is Active'/>: 
                </span>
                <span class='property-value' aria-labelledby='isActive'>
                    <c:if test='${admProcess.isActive}'><spring:message code='default.boolean.true' text='YES'/></c:if><c:if test='${!admProcess.isActive}'><spring:message code='default.boolean.false' text='NO'/></c:if>
                </span>
            </li>
        </c:if>

        <c:if test='${admProcess.slNo!=null}'>
            <li class='fieldcontain first_item'>
                <span id='title' class='property-label'>
                    <spring:message code='slNo' text='Sl No'/>: 
                </span>
                <span class='property-value' aria-labelledby='slNo'>
                    <c:out value='${admProcess.slNo}'/>
                </span>
            </li>
        </c:if>

        <c:if test='${admProcess.paramSearchs!=null && !admProcess.paramSearchs.isEmpty()}'>
            <li class='fieldcontain first_item'>
                <span id='title' class='property-label'>
                    <spring:message code='paramSearchs' text='Param Searchs'/>: 
                </span>
                <span class='property-value' aria-labelledby='paramSearchs'>
                    <c:out value='${admProcess.paramSearchs}'/>
                </span>
            </li>
        </c:if>

        <c:if test='${admProcess.paramFixeds!=null && !admProcess.paramFixeds.isEmpty()}'>
            <li class='fieldcontain first_item'>
                <span id='title' class='property-label'>
                    <spring:message code='paramFixeds' text='Param Fixeds'/>: 
                </span>
                <span class='property-value' aria-labelledby='paramFixeds'>
                    <c:out value='${admProcess.paramFixeds}'/>
                </span>
            </li>
        </c:if>

        <c:if test='${admProcess.processBtns!=null && !admProcess.processBtns.isEmpty()}'>
            <li class='fieldcontain first_item'>
                <span id='title' class='property-label'>
                    <spring:message code='processBtns' text='Process Btns'/>: 
                </span>
                <span class='property-value' aria-labelledby='processBtns'>
                    <c:out value='${admProcess.processBtns}'/>
                </span>
            </li>
        </c:if>

        <c:if test='${admProcess.remarks!=null && !admProcess.remarks.isEmpty()}'>
            <li class='fieldcontain first_item'>
                <span id='title' class='property-label'>
                    <spring:message code='remarks' text='Remarks'/>: 
                </span>
                <span class='property-value' aria-labelledby='remarks'>
                    <c:out value='${admProcess.remarks}'/>
                </span>
            </li>
        </c:if>

        </ol>
    <div><jsp:include page='admProcessDetails.jsp' /></div>

    
      </fieldset>     <!--.show-page-->
                        </div>      <!--.box-body-->
    
                        <div class='box-footer'>
                            <a href='${pageContext.request.contextPath}/admProcess/edit/${admProcess.id}' class='btn btn-primary'><i class='fa fa-edit'></i> <spring:message code='edit.link.label'/></a> 
                            <a href='${pageContext.request.contextPath}/admProcess/copy/${admProcess.id}' class='btn btn-warning'><i class='fa fa-clone'></i> <spring:message code='default.button.copy.label'/></a>             
                            <a href='${pageContext.request.contextPath}/admProcess/delete/${admProcess.id}' class='btn btn-danger' onclick='return confirm('Are you sure to delete?');'><i class='fa fa-remove'></i> <spring:message code='delete.link.label'/></a>
                        </div>      <!--.box-footer-->
                    </div>      <!--.box .box-primary-->
                </section>      <!--.content-->
            </div>      <!--.content-wrapper-->
        </tiles:putAttribute>
</tiles:insertDefinition>