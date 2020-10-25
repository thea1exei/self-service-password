{if $prehook_return and $display_prehook_error and $prehook_return > 0}
    <div class="result alert alert-warning">
    <p><i class="fa fa-fw fa-exclamation-triangle" aria-hidden="true"></i> {$prehook_output[0]}</p>
    </div>
{/if}
{if $posthook_return and $display_posthook_error and $posthook_return > 0}
    <div class="result alert alert-warning">
    <p><i class="fa fa-fw fa-exclamation-triangle" aria-hidden="true"></i> {$posthook_output[0]}</p>
    </div>
{/if}
{if $result !== "passwordchanged"}
    {if $show_help }
        <div class="result alert alert-warning">
        <p><i class="fa fa-fw fa-exclamation-circle" aria-hidden="true"></i> {$msg_changehelp}</p>
        {if $msg_changehelpextramessage}
            <p>{$msg_changehelpextramessage}</p>
        {/if}
        {if !$show_menu and ($use_question or $use_tokens or $use_sms or $change_sshkey) }
            <p>{$msg_changehelpextramessage}</p>
            <ul>
                {if $use_questions}
                    <li>{$mgs_use_questions}</li>
                {/if}
                {if $use_tokens}
                    <li>{$mgs_use_tokens}</li>
                {/if}
                {if $use_sms}
                    <li>{$mgs_use_sms}</li>
                {/if}
                {if $change_sshkey}
                    <li>{$mgs_change_sshkey}</li>
                {/if}
            </ul>
        {/if}
        </div>
    {/if}
    {if $pwd_show_policy !== "never" and $pwd_show_policy_pos === 'above'}
        {include file="policy.tpl"}
    {/if}
    <div class="alert alert-info">
    <form action="#" method="post" class="form-horizontal">
        <div class="form-group">
            <label for="login" class="col-sm-4 control-label">{$msg_login}</label>
            <div class="col-sm-8">
                <div class="input-group">
                    <span class="input-group-addon"><i class="fa fa-fw fa-user"></i></span>
                    <input type="text" name="login" id="login" value="{$login}" class="form-control" placeholder="{$msg_login}" />
                </div>
            </div>
        </div>
        <div class="form-group">
            <label for="oldpassword" class="col-sm-4 control-label">{$msg_oldpassword}</label>
            <div class="col-sm-8">
                <div class="input-group">
                    <span class="input-group-addon"><i class="fa fa-fw fa-lock"></i></span>
                    <input type="password" autocomplete="current-password" auto-fill name="oldpassword" id="oldpassword" class="form-control" placeholder="{$msg_oldpassword}" />
                </div>
            </div>
        </div>
        <div class="form-group">
            <label for="newpassword" class="col-sm-4 control-label">{$msg_newpassword}</label>
            <div class="col-sm-8">
                <div class="input-group">
                    <span class="input-group-addon"><i class="fa fa-fw fa-lock"></i></span>
                    <input type="password" autocomplete="new-password" name="newpassword" id="newpassword" class="form-control" placeholder="{$msg_newpassword}" />
                </div>
            </div>
        </div>
        <div class="form-group">
            <label for="confirmpassword" class="col-sm-4 control-label">{$msg_confirmpassword}</label>
            <div class="col-sm-8">
                <div class="input-group">
                    <span class="input-group-addon"><i class="fa fa-fw fa-lock"></i></span>
                    <input type="password" autocomplete="new-password" name="confirmpassword" id="confirmpassword" class="form-control" placeholder="{$msg_confirmpassword}" />
                </div>
            </div>
        </div>
        {if ($use_recaptcha)}
            <div class="form-group">
                <div class="col-sm-offset-4 col-sm-8">
                    <div class="g-recaptcha" data-sitekey="{$recaptcha_publickey}" data-theme="{$recaptcha_theme}" data-type="<{$recaptcha_type}" data-size="{$recaptcha_size}"></div>
                    <script type="text/javascript" src="https://www.google.com/recaptcha/api.js?hl={$lang}"></script>
                </div>
            </div>
        {/if}
        <div class="form-group">
            <div class="col-sm-offset-4 col-sm-8">
                <button type="submit" class="btn btn-success">
                    <i class="fa fa-fw da-check-square-o"></i> {$msg_submit}
                </button>
            </div>
        </div>
    </form>
    </div>
{if $pwd_show_policy !== "never" and $pwd_show_policy_pos === 'below'}
    {include file="policy.tpl"}
{/if}
{elseif $msg_passwordchangedextramessage}
    <div class="result alert alert-{$result_criticity}">
    <p><i class="fa fa-fw {$result_fa_class}" aria-hidden="true"></i> {$msg_passwordchangedextramessage}</p>
    </div>
{/if}
