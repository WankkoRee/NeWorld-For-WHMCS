{if in_array('state', $optionalFields)}
    <script>
        var stateNotRequired = true;
    </script>
{/if}

<script type="text/javascript" src="{$BASE_PATH_JS}/StatesDropdown.js"></script>

<section class="loginform">
	<div class="row">
		<div class="col-sm-12">
			
			<a style="display:none;" class="navbar-brand" href="{$WEB_ROOT}/index.php" title="{$companyname}">{$companyname}</a>
			
			{if $registrationDisabled}
			    {include file="$template/includes/alert.tpl" type="error" msg=$LANG.registerCreateAccount|cat:' <strong><a href="cart.php" class="alert-link">'|cat:$LANG.registerCreateAccountOrder|cat:'</a></strong>'}
			{/if}
			
			{if $errormessage}
			    {include file="$template/includes/alert.tpl" type="error" errorshtml=$errormessage}
			{/if}
			
			{if !$registrationDisabled}
			
			<div class="portlet">
			    <form method="post" class="using-password-strength" action="{$smarty.server.PHP_SELF}" role="form">
			        <input type="hidden" name="register" value="true"/>
			        <input type="hidden" name="country" value="CN" />
			        <input type="hidden" name="state" value="{$LANG.clientareastate}" />
			        <input type="hidden" name="city" value="{$LANG.clientareacity}" />
			        <input type="hidden" name="postcode" value="100000" />
			        <input type="hidden" name="companyname" value="{$LANG.clientareacompanyname}" />
			        <input type="hidden" name="address1" value="{$LANG.clientareaaddress1}" />
			        <input type="hidden" name="address2" value="{$LANG.clientareaaddress2}" />
			        <div class="form-group col-md-6" style="display:none;">
			            <label for="lastname" class="control-label">{$LANG.clientarealastname}</label>
			            <input type="text" name="lastname" id="lastname" value="{$clientlastname}" class="form-control" {if !in_array('lastname', $optionalFields)}required{/if} tabindex="1" />
			        </div>
			        
			        <div class="form-group">
			            <label for="firstname" class="control-label">{$LANG.clientareafirstname}</label>
			            <input type="text" name="firstname" id="firstname" value="{$clientfirstname}" class="form-control" {if !in_array('firstname', $optionalFields)}required{/if} tabindex="2" />
			           </div>
			
			        <div class="form-group">
			            <label for="email" class="control-label">{$LANG.clientareaemail}</label>
			            <input type="email" name="email" id="email" value="{$clientemail}" class="form-control"  tabindex="3" />
			        </div>
			
			        <div class="form-group" style="display:none;">
			            <label for="phonenumber" class="control-label">{$LANG.clientareaphonenumber}</label>
			            <input type="tel" name="phonenumber" id="phonenumber" value="{$clientphonenumber}" class="form-control" {if !in_array('phonenumber', $optionalFields)}required{/if} tabindex="6" />
			        </div>
			
			        <div id="newPassword1" class="form-group has-feedback">
			            <label for="inputNewPassword1" class="control-label">{$LANG.clientareapassword}</label>
			            <input type="password" class="form-control" id="inputNewPassword1" name="password" autocomplete="off" tabindex="12" />
			            <span class="form-control-feedback glyphicon glyphicon-password"></span>
			            {include file="$template/includes/pwstrength.tpl"}
			        </div>
			        
			        <div id="newPassword2" class="form-group has-feedback">
			            <label for="inputNewPassword2" class="control-label">{$LANG.clientareaconfirmpassword}</label>
			            <input type="password" class="form-control" id="inputNewPassword2" name="password2" autocomplete="off" tabindex="13" />
			            <span class="form-control-feedback glyphicon glyphicon-password"></span>
			            <div id="inputNewPassword2Msg">
			            </div>
			        </div>
			
			        {if $customfields}
			            {foreach from=$customfields key=num item=customfield}
			                <div class="form-group">
			                    <label class="control-label" for="customfield{$customfield.id}">{$customfield.name}</label>
			                    <div class="control">
			                        {$customfield.input} {$customfield.description}
			                    </div>
			                </div>
			            {/foreach}
			        {/if}
			
			        {if $currencies}
			            <div class="form-group">
			                <label for="currency" class="control-label">{$LANG.choosecurrency}</label>
			                <select id="currency" name="currency" class="form-control">
			                    {foreach from=$currencies item=curr}
			                    <option value="{$curr.id}"{if !$smarty.post.currency && $curr.default || $smarty.post.currency eq $curr.id } selected{/if}>{$curr.code}</option>
			                    {/foreach}
			                </select>
			            </div>
			        {/if}
			
			        {if $securityquestions}
			            <div class="panel panel-default">
			                <div class="panel-heading">
			                    <h3 class="panel-title">{$LANG.clientareasecurityquestion}:</h3>
			                </div>
			                <div class="panel-body">
			                    <div class="form-group col-sm-12">
			                        <select name="securityqid" id="securityqid" class="form-control">
			                            {foreach key=num item=question from=$securityquestions}
			                                <option value={$question.id}>{$question.question}</option>
			                            {/foreach}
			                        </select>
			                    </div>
			                    <div class="form-group">
			                        <label class="col-sm-4 control-label" for="securityqans">{$LANG.clientareasecurityanswer}</label>
			                        <div class="col-sm-6">
			                            <input type="password" name="securityqans" id="securityqans" class="form-control" autocomplete="off" />
			                        </div>
			                    </div>
			                </div>
			            </div>
			        {/if}
			
			        {include file="$template/includes/captcha.tpl"}
			
			        {if $accepttos}
			            <div class="form-group text-center">
			                <label class="checkbox">
			                	<input type="checkbox" name="accepttos" class="accepttos" style="margin-left: 0;position: relative;" tabindex="14">
								{$LANG.ordertosagreement} <a href="{$tosurl}" target="_blank">{$LANG.ordertos}</a>
			                </label>
			            </div>
			        {/if}
			
			        <div class="form-group text-center">
			            <input class="btn btn-block btn-primary" type="submit" value="{$LANG.clientregistertitle}" tabindex="15"/>
			        </div>
			
			    </form>
			</div>
			{/if}
		</div>
	</div>
</section>
