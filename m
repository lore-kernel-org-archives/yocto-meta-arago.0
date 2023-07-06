Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B7754C001DF
	for <webhook@archiver.kernel.org>; Thu,  6 Jul 2023 21:23:12 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web11.36462.1688678589937113312
 for <meta-arago@lists.yoctoproject.org>;
 Thu, 06 Jul 2023 14:23:10 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id D8B0540027;
	Thu,  6 Jul 2023 21:23:08 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Xv9xUvqZDCdU; Thu,  6 Jul 2023 21:23:08 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-88-116.washdc.fios.verizon.net [100.15.88.116])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id AA31F40C16;
	Thu,  6 Jul 2023 21:23:07 +0000 (UTC)
Received: from thorin.han-sole.ts.net (thorin.denix [192.168.30.9])
	by mail.denix.org (Postfix) with ESMTP id 23E0F163BEE;
	Thu,  6 Jul 2023 17:23:05 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@lists.yoctoproject.org
Cc: Denys Dmytriyenko <denys@konsulko.com>
Subject: [master][PATCH 1/6] recipe-data: deprecate
Date: Thu,  6 Jul 2023 21:22:59 +0000
Message-Id: <20230706212304.1893414-2-denis@denix.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230706212304.1893414-1-denis@denix.org>
References: <20230706212304.1893414-1-denis@denix.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Thu, 06 Jul 2023 21:23:12 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/14779

From: Denys Dmytriyenko <denys@konsulko.com>

Deprecate custom recipe-data class. It was added when Bitbake started
sanitizing "source" field of generated binary packages due to a CVE
security vulnerability that could potentially leak local resource
passwords. This class would bypass the sanitizing step by preserving
source URLs from recipes to be used in TISDK bundle manifest.

Even with a valid use case, this approach was still questionable and
now it complicates latest TISDK bundle changes necessary for adding
a proper secondary toolchain support. Plus bundle manifests don't seem
to be used that much lately, so deprecate this class.

Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
---
 meta-arago-distro/classes/recipe-data.bbclass | 100 ------------------
 .../classes/tisdk-bundle.bbclass              |  43 +-------
 meta-arago-distro/conf/distro/arago.conf      |   3 -
 3 files changed, 1 insertion(+), 145 deletions(-)
 delete mode 100644 meta-arago-distro/classes/recipe-data.bbclass

diff --git a/meta-arago-distro/classes/recipe-data.bbclass b/meta-arago-d=
istro/classes/recipe-data.bbclass
deleted file mode 100644
index be1db1ff..00000000
--- a/meta-arago-distro/classes/recipe-data.bbclass
+++ /dev/null
@@ -1,100 +0,0 @@
-# This class will record certain information about dependent recipes to =
a conf
-# file. This way it can be retrieved by other recipes. For example, this=
 can be
-# used to obtain the SRC_URI for the SDK's SW manifest.
-
-# Configuration file to record the recipe data.
-RECIPE_DATA_FILE ?=3D "${TMPDIR}/recipe_data.conf"
-
-# Variables to record
-RECIPE_DATA_VARS ?=3D "PV SRC_URI FILE"
-
-
-# Helper to load the data from the conf file
-def recipe_data_load(d, recipe_data =3D bb.data.init()):
-    fn =3D d.getVar('RECIPE_DATA_FILE', True)
-
-    if not fn:
-        bb.fatal('"RECIPE_DATA_FILE" is not defined!')
-
-    if os.path.exists(fn):
-        with bb.utils.fileslocked([fn + '.lock']):
-            try:
-                bb.parse.handle(fn, recipe_data)
-            except Exception as e:
-                bb.warn('ERROR parsing "%s"' % fn)
-                bb.fatal(str(e))
-
-    return recipe_data
-
-
-def recipe_data_get_var(var, pn, d):
-    if var not in (d.getVar('RECIPE_DATA_VARS', True) or '').split():
-        bb.fatal('Variable "%s" was not configured to be recored' % var)
-
-    recipe_data =3D recipe_data_load(d)
-    return recipe_data.getVar('%s_pn-%s' % (var,pn), True)
-
-# Add a shell variety so that it can work in shell tasks
-# *** In shell tasks, inline python will be executed during parsing, so =
shell
-# *** variables passed as input.
-recipe_data_get_var_sh() {
-    local pn=3D"$1"
-    local var=3D"$2"
-
-    sed -ne 's|'$var'_pn-'$pn'[ \t]*=3D[ \t]*"\(.*\)"[ \t]*$|\1|p' ${REC=
IPE_DATA_FILE}
-}
-
-# Update the conf file with a new data.
-# Variables such as "FILE" and "TOPDIR" are filtered out by default.
-def recipe_data_update(fn, update_data, var_blacklist =3D ['__.*', 'FILE=
', 'TOPDIR'], expand =3D False):
-    import re
-
-    recipe_data =3D bb.data.init()
-
-    # Create the regex to filter out variables
-    re_blacklist =3D re.compile('^' + '$|^'.join(var_blacklist) + '$')
-    with bb.utils.fileslocked([fn + '.lock']):
-        try:
-            bb.parse.handle(fn, recipe_data)
-        except:
-            pass
-
-        for var in update_data.keys():
-            recipe_data.setVar(var, update_data.getVar(var,expand))
-
-        # We could use bb.data_smart's built in "emit_var", but that giv=
es
-        # unnecessary comments.
-        with open(fn, "w") as f:
-            for var in recipe_data.keys():
-                if not re_blacklist.match(var):
-                    f.write('%s =3D "%s"\n' % (var, recipe_data.getVar(v=
ar,expand)))
-
-
-addtask emit_recipe_data
-do_emit_recipe_data[nostamp] =3D "1"
-python do_emit_recipe_data(){
-    recipe_vars =3D (d.getVar('RECIPE_DATA_VARS', True) or '').split()
-    recipe_data_file =3D d.getVar('RECIPE_DATA_FILE', True)
-
-    pn =3D d.getVar('PN', True) or bb.fatal('"PN" is not defined!')
-
-    data =3D bb.data.init()
-
-    # Set pn-${PN} to the overrides for convenience
-    data.setVar('OVERRIDES', 'pn-${PN}')
-    for var in recipe_vars:
-        val =3D d.getVar(var, True) or ''
-        data.setVar('%s_pn-%s' % (var, pn), val)
-
-    recipe_data_update(recipe_data_file, data)
-}
-
-# Add empty task to control dependencies
-addtask emit_recipe_data_all after do_emit_recipe_data
-do_emit_recipe_data_all[noexec] =3D "1"
-do_emit_recipe_data_all[nostamp] =3D "1"
-do_emit_recipe_data_all[recrdeptask] =3D "do_emit_recipe_data_all do_emi=
t_recipe_data"
-do_emit_recipe_data_all[recideptask] =3D "do_${BB_DEFAULT_TASK}"
-do_emit_recipe_data_all() {
-    :
-}
diff --git a/meta-arago-distro/classes/tisdk-bundle.bbclass b/meta-arago-=
distro/classes/tisdk-bundle.bbclass
index 34349db3..84bf364b 100644
--- a/meta-arago-distro/classes/tisdk-bundle.bbclass
+++ b/meta-arago-distro/classes/tisdk-bundle.bbclass
@@ -444,43 +444,6 @@ sw_manifest_host() {
     sw_manifest_table_footer
 }
=20
-# Use the recipe-data class to collect SRC_URI for the manifest.
-#
-# While this will need to be globally INHERIT'd to work properly, inheri=
t
-# locally so that parsing does not fail.
-inherit recipe-data
-
-# Instead of re-adding the do_rootfs task, re-add the do_emit_recipe_dat=
a_all
-#  task to run before do_rootfs.
-deltask do_emit_recipe_data_all
-
-# There seems to be something special with the rootfs task and task depe=
ndencies
-# are not working as expected, so use the install task instead.
-addtask emit_recipe_data_all after do_emit_recipe_data before do_install
-
-get_sources_from_recipe(){
-    [ ! -z "$1" ] || return 0
-
-    # Check if a full URL is given (e.g. ipks from sourceipk class)
-    if [ $(echo "$1" | grep -c '://') -gt 0 ]
-    then
-        echo "$1"
-        return 0
-    fi
-
-    # Now assume that this was created by the package_ipk class
-
-    # Cannot assume that recipe filename is ${PN}_${PV}.bb
-    # This is easily seen with BBCLASSEXTEND recipes.
-    for pn in $(sed -ne 's|FILE_pn-\([^ \t=3D]*\)[ \t]*=3D[ \t]*".*/'$1'=
".*|\1|p' "${RECIPE_DATA_FILE}")
-    do
-        # Only need a single PN incase there are native, nativesdk, targ=
et variants.
-        break
-    done
-
-    recipe_data_get_var_sh "$pn" "SRC_URI"
-}
-
 # This function expects to be passed the following parameter
 #   - The location to the opkg info directory containing the control fil=
es
 #     of the installed packages
@@ -491,9 +454,6 @@ generate_sw_manifest_table() {
     control_dir=3D"$1"
     gplv3_only=3D"$2"
=20
-    # Call this here so that the function gets added to the task script
-    get_sources_from_recipe
-
     if [ ! -d "$control_dir" ]
     then
         echo "Could not find the control directory ($control_dir)"
@@ -583,8 +543,7 @@ EOF
         long_version=3D"`cat $i | grep Version: | awk {'print $2'}`"
         license=3D"`cat $i | grep License: | cut -d: -f2 `"
         architecture=3D"`cat $i | grep Architecture: | awk {'print $2'}`=
"
-        recipe=3D"`cat $i | grep Source: | cut -d ':' -f2-`"
-        sources=3D"`get_sources_from_recipe $recipe`"
+        sources=3D"`cat $i | grep Source: | cut -d ':' -f2-`"
         location=3D"$package""_""$long_version""_""$architecture"".ipk"
=20
         # Set the highlight color if the license in GPLv3.  If this is
diff --git a/meta-arago-distro/conf/distro/arago.conf b/meta-arago-distro=
/conf/distro/arago.conf
index d9f84cbd..33454068 100644
--- a/meta-arago-distro/conf/distro/arago.conf
+++ b/meta-arago-distro/conf/distro/arago.conf
@@ -163,9 +163,6 @@ require conf/distro/include/toolchain-${TOOLCHAIN_TYP=
E}.inc
 #TARGET_CPPFLAGS +=3D "-fstack-protector -D_FORTIFY_SOURCE=3D1"
 #TARGET_CPPFLAGS +=3D "-fstack-protector"
=20
-# Inherit "recipe-data" class to populate SRC_URI in manifest
-INHERIT +=3D "recipe-data"
-
 # Load default preferences
 require conf/distro/include/arago-prefs.inc
=20
--=20
2.25.1


