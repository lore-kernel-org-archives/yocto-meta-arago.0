Return-Path: <j-stiffler@ti.com>
Received: from fllnx210.ext.ti.com (fllnx210.ext.ti.com [198.47.19.17])
	by arago-project.org (Postfix) with ESMTPS id 648E252992
	for <meta-arago@arago-project.org>;
	Wed,  1 Nov 2017 15:13:51 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by fllnx210.ext.ti.com (8.15.1/8.15.1) with ESMTP id vA1FDpe2005586
	for <meta-arago@arago-project.org>; Wed, 1 Nov 2017 10:13:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1509549231;
	bh=PRoZ6rIoouhU21UBsIWjuLug2u/y42B7M3kyFrChXCI=;
	h=From:To:CC:Subject:Date;
	b=sA4x/KnRBLpsmArBDbHyd7xPyiDvF9IuBhvD5QSy4E3sr6hFlPpg7ravLHEH9L848
	Zcaoc4ufWZLMttjKUfTPUlxdEWqLBGq7tqso2+pyqD39Y7BJ6/we64Ofg2d0k8HZnk
	jRtmgYZJygqUqm3GPYc+GhYA7RZTdudG3hRiyVCo=
Received: from DLEE101.ent.ti.com (dlee101.ent.ti.com [157.170.170.31])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id vA1FDpQT007827
	for <meta-arago@arago-project.org>; Wed, 1 Nov 2017 10:13:51 -0500
Received: from DLEE103.ent.ti.com (157.170.170.33) by DLEE101.ent.ti.com
	(157.170.170.31) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id 15.1.845.34;
	Wed, 1 Nov 2017 10:13:51 -0500
Received: from dflp32.itg.ti.com (10.64.6.15) by DLEE103.ent.ti.com
	(157.170.170.33) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.845.34 via Frontend
	Transport; Wed, 1 Nov 2017 10:13:50 -0500
Received: from udd0866934.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id vA1FDovE015538;
	Wed, 1 Nov 2017 10:13:50 -0500
From: Jacob Stiffler <j-stiffler@ti.com>
To: <meta-arago@arago-project.org>
Date: Wed, 1 Nov 2017 11:06:10 -0400
Message-ID: <1509548771-27947-1-git-send-email-j-stiffler@ti.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [RFC 1/2] recipe-data: add method get other recipe's info
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
X-List-Received-Date: Wed, 01 Nov 2017 15:13:51 -0000
Content-Type: text/plain

* This class provides a task to collect private recipe variables in
  such a way that can be used by other recipes.

Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
---
 meta-arago-distro/classes/recipe-data.bbclass | 91 +++++++++++++++++++++++++++
 1 file changed, 91 insertions(+)
 create mode 100644 meta-arago-distro/classes/recipe-data.bbclass

diff --git a/meta-arago-distro/classes/recipe-data.bbclass b/meta-arago-distro/classes/recipe-data.bbclass
new file mode 100644
index 0000000..d4dbfd3
--- /dev/null
+++ b/meta-arago-distro/classes/recipe-data.bbclass
@@ -0,0 +1,91 @@
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


