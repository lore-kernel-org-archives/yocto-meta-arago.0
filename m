Return-Path: <a0866934local@udb0866934>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by arago-project.org (Postfix) with ESMTPS id 880D752A67
	for <meta-arago@arago-project.org>;
	Mon,  9 Mar 2015 17:55:11 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id t29HtAxo025070
	for <meta-arago@arago-project.org>; Mon, 9 Mar 2015 12:55:10 -0500
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id t29Ht9Zh019050
	for <meta-arago@arago-project.org>; Mon, 9 Mar 2015 12:55:09 -0500
Received: from dflp32.itg.ti.com (10.64.6.15) by DLEE71.ent.ti.com
	(157.170.170.114) with Microsoft SMTP Server id 14.3.224.2;
	Mon, 9 Mar 2015 12:55:09 -0500
Received: from udb0866934 (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id t29Ht9n8032697;
	Mon, 9 Mar 2015 12:55:09 -0500
Received: from a0866934local by udb0866934 with local (Exim 4.76)
	(envelope-from <a0866934local@udb0866934>)	id 1YV1tV-0001mR-6C;
	Mon, 09 Mar 2015 13:55:09 -0400
From: Jacob Stiffler <j-stiffler@ti.com>
To: <meta-arago@arago-project.org>
Date: Mon, 9 Mar 2015 13:55:03 -0400
Message-ID: <1425923703-6810-1-git-send-email-j-stiffler@ti.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Subject: [PATCH v3] tisdk-image: Fix manifest generation for nativesdk.
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
X-List-Received-Date: Mon, 09 Mar 2015 17:55:11 -0000
Content-Type: text/plain

The software manifest is created by parsing the *.control files in the images /var/lib/opkg directory. For the nativesdk sysroot, there are some cases where the control files are not present. The reason for this and the specific circumstances of when this occurs has not yet been root caused.

When this does happen, the "Development Host Content" tables of the manifest are not valid. However, the package indexes are present. These contain all of the information in the control files, only concatenated together in a large file. This patch will split up these package indexes into individual control files which will allow the previous parsing to produce a valid output.

Here is an example of the invalid output when the control files are not present:

<h2><u>Development Host Content</u></h2>
<p>This table describes any software being delivered that is expected to run on a Development Host, instead of the target device.  Some of this software may be licensed under GPLv3 but it is not expected to be shipped as a product.</p>

<table border=1 cellspacing=1 cellpadding=1 width=80%>
<tr bgcolor=#c0c0c0  color=white>
    <td><b>Software Name</b></td>
    <td><b>Version</b></td>
    <td><b>License</b></td>
    <td><b>Location</b></td>
    <td><b>Delivered As</b></td>
    <td><b>Modified by TI</b></td>
    <td><b>Obtained from</b></td>
</tr>

<tr>
    <td> </td>
    <td></td>
    <td ></td>
    <td>__.ipk</td>
    <td>Binary</td>
    <td>No</td>
    <td></td>
</tr>

Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
---
 meta-arago-distro/classes/tisdk-image.bbclass |   37 +++++++++++++++++++++++++
 1 file changed, 37 insertions(+)

diff --git a/meta-arago-distro/classes/tisdk-image.bbclass b/meta-arago-distro/classes/tisdk-image.bbclass
index 3030a38..747670f 100644
--- a/meta-arago-distro/classes/tisdk-image.bbclass
+++ b/meta-arago-distro/classes/tisdk-image.bbclass
@@ -353,6 +353,43 @@ echo "
 </tr>
 " >> ${SW_MANIFEST_FILE}
 
+    control_files_there=0
+    for possible_control_file in $control_dir/*.control
+    do
+        if [ -f $possible_control_file ]
+        then
+            control_files_there=1
+            break
+        fi
+    done
+
+    if [ $control_files_there -eq 0 ]
+    then
+        for pkg_idx in $control_dir/oe*; do
+            package_start=`grep -n "^Package" $pkg_idx || true`
+
+            IFS_OLD=${IFS}
+            IFS="
+"
+
+            for pkg in ${package_start}; do
+                end=`echo $pkg | cut -d: -f1`
+
+                if [ -z $begin ]; then
+                    pkg_name=`echo $pkg | cut -d: -f3`
+                    begin=`echo $pkg | cut -d: -f1`
+                    continue
+                fi
+                cnt=$[$cnt+1]
+                head -n $[$end - 1] $pkg_idx | tail -n $[$end - $begin] > ${control_dir}/${pkg_name// /}.control
+
+                pkg_name=`echo $pkg | cut -d: -f3`
+                begin=$end
+            done
+            IFS=${IFS_OLD}
+        done
+    fi
+
     for i in $control_dir/*.control
     do
         package="`cat $i | grep Package: | awk {'print $2'}`"
-- 
1.7.9.5


