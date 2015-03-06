Return-Path: <j-stiffler@ti.com>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by arago-project.org (Postfix) with ESMTPS id 1860F52A65
	for <meta-arago@arago-project.org>;
	Fri,  6 Mar 2015 14:27:23 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id t26ERMN6013762
	for <meta-arago@arago-project.org>; Fri, 6 Mar 2015 08:27:22 -0600
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id t26ERLkh031915
	for <meta-arago@arago-project.org>; Fri, 6 Mar 2015 08:27:21 -0600
Received: from DFLE09.ent.ti.com ([fe80::7090:147d:b5eb:4c12]) by
	DFLE72.ent.ti.com ([fe80::e5e2:bab6:34dc:a483%28]) with mapi id
	14.03.0224.002; Fri, 6 Mar 2015 08:27:21 -0600
From: "Stiffler, Jacob" <j-stiffler@ti.com>
To: "meta-arago@arago-project.org" <meta-arago@arago-project.org>
Thread-Topic: [PATCH] tisdk-image: Fix manifest generation for nativesdk.
Thread-Index: AQHQWBPAVt5owz/UAE+rmdZYe06Mv50PfkZw
Date: Fri, 6 Mar 2015 14:27:20 +0000
Message-ID: <4B26FB5A64EBA14C87266869E037F958141058E2@DFLE09.ent.ti.com>
References: <1425649501-28658-1-git-send-email-j-stiffler@ti.com>
In-Reply-To: <1425649501-28658-1-git-send-email-j-stiffler@ti.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [128.247.5.50]
MIME-Version: 1.0
Subject: Re: [PATCH] tisdk-image: Fix manifest generation for nativesdk.
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
X-List-Received-Date: Fri, 06 Mar 2015 14:27:23 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Please disregard this. I will submit a v2.

This will only check "oe-*-nativesdk" package indexes when it should check =
all "oe*" package indexes.

- Jake

-----Original Message-----
From: Stiffler, Jacob=20
Sent: Friday, March 06, 2015 8:45 AM
To: meta-arago@arago-project.org
Cc: Stiffler, Jacob
Subject: [PATCH] tisdk-image: Fix manifest generation for nativesdk.

* The manifest is automatically generated based on *.control
  files found within the various images.
* The control files for the nativesdk image have gone missing.
* Work around this by regenerating the control files from the
  package index.

Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
---
 meta-arago-distro/classes/tisdk-image.bbclass |   37 +++++++++++++++++++++=
++++
 1 file changed, 37 insertions(+)

diff --git a/meta-arago-distro/classes/tisdk-image.bbclass b/meta-arago-dis=
tro/classes/tisdk-image.bbclass
index 3030a38..aedba83 100644
--- a/meta-arago-distro/classes/tisdk-image.bbclass
+++ b/meta-arago-distro/classes/tisdk-image.bbclass
@@ -353,6 +353,43 @@ echo "
 </tr>
 " >> ${SW_MANIFEST_FILE}
=20
+    control_files_there=3D0
+    for possible_control_file in $control_dir/*.control
+    do
+        if [ -f $possible_control_file ]
+        then
+            control_files_there=3D1
+            break
+        fi
+    done
+
+    if [ $control_files_there -eq 0 ]
+    then
+        for idx in $control_dir/oe-*-nativesdk; do
+            package_start=3D`grep -n "^Package" $idx`
+
+            IFS_OLD=3D${IFS}
+            IFS=3D"
+"
+
+            for pkg in ${package_start}; do
+                end=3D`echo $pkg | cut -d: -f1`
+
+                if [ -z $begin ]; then
+                    pkg_name=3D`echo $pkg | cut -d: -f3`
+                    begin=3D`echo $pkg | cut -d: -f1`
+                    continue
+                fi
+                cnt=3D$[$cnt+1]
+                head -n $[$end - 1] $idx | tail -n $[$end - $begin] > ${co=
ntrol_dir}/${pkg_name// /}.control
+
+                pkg_name=3D`echo $pkg | cut -d: -f3`
+                begin=3D$end
+            done
+            IFS=3D${IFS_OLD}
+        done
+    fi
+
     for i in $control_dir/*.control
     do
         package=3D"`cat $i | grep Package: | awk {'print $2'}`"
--=20
1.7.9.5


