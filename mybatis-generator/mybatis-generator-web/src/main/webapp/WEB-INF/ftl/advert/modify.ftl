<#--

       Copyright ${license.git.copyrightYears} the original author or authors.

       Licensed under the Apache License, Version 2.0 (the "License");
       you may not use this file except in compliance with the License.
       You may obtain a copy of the License at

          http://www.apache.org/licenses/LICENSE-2.0

       Unless required by applicable law or agreed to in writing, software
       distributed under the License is distributed on an "AS IS" BASIS,
       WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
       See the License for the specific language governing permissions and
       limitations under the License.

-->
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
        "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<#include "../script.ftl">
</head>

<body class="withvernav">
<div class="bodywrapper">
    <div class="topheader"><#include "../top.ftl"></div><!--topheader-->


    <div class="header"><#include "../header.ftl"></div><!--header-->

    <div class="vernav2 iconmenu">
    <#include "../left.ftl">
    </div><!--leftmenu-->

    <div id="main_show" class="centercontent tables">
        <div class="pageheader notab">
            <h1 class="pagetitle">首页 > 广告列表管理 > 添加/修改广告</h1>
        </div><!--pageheader-->

        <div id="contentwrapper" class="contentwrapper">


            <div id="basicform" class="subcontent">

                <div class="contenttitle2">
                    <h3>添加/修改广告</h3>
                </div><!--contenttitle-->

                <form class="stdform" action="/admin/advert/modify" method="post" enctype="multipart/form-data">
                    <input type="hidden" name="id" value="${model.id!''}"/>
                    <p>
                        <label>广告序号</label>
                        <span class="field"><input type="text" name="orderno" value="${model.orderno!''}" class="smallinput"/></span>
                        <small class="desc">广告列表中的排序位置,请输入数字编号</small>
                    </p>

                    <p>
                        <label>广告类型</label>
                        <span class="formwrapper">
                            	<select name="adType" data-placeholder="Choose a Country..." class="chzn-select" style="width:350px;" tabindex="2">
                                  <#if model.adType??&&model.adType==1>
                                      <option value="1" selected>游戏广告</option>
                                  <#elseif model.adType??&&model.adType==2>
                                      <option value="2" selected>菜单广告</option>
                                  <#elseif model.adType??&&model.adType==3>
                                      <option value="3" selected>小说广告</option>
                                  <#elseif model.adType??&&model.adType==4>
                                      <option value="4" selected>漫画广告</option>
                                  </#if>
                                  <option value="1">游戏广告</option>
                                  <option value="2">菜单广告</option>
                                  <option value="3">小说广告</option>
                                  <option value="4">漫画广告</option>
                                </select>
                            </span>
                    </p>

                    <p>
                        <label>广告图片</label>
                        <span class="field"><input type="file" name="file" value="点击上传"/></span>
                        <small class="desc"><span></span></small>
                    </p>
                    <p>
                        <label>广告内容</label>
                        <span class="field"><textarea cols="80" rows="5" name="adVal" class="longinput">${model.adVal!""}</textarea></span>
                    </p>
                    <p>
                        <label>广告状态</label>
                        <span class="formwrapper">
                            	<select name="state" data-placeholder="Choose a Country..." class="chzn-select" style="width:350px;" tabindex="2">
                                  <#if model.state??&&model.state==1>
                                      <option value="1" selected>正常</option>
                                  <#elseif model.state??&&model.state==2>
                                      <option value="2" selected>禁用</option>
                                  </#if>
                                      <option value="1">正常</option>
                                  <option value="2">禁用</option>
                                </select>
                            </span>
                    </p>
                    <br clear="all"/><br/>

                    <p class="stdformbutton">
                        <button class="submit radius2">提交数据</button>
                        <input type="reset" class="reset radius2" value="恢复数据"/>
                    </p>
                </form>
                <br/>
            </div><!--subcontent-->


        </div><!--contentwrapper-->
    </div><!-- centercontent -->


</div><!--bodywrapper-->

</body>
</html>
