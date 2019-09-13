<#import "parts/common.ftl" as c>
<#import "parts/login.ftl" as l>
<#include "parts/security.ftl">

<@c.page>
<#--    <div>Сообщения</div>-->
    <div class="form-row">
        <div class="form-group col-md-6">
            <form method="get" action="/" class="form-inline">
                <input type="text" name="filter" class="form-control" value="${filter!""}" placeholder="Search tag">
                <button type="submit" class="btn btn btn-outline-danger ml-2">Search</button>
            </form>


<#--            <select class="custom-select col-md-2">-->
<#--                <option value="0">All</option>-->
<#--               <#list messages as m>-->
<#--                    <option value="${m.id}">${m.tag}</option>-->
<#--                </#list>-->
<#--            </select>-->



<#--            <form action="search">-->
<#--                <select class="custom-select col-md-2" id="inputGroupSelect06">-->
<#--                    <#if users??>-->
<#--                        <#list users as user>-->
<#--                            <option value="${user.id}">lol</option>-->
<#--                        </#list>-->
<#--                    </#if>-->
<#--                </select>-->
<#--            </form>-->
        </div>
    </div>
    <div>
        <div class="form-row">
            <div class="form-group col-md-6">
                <form method="post" class="form-inline">
                    <input type="text" name="text" class="form-control" placeholder="Enter your message"/>
                    <input type="text" name="tag" class="form-control ml-2" placeholder="Tag">
                    <input type="hidden" name="_csrf" value="${_csrf.token}"/>
                    <button type="submit" class="btn btn-outline-danger ml-2">Add</button>
                </form>
            </div>
        </div>
    </div>

    <table class="table table-hover">
        <#--        <#list messages as m>-->
        <thead>
        <tr>
            <#--            <th>#</th>-->
            <th class="styleForMessage">Text</th>
            <th style="width: 20%">Tag</th>
            <th style="width: 20%">User</th>
            <th style="width: 10%">Options</th>
        </tr>
        </thead>
        <#--        style="background: #F5DEB3"-->
        <tbody>
        <#list messages as m>
            <tr>
                <td>${m.text}</td>
                <td>${m.tag}</td>
                <td>@${m.authorName}</td>
                <td>
                    <#if isAdmin><a class="text-my-own-color" href="/message/${m.id}">
                            Delete
                        </a> <#elseif m.authorName==name&&m.authorName!="no">
                        <a class="text-my-own-color" href="/message/${m.id}">
                            Delete
                        </a>
                    <#else>-
                    </#if>


                </td>
            </tr>
        <#else>
            There are no posts.
        </#list>
        </tbody>
    </table>

</@c.page>