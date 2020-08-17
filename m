Return-Path: <j-stiffler@ti.com>
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
	by arago-project.org (Postfix) with ESMTPS id E64865296D
	for <meta-arago@arago-project.org>;
	Tue, 18 Aug 2020 13:10:37 +0000 (UTC)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 07ID7mvh109155
	for <meta-arago@arago-project.org>; Tue, 18 Aug 2020 08:07:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1597756068;
	bh=JPZ0V/0oEG3qBcOY9Qub7BASWumN3MI3aBTIbd1HYd8=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=Js2FisAzqcSzAt0AtBd/xnVu+rTszdPy2f+AokIMP37Rlkzk2+T22D92mlLrkejlv
	D8WNzD/mOIcTdH6//KKCCoZQoiSxVV6ZtOn5joksCK+8L01DjLYoIz4X1oqyHDPt6q
	BPuOiUc2PhSVASn1S0Z/khUwLBDqzoWPZc3jY+N0=
Received: from DLEE108.ent.ti.com (dlee108.ent.ti.com [157.170.170.38])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 07ID7mJr085237
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Tue, 18 Aug 2020 08:07:48 -0500
Received: from DLEE111.ent.ti.com (157.170.170.22) by DLEE108.ent.ti.com
	(157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3;
	Tue, 18 Aug 2020 08:07:47 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE111.ent.ti.com
	(157.170.170.22) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
	Frontend Transport; Tue, 18 Aug 2020 08:07:47 -0500
Received: from udd0866934.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 07ID7l7C076339;
	Tue, 18 Aug 2020 08:07:47 -0500
From: Jacob Stiffler <j-stiffler@ti.com>
To: <meta-arago@arago-project.org>
Date: Mon, 17 Aug 2020 14:22:58 -0400
Message-ID: <1597688579-8793-2-git-send-email-j-stiffler@ti.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1597688579-8793-1-git-send-email-j-stiffler@ti.com>
References: <1597688579-8793-1-git-send-email-j-stiffler@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [master/dunfell][PATCH 2/3] tisdk-bundle: use recipe-data for sw manifest
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
X-List-Received-Date: Tue, 18 Aug 2020 13:10:38 -0000
Content-Type: text/plain

* Use the recipe-data class to collect the SRC_URI for the software
  manifest.

Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
---
 meta-arago-distro/classes/tisdk-bundle.bbclass | 44 ++++++++++++++++++++++++--
 1 file changed, 42 insertions(+), 2 deletions(-)

diff --git a/meta-arago-distro/classes/tisdk-bundle.bbclass b/meta-arago-distro/classes/tisdk-bundle.bbclass
index f180817..7e3f4c2 100644
--- a/meta-arago-distro/classes/tisdk-bundle.bbclass
+++ b/meta-arago-distro/classes/tisdk-bundle.bbclass
@@ -450,6 +450,43 @@ sw_manifest_host() {
     sw_manifest_table_footer
 }
 
+# Use the recipe-data class to collect SRC_URI for the manifest.
+#
+# While this will need to be globally INHERIT'd to work properly, inherit
+# locally so that parsing does not fail.
+inherit recipe-data
+
+# Instead of re-adding the do_rootfs task, re-add the do_emit_recipe_data_all
+#  task to run before do_rootfs.
+deltask do_emit_recipe_data_all
+
+# There seems to be something special with the rootfs task and task dependencies
+# are not working as expected, so use the install task instead.
+addtask emit_recipe_data_all after do_emit_recipe_data before do_install
+
+get_sources_from_recipe(){
+    [ ! -z "$1" ] || return 0
+
+    # Check if a full URL is given (e.g. ipks from sourceipk class)
+    if [ $(echo "$1" | grep -c '://') -gt 0 ]
+    then
+        echo "$1"
+        return 0
+    fi
+
+    # Now assume that this was created by the package_ipk class
+
+    # Cannot assume that recipe filename is ${PN}_${PV}.bb
+    # This is easily seen with BBCLASSEXTEND recipes.
+    for pn in $(sed -ne 's|FILE_pn-\([^ \t=]*\)[ \t]*=[ \t]*".*/'$1'".*|\1|p' "${RECIPE_DATA_FILE}")
+    do
+        # Only need a single PN incase there are native, nativesdk, target variants.
+        break
+    done
+
+    recipe_data_get_var_sh "$pn" "SRC_URI"
+}
+
 # This function expects to be passed the following parameter
 #   - The location to the opkg info directory containing the control files
 #     of the installed packages
@@ -460,6 +497,9 @@ generate_sw_manifest_table() {
     control_dir="$1"
     gplv3_only="$2"
 
+    # Call this here so that the function gets added to the task script
+    get_sources_from_recipe
+
     if [ ! -d "$control_dir" ]
     then
         echo "Could not find the control directory ($control_dir)"
@@ -549,7 +589,8 @@ EOF
         long_version="`cat $i | grep Version: | awk {'print $2'}`"
         license="`cat $i | grep License: | cut -d: -f2 `"
         architecture="`cat $i | grep Architecture: | awk {'print $2'}`"
-        sources="`cat $i | grep Source: | cut -d ':' -f2-`"
+        recipe="`cat $i | grep Source: | cut -d ':' -f2-`"
+        sources="`get_sources_from_recipe $recipe`"
         location="$package""_""$long_version""_""$architecture"".ipk"
 
         # Set the highlight color if the license in GPLv3.  If this is
@@ -639,7 +680,6 @@ cat >> ${SW_MANIFEST_TEXT} << EOF
 EOF
 
 }
-
 # Generate the TI SW Manifest for the SDK image
 generate_sw_manifest() {
     sw_manifest_header
-- 
2.7.4


