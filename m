Return-Path: <a0866934local@udb0866934>
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by arago-project.org (Postfix) with ESMTPS id F319E529AF
	for <meta-arago@arago-project.org>;
	Fri,  6 Mar 2015 13:45:06 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id t26Dj6nP017935
	for <meta-arago@arago-project.org>; Fri, 6 Mar 2015 07:45:06 -0600
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id t26Dj4oL029242
	for <meta-arago@arago-project.org>; Fri, 6 Mar 2015 07:45:04 -0600
Received: from dflp32.itg.ti.com (10.64.6.15) by DFLE72.ent.ti.com
	(128.247.5.109) with Microsoft SMTP Server id 14.3.224.2;
	Fri, 6 Mar 2015 07:45:04 -0600
Received: from udb0866934 (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id t26Dj4rM005527;
	Fri, 6 Mar 2015 07:45:04 -0600
Received: from a0866934local by udb0866934 with local (Exim 4.76)
	(envelope-from <a0866934local@udb0866934>)	id 1YTsYq-0007Sp-7d;
	Fri, 06 Mar 2015 08:45:04 -0500
From: Jacob Stiffler <j-stiffler@ti.com>
To: <meta-arago@arago-project.org>
Date: Fri, 6 Mar 2015 08:45:01 -0500
Message-ID: <1425649501-28658-1-git-send-email-j-stiffler@ti.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Subject: [PATCH] tisdk-image: Fix manifest generation for nativesdk.
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
X-List-Received-Date: Fri, 06 Mar 2015 13:45:07 -0000
Content-Type: text/plain

* The manifest is automatically generated based on *.control
  files found within the various images.
* The control files for the nativesdk image have gone missing.
* Work around this by regenerating the control files from the
  package index.

Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
---
 meta-arago-distro/classes/tisdk-image.bbclass |   37 +++++++++++++++++++++++++
 1 file changed, 37 insertions(+)

diff --git a/meta-arago-distro/classes/tisdk-image.bbclass b/meta-arago-distro/classes/tisdk-image.bbclass
index 3030a38..aedba83 100644
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
+        for idx in $control_dir/oe-*-nativesdk; do
+            package_start=`grep -n "^Package" $idx`
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
+                head -n $[$end - 1] $idx | tail -n $[$end - $begin] > ${control_dir}/${pkg_name// /}.control
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


