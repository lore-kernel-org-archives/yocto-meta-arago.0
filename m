Return-Path: <j-stiffler@ti.com>
Received: from fllnx209.ext.ti.com (fllnx209.ext.ti.com [198.47.19.16])
	by arago-project.org (Postfix) with ESMTPS id 9FF6952992
	for <meta-arago@arago-project.org>;
	Wed,  1 Nov 2017 15:14:07 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by fllnx209.ext.ti.com (8.15.1/8.15.1) with ESMTP id vA1FDviS013921
	for <meta-arago@arago-project.org>; Wed, 1 Nov 2017 10:13:57 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1509549237;
	bh=LQAXfs7ISjOIeyibMhXJiOi9shjkO7SQjGiRHMy7j0M=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=A11oVtJYwZ7eh39hM6ougWpbFPnwr2/7f8fXR5s8uqqcIbh5K4C4oFBXS/kJvbvfn
	L1SQqujNHAePFk9R5fpdkIHJXaQ55ta4s/cZ/SqpezF44izC3LiF7fjzjY+Ooh2rm6
	nZW/Bm2hjvCS6Ymm88q0kkRgGgYOzvVHaaSSZUNg=
Received: from DLEE109.ent.ti.com (dlee109.ent.ti.com [157.170.170.41])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id vA1FDqFi010748
	for <meta-arago@arago-project.org>; Wed, 1 Nov 2017 10:13:52 -0500
Received: from DLEE105.ent.ti.com (157.170.170.35) by DLEE109.ent.ti.com
	(157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id 15.1.845.34;
	Wed, 1 Nov 2017 10:13:52 -0500
Received: from dflp32.itg.ti.com (10.64.6.15) by DLEE105.ent.ti.com
	(157.170.170.35) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.845.34 via Frontend
	Transport; Wed, 1 Nov 2017 10:13:52 -0500
Received: from udd0866934.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id vA1FDovF015538;
	Wed, 1 Nov 2017 10:13:52 -0500
From: Jacob Stiffler <j-stiffler@ti.com>
To: <meta-arago@arago-project.org>
Date: Wed, 1 Nov 2017 11:06:11 -0400
Message-ID: <1509548771-27947-2-git-send-email-j-stiffler@ti.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1509548771-27947-1-git-send-email-j-stiffler@ti.com>
References: <1509548771-27947-1-git-send-email-j-stiffler@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [RFC 2/2] tisdk-image: use recipe-data.bbclass to get sources
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
X-List-Received-Date: Wed, 01 Nov 2017 15:14:07 -0000
Content-Type: text/plain

Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
---

This mostly works except for adding the 'do_emit_recipe_data_all' as
a dependency for the do_rootfs task.

 meta-arago-distro/classes/tisdk-image.bbclass | 26 +++++++++++++++++++++++++-
 meta-arago-distro/conf/distro/arago.conf      |  3 +++
 2 files changed, 28 insertions(+), 1 deletion(-)

diff --git a/meta-arago-distro/classes/tisdk-image.bbclass b/meta-arago-distro/classes/tisdk-image.bbclass
index 0a0c570..8a91268 100644
--- a/meta-arago-distro/classes/tisdk-image.bbclass
+++ b/meta-arago-distro/classes/tisdk-image.bbclass
@@ -85,6 +85,8 @@ do_rootfs[depends] += "${@string_set('%s:do_image_complete' % pn for pn in (d.ge
 # available for packaging
 do_rootfs[depends] += "${@string_set('%s:do_populate_sdk' % pn for pn in (d.getVar("TISDK_TOOLCHAIN", True) or "").split())}"
 
+# Add dependency to collect recipe data for dependencies
+do_rootfs[recrdeptask] += "do_emit_recipe_data_all"
 do_rootfs[nostamp] = "1"
 do_rootfs[lockfiles] += "${IMAGE_ROOTFS}.lock"
 do_rootfs[cleandirs] += "${S}"
@@ -447,6 +449,24 @@ sw_manifest_host() {
     sw_manifest_table_footer
 }
 
+
+get_sources_from_recipe(){
+    [ ! -z "$1" ] || return 0
+
+    supported=${@bb.utils.contains('RECIPE_DATA_VARS', 'SRC_URI', 'yes', 'no', d)}
+    if [ "$supported" != "yes" ]
+    then
+        echo "$1"
+        return
+    fi
+
+    pn=$(echo "$1" | sed -e 's|_.*$||')
+
+    [ ! -z "$pn" ] || bbwarn "cannot find $1"
+
+    sed -ne 's|SRC_URI_pn-'$pn'[ \t]*=[ \t]*"\([^"]*\)"|\1|p' ${RECIPE_DATA_FILE}
+}
+
 # This function expects to be passed the following parameter
 #   - The location to the opkg info directory containing the control files
 #     of the installed packages
@@ -457,6 +477,9 @@ generate_sw_manifest_table() {
     control_dir="$1"
     gplv3_only="$2"
 
+    # Call this here so that the function gets added to the task script
+    get_sources_from_recipe
+
     if [ ! -d "$control_dir" ]
     then
         echo "Could not find the control directory ($control_dir)"
@@ -546,7 +569,8 @@ EOF
         long_version="`cat $i | grep Version: | awk {'print $2'}`"
         license="`cat $i | grep License: | cut -d: -f2 `"
         architecture="`cat $i | grep Architecture: | awk {'print $2'}`"
-        sources="`cat $i | grep Source: | cut -d ':' -f2-`"
+        recipe="`cat $i | grep Source: | cut -d ':' -f2-`"
+        sources="`get_sources_from_recipe $recipe`"
         location="$package""_""$long_version""_""$architecture"".ipk"
 
         # Set the highlight color if the license in GPLv3.  If this is
diff --git a/meta-arago-distro/conf/distro/arago.conf b/meta-arago-distro/conf/distro/arago.conf
index c13e0b8..aa49413 100644
--- a/meta-arago-distro/conf/distro/arago.conf
+++ b/meta-arago-distro/conf/distro/arago.conf
@@ -130,6 +130,9 @@ require conf/distro/include/toolchain-${TOOLCHAIN_TYPE}.inc
 #TARGET_CPPFLAGS += "-fstack-protector -D_FORTIFY_SOURCE=1"
 #TARGET_CPPFLAGS += "-fstack-protector"
 
+# Needed for SW manifest generation in tisdk-image.bbclass
+INHERIT += "recipe-data"
+
 # Load default preferences
 require conf/distro/include/arago-prefs.inc
 
-- 
2.7.4


