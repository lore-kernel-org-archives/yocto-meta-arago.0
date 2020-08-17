Return-Path: <j-stiffler@ti.com>
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
	by arago-project.org (Postfix) with ESMTPS id 307845296D
	for <meta-arago@arago-project.org>;
	Tue, 18 Aug 2020 13:10:37 +0000 (UTC)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 07ID7luo064456
	for <meta-arago@arago-project.org>; Tue, 18 Aug 2020 08:07:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1597756067;
	bh=iQwZq3/c+cMLomPJKnMUXN0frqOM6xhUC2zkjBMvnsM=;
	h=From:To:CC:Subject:Date;
	b=DkL1driazRAbY1S7ki4045ZeNIZtL5Xi3i62BDCFy+jQyyuomfwy6YlLdO2p832EN
	Mxplrd2wHxQOk2x81E9iSnnLGxkaLVMniTBptf6kXdBb0pXV8OS8SxvuqVYWKCwnS/
	5LTqiHJf03DS3hq4EYaWyvbecAKgTDM9OcTxt90k=
Received: from DFLE112.ent.ti.com (dfle112.ent.ti.com [10.64.6.33])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 07ID7lST044017
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Tue, 18 Aug 2020 08:07:47 -0500
Received: from DFLE114.ent.ti.com (10.64.6.35) by DFLE112.ent.ti.com
	(10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3;
	Tue, 18 Aug 2020 08:07:47 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE114.ent.ti.com
	(10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
	Frontend Transport; Tue, 18 Aug 2020 08:07:47 -0500
Received: from udd0866934.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 07ID7l7B076339;
	Tue, 18 Aug 2020 08:07:47 -0500
From: Jacob Stiffler <j-stiffler@ti.com>
To: <meta-arago@arago-project.org>
Date: Mon, 17 Aug 2020 14:22:57 -0400
Message-ID: <1597688579-8793-1-git-send-email-j-stiffler@ti.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [master/dunfell][PATCH 1/3] recipe-data: collect specific recipe data
X-BeenThere: meta-arago@arago-project.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Arago metadata layer for TI SDKs - OE-Core/Yocto compatible
	<meta-arago.arago-project.org>
List-Unsubscribe: <http://arago-project.org/cgi-bin/mailman/options/meta-arago>, 
	<mailto:meta-arago-request@arago-project.org?subject=unsubscribe>
List-Archive: <http://arago-project.org/pipermail/meta-arago>
List-Post: <mailto:meta-arago@arago-project.org>
List-Help: <mailto:meta-arago-request@arago-project.org?subject=help>
List-Subscribe: <http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago>, 
	<mailto:meta-arago-request@arago-project.org?subject=subscribe>
X-List-Received-Date: Tue, 18 Aug 2020 13:10:37 -0000
Content-Type: text/plain

* This class adds a general method to collect data across recipes.
* The output is a conf file which can be parsed by the bitbake parser.
* Basic routines are made available to extract data from the output.

Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
---
 meta-arago-distro/classes/recipe-data.bbclass | 100 ++++++++++++++++++++++++++
 1 file changed, 100 insertions(+)
 create mode 100644 meta-arago-distro/classes/recipe-data.bbclass

diff --git a/meta-arago-distro/classes/recipe-data.bbclass b/meta-arago-distro/classes/recipe-data.bbclass
new file mode 100644
index 0000000..be1db1f
--- /dev/null
+++ b/meta-arago-distro/classes/recipe-data.bbclass
@@ -0,0 +1,100 @@
+# This class will record certain information about dependent recipes to a conf
+# file. This way it can be retrieved by other recipes. For example, this can be
+# used to obtain the SRC_URI for the SDK's SW manifest.
+
+# Configuration file to record the recipe data.
+RECIPE_DATA_FILE ?= "${TMPDIR}/recipe_data.conf"
+
+# Variables to record
+RECIPE_DATA_VARS ?= "PV SRC_URI FILE"
+
+
+# Helper to load the data from the conf file
+def recipe_data_load(d, recipe_data = bb.data.init()):
+    fn = d.getVar('RECIPE_DATA_FILE', True)
+
+    if not fn:
+        bb.fatal('"RECIPE_DATA_FILE" is not defined!')
+
+    if os.path.exists(fn):
+        with bb.utils.fileslocked([fn + '.lock']):
+            try:
+                bb.parse.handle(fn, recipe_data)
+            except Exception as e:
+                bb.warn('ERROR parsing "%s"' % fn)
+                bb.fatal(str(e))
+
+    return recipe_data
+
+
+def recipe_data_get_var(var, pn, d):
+    if var not in (d.getVar('RECIPE_DATA_VARS', True) or '').split():
+        bb.fatal('Variable "%s" was not configured to be recored' % var)
+
+    recipe_data = recipe_data_load(d)
+    return recipe_data.getVar('%s_pn-%s' % (var,pn), True)
+
+# Add a shell variety so that it can work in shell tasks
+# *** In shell tasks, inline python will be executed during parsing, so shell
+# *** variables passed as input.
+recipe_data_get_var_sh() {
+    local pn="$1"
+    local var="$2"
+
+    sed -ne 's|'$var'_pn-'$pn'[ \t]*=[ \t]*"\(.*\)"[ \t]*$|\1|p' ${RECIPE_DATA_FILE}
+}
+
+# Update the conf file with a new data.
+# Variables such as "FILE" and "TOPDIR" are filtered out by default.
+def recipe_data_update(fn, update_data, var_blacklist = ['__.*', 'FILE', 'TOPDIR'], expand = False):
+    import re
+
+    recipe_data = bb.data.init()
+
+    # Create the regex to filter out variables
+    re_blacklist = re.compile('^' + '$|^'.join(var_blacklist) + '$')
+    with bb.utils.fileslocked([fn + '.lock']):
+        try:
+            bb.parse.handle(fn, recipe_data)
+        except:
+            pass
+
+        for var in update_data.keys():
+            recipe_data.setVar(var, update_data.getVar(var,expand))
+
+        # We could use bb.data_smart's built in "emit_var", but that gives
+        # unnecessary comments.
+        with open(fn, "w") as f:
+            for var in recipe_data.keys():
+                if not re_blacklist.match(var):
+                    f.write('%s = "%s"\n' % (var, recipe_data.getVar(var,expand)))
+
+
+addtask emit_recipe_data
+do_emit_recipe_data[nostamp] = "1"
+python do_emit_recipe_data(){
+    recipe_vars = (d.getVar('RECIPE_DATA_VARS', True) or '').split()
+    recipe_data_file = d.getVar('RECIPE_DATA_FILE', True)
+
+    pn = d.getVar('PN', True) or bb.fatal('"PN" is not defined!')
+
+    data = bb.data.init()
+
+    # Set pn-${PN} to the overrides for convenience
+    data.setVar('OVERRIDES', 'pn-${PN}')
+    for var in recipe_vars:
+        val = d.getVar(var, True) or ''
+        data.setVar('%s_pn-%s' % (var, pn), val)
+
+    recipe_data_update(recipe_data_file, data)
+}
+
+# Add empty task to control dependencies
+addtask emit_recipe_data_all after do_emit_recipe_data
+do_emit_recipe_data_all[noexec] = "1"
+do_emit_recipe_data_all[nostamp] = "1"
+do_emit_recipe_data_all[recrdeptask] = "do_emit_recipe_data_all do_emit_recipe_data"
+do_emit_recipe_data_all[recideptask] = "do_${BB_DEFAULT_TASK}"
+do_emit_recipe_data_all() {
+    :
+}
-- 
2.7.4


