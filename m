Return-Path: <a-limaye@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 274A9EB64D9
	for <webhook@archiver.kernel.org>; Mon, 10 Jul 2023 12:11:30 +0000 (UTC)
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by mx.groups.io with SMTP id smtpd.web10.37953.1688991086766899542
 for <meta-arago@lists.yoctoproject.org>;
 Mon, 10 Jul 2023 05:11:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=DQ5lfvHH;
 spf=pass (domain: ti.com, ip: 198.47.23.249, mailfrom: a-limaye@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 36ACBM8d030115;
	Mon, 10 Jul 2023 07:11:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1688991082;
	bh=5nHrRTgKcDYtEGAgJoX0SFIbL+5GYwGoHV9H2eie9r4=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=DQ5lfvHHtyKPL/BVDBOe03QRCmxI0yFpIU+pI6BiBWjbI4w0xgcK69LW1TSLTa95m
	 RttmGClFy6CJAAKUm0anBS/fpH33Jv7om/y45I+KQaAFL+tIWV3Yi13h9Tdb6BYODV
	 fgQKUZ0U6iI7nR2u2XloMJsSuygE+QcL//bVFAKs=
Received: from DFLE109.ent.ti.com (dfle109.ent.ti.com [10.64.6.30])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 36ACBMQ0053857
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 10 Jul 2023 07:11:22 -0500
Received: from DFLE111.ent.ti.com (10.64.6.32) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 10
 Jul 2023 07:11:22 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE111.ent.ti.com
 (10.64.6.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Mon, 10 Jul 2023 07:11:22 -0500
Received: from [10.24.68.161] (ileaxei01-snat.itg.ti.com [10.180.69.5])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 36ACBJdQ098462;
	Mon, 10 Jul 2023 07:11:20 -0500
Message-ID: <558037f0-680c-491b-c5a1-82448da9062d@ti.com>
Date: Mon, 10 Jul 2023 17:41:19 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [EXTERNAL] [meta-arago] [kirkstone][PATCH 1/6] recipe-data:
 deprecate
Content-Language: en-US
To: Denys Dmytriyenko <denis@denix.org>, <meta-arago@lists.yoctoproject.org>
CC: Denys Dmytriyenko <denys@konsulko.com>, <s-adivi@ti.com>,
        <c-shilwant@ti.com>, <g-gupta@ti.com>,
        Rahul Ravikumar <r-ravikumar@ti.com>
References: <20230706212335.1893675-1-denis@denix.org>
 <20230706212335.1893675-2-denis@denix.org>
From: Aniket Limaye <a-limaye@ti.com>
In-Reply-To: <20230706212335.1893675-2-denis@denix.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Mon, 10 Jul 2023 12:11:30 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/14793


On 07/07/23 02:53, Denys Dmytriyenko wrote:
> From: Denys Dmytriyenko <denys@konsulko.com>
>
> Deprecate custom recipe-data class. It was added when Bitbake started
> sanitizing "source" field of generated binary packages due to a CVE
> security vulnerability that could potentially leak local resource
> passwords. This class would bypass the sanitizing step by preserving
> source URLs from recipes to be used in TISDK bundle manifest.
>
> Even with a valid use case, this approach was still questionable and
> now it complicates latest TISDK bundle changes necessary for adding
> a proper secondary toolchain support. Plus bundle manifests don't seem
> to be used that much lately, so deprecate this class.

Hi Denys, Ryan,

I was a little concerned with the last statement here. At SDK level we 
do use the manifest .txt files that to upload on the release page.

I am not sure yet about how this patch affects the manifest txt file. 
Does this change the structure at all or just the Source field for each 
recipe?

If the change really is significant, I will be creating a build with 
this patch and get back to you if i have concerns.

> Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
> ---
>   meta-arago-distro/classes/recipe-data.bbclass | 100 ------------------
>   .../classes/tisdk-bundle.bbclass              |  43 +-------
>   meta-arago-distro/conf/distro/arago.conf      |   3 -
>   3 files changed, 1 insertion(+), 145 deletions(-)
>   delete mode 100644 meta-arago-distro/classes/recipe-data.bbclass
>
> diff --git a/meta-arago-distro/classes/recipe-data.bbclass b/meta-arago-distro/classes/recipe-data.bbclass
> deleted file mode 100644
> index be1db1ff..00000000
> --- a/meta-arago-distro/classes/recipe-data.bbclass
> +++ /dev/null
> @@ -1,100 +0,0 @@
> -# This class will record certain information about dependent recipes to a conf
> -# file. This way it can be retrieved by other recipes. For example, this can be
> -# used to obtain the SRC_URI for the SDK's SW manifest.
> -
> -# Configuration file to record the recipe data.
> -RECIPE_DATA_FILE ?= "${TMPDIR}/recipe_data.conf"
> -
> -# Variables to record
> -RECIPE_DATA_VARS ?= "PV SRC_URI FILE"
> -
> -
> -# Helper to load the data from the conf file
> -def recipe_data_load(d, recipe_data = bb.data.init()):
> -    fn = d.getVar('RECIPE_DATA_FILE', True)
> -
> -    if not fn:
> -        bb.fatal('"RECIPE_DATA_FILE" is not defined!')
> -
> -    if os.path.exists(fn):
> -        with bb.utils.fileslocked([fn + '.lock']):
> -            try:
> -                bb.parse.handle(fn, recipe_data)
> -            except Exception as e:
> -                bb.warn('ERROR parsing "%s"' % fn)
> -                bb.fatal(str(e))
> -
> -    return recipe_data
> -
> -
> -def recipe_data_get_var(var, pn, d):
> -    if var not in (d.getVar('RECIPE_DATA_VARS', True) or '').split():
> -        bb.fatal('Variable "%s" was not configured to be recored' % var)
> -
> -    recipe_data = recipe_data_load(d)
> -    return recipe_data.getVar('%s_pn-%s' % (var,pn), True)
> -
> -# Add a shell variety so that it can work in shell tasks
> -# *** In shell tasks, inline python will be executed during parsing, so shell
> -# *** variables passed as input.
> -recipe_data_get_var_sh() {
> -    local pn="$1"
> -    local var="$2"
> -
> -    sed -ne 's|'$var'_pn-'$pn'[ \t]*=[ \t]*"\(.*\)"[ \t]*$|\1|p' ${RECIPE_DATA_FILE}
> -}
> -
> -# Update the conf file with a new data.
> -# Variables such as "FILE" and "TOPDIR" are filtered out by default.
> -def recipe_data_update(fn, update_data, var_blacklist = ['__.*', 'FILE', 'TOPDIR'], expand = False):
> -    import re
> -
> -    recipe_data = bb.data.init()
> -
> -    # Create the regex to filter out variables
> -    re_blacklist = re.compile('^' + '$|^'.join(var_blacklist) + '$')
> -    with bb.utils.fileslocked([fn + '.lock']):
> -        try:
> -            bb.parse.handle(fn, recipe_data)
> -        except:
> -            pass
> -
> -        for var in update_data.keys():
> -            recipe_data.setVar(var, update_data.getVar(var,expand))
> -
> -        # We could use bb.data_smart's built in "emit_var", but that gives
> -        # unnecessary comments.
> -        with open(fn, "w") as f:
> -            for var in recipe_data.keys():
> -                if not re_blacklist.match(var):
> -                    f.write('%s = "%s"\n' % (var, recipe_data.getVar(var,expand)))
> -
> -
> -addtask emit_recipe_data
> -do_emit_recipe_data[nostamp] = "1"
> -python do_emit_recipe_data(){
> -    recipe_vars = (d.getVar('RECIPE_DATA_VARS', True) or '').split()
> -    recipe_data_file = d.getVar('RECIPE_DATA_FILE', True)
> -
> -    pn = d.getVar('PN', True) or bb.fatal('"PN" is not defined!')
> -
> -    data = bb.data.init()
> -
> -    # Set pn-${PN} to the overrides for convenience
> -    data.setVar('OVERRIDES', 'pn-${PN}')
> -    for var in recipe_vars:
> -        val = d.getVar(var, True) or ''
> -        data.setVar('%s_pn-%s' % (var, pn), val)
> -
> -    recipe_data_update(recipe_data_file, data)
> -}
> -
> -# Add empty task to control dependencies
> -addtask emit_recipe_data_all after do_emit_recipe_data
> -do_emit_recipe_data_all[noexec] = "1"
> -do_emit_recipe_data_all[nostamp] = "1"
> -do_emit_recipe_data_all[recrdeptask] = "do_emit_recipe_data_all do_emit_recipe_data"
> -do_emit_recipe_data_all[recideptask] = "do_${BB_DEFAULT_TASK}"
> -do_emit_recipe_data_all() {
> -    :
> -}
> diff --git a/meta-arago-distro/classes/tisdk-bundle.bbclass b/meta-arago-distro/classes/tisdk-bundle.bbclass
> index dbdc9a5a..c7aba032 100644
> --- a/meta-arago-distro/classes/tisdk-bundle.bbclass
> +++ b/meta-arago-distro/classes/tisdk-bundle.bbclass
> @@ -444,43 +444,6 @@ sw_manifest_host() {
>       sw_manifest_table_footer
>   }
>   
> -# Use the recipe-data class to collect SRC_URI for the manifest.
> -#
> -# While this will need to be globally INHERIT'd to work properly, inherit
> -# locally so that parsing does not fail.
> -inherit recipe-data
> -
> -# Instead of re-adding the do_rootfs task, re-add the do_emit_recipe_data_all
> -#  task to run before do_rootfs.
> -deltask do_emit_recipe_data_all
> -
> -# There seems to be something special with the rootfs task and task dependencies
> -# are not working as expected, so use the install task instead.
> -addtask emit_recipe_data_all after do_emit_recipe_data before do_install
> -
> -get_sources_from_recipe(){
> -    [ ! -z "$1" ] || return 0
> -
> -    # Check if a full URL is given (e.g. ipks from sourceipk class)
> -    if [ $(echo "$1" | grep -c '://') -gt 0 ]
> -    then
> -        echo "$1"
> -        return 0
> -    fi
> -
> -    # Now assume that this was created by the package_ipk class
> -
> -    # Cannot assume that recipe filename is ${PN}_${PV}.bb
> -    # This is easily seen with BBCLASSEXTEND recipes.
> -    for pn in $(sed -ne 's|FILE_pn-\([^ \t=]*\)[ \t]*=[ \t]*".*/'$1'".*|\1|p' "${RECIPE_DATA_FILE}")
> -    do
> -        # Only need a single PN incase there are native, nativesdk, target variants.
> -        break
> -    done
> -
> -    recipe_data_get_var_sh "$pn" "SRC_URI"
> -}
> -
>   # This function expects to be passed the following parameter
>   #   - The location to the opkg info directory containing the control files
>   #     of the installed packages
> @@ -491,9 +454,6 @@ generate_sw_manifest_table() {
>       control_dir="$1"
>       gplv3_only="$2"
>   
> -    # Call this here so that the function gets added to the task script
> -    get_sources_from_recipe
> -
>       if [ ! -d "$control_dir" ]
>       then
>           echo "Could not find the control directory ($control_dir)"
> @@ -583,8 +543,7 @@ EOF
>           long_version="`cat $i | grep Version: | awk {'print $2'}`"
>           license="`cat $i | grep License: | cut -d: -f2 `"
>           architecture="`cat $i | grep Architecture: | awk {'print $2'}`"
> -        recipe="`cat $i | grep Source: | cut -d ':' -f2-`"
> -        sources="`get_sources_from_recipe $recipe`"
> +        sources="`cat $i | grep Source: | cut -d ':' -f2-`"
>           location="$package""_""$long_version""_""$architecture"".ipk"
>   
>           # Set the highlight color if the license in GPLv3.  If this is
> diff --git a/meta-arago-distro/conf/distro/arago.conf b/meta-arago-distro/conf/distro/arago.conf
> index e0087ab7..ceb74b6e 100644
> --- a/meta-arago-distro/conf/distro/arago.conf
> +++ b/meta-arago-distro/conf/distro/arago.conf
> @@ -166,9 +166,6 @@ require conf/distro/include/toolchain-${TOOLCHAIN_TYPE}.inc
>   #TARGET_CPPFLAGS += "-fstack-protector -D_FORTIFY_SOURCE=1"
>   #TARGET_CPPFLAGS += "-fstack-protector"
>   
> -# Inherit "recipe-data" class to populate SRC_URI in manifest
> -INHERIT += "recipe-data"
> -
>   # Load default preferences
>   require conf/distro/include/arago-prefs.inc
>   


Thanks,

Aniket


