Return-Path: <j-stiffler@ti.com>
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by arago-project.org (Postfix) with ESMTPS id 12B675297F
	for <meta-arago@arago-project.org>;
	Fri, 13 Mar 2015 10:47:31 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id t2DAlUbP014551
	for <meta-arago@arago-project.org>; Fri, 13 Mar 2015 05:47:30 -0500
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id t2DAlSpe032107
	for <meta-arago@arago-project.org>; Fri, 13 Mar 2015 05:47:29 -0500
Received: from DFLE09.ent.ti.com ([fe80::7090:147d:b5eb:4c12]) by
	DFLE72.ent.ti.com ([fe80::e5e2:bab6:34dc:a483%28]) with mapi id
	14.03.0224.002; Fri, 13 Mar 2015 05:47:28 -0500
From: "Stiffler, Jacob" <j-stiffler@ti.com>
To: "meta-arago@arago-project.org" <meta-arago@arago-project.org>
Thread-Topic: [PATCH v3] tisdk-image: Fix manifest generation for nativesdk.
Thread-Index: AQHQWpIvnQ97qoV2/Ueo1thvV/4TL50aQNCg
Date: Fri, 13 Mar 2015 10:47:28 +0000
Message-ID: <4B26FB5A64EBA14C87266869E037F958141088E7@DFLE09.ent.ti.com>
References: <1425923703-6810-1-git-send-email-j-stiffler@ti.com>
In-Reply-To: <1425923703-6810-1-git-send-email-j-stiffler@ti.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [128.247.5.50]
MIME-Version: 1.0
Subject: Re: [PATCH v3] tisdk-image: Fix manifest generation for nativesdk.
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
X-List-Received-Date: Fri, 13 Mar 2015 10:47:31 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Ping.=20

Anything preventing this from being committed? I have another patch on top =
of this to also support the text format.

Thanks,
Jake

-----Original Message-----
From: Stiffler, Jacob=20
Sent: Monday, March 09, 2015 1:55 PM
To: meta-arago@arago-project.org
Cc: Stiffler, Jacob
Subject: [PATCH v3] tisdk-image: Fix manifest generation for nativesdk.

The software manifest is created by parsing the *.control files in the imag=
es /var/lib/opkg directory. For the nativesdk sysroot, there are some cases=
 where the control files are not present. The reason for this and the speci=
fic circumstances of when this occurs has not yet been root caused.

When this does happen, the "Development Host Content" tables of the manifes=
t are not valid. However, the package indexes are present. These contain al=
l of the information in the control files, only concatenated together in a =
large file. This patch will split up these package indexes into individual =
control files which will allow the previous parsing to produce a valid outp=
ut.

Here is an example of the invalid output when the control files are not pre=
sent:

<h2><u>Development Host Content</u></h2> <p>This table describes any softwa=
re being delivered that is expected to run on a Development Host, instead o=
f the target device.  Some of this software may be licensed under GPLv3 but=
 it is not expected to be shipped as a product.</p>

<table border=3D1 cellspacing=3D1 cellpadding=3D1 width=3D80%> <tr bgcolor=
=3D#c0c0c0  color=3Dwhite>
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
 meta-arago-distro/classes/tisdk-image.bbclass |   37 +++++++++++++++++++++=
++++
 1 file changed, 37 insertions(+)

diff --git a/meta-arago-distro/classes/tisdk-image.bbclass b/meta-arago-dis=
tro/classes/tisdk-image.bbclass
index 3030a38..747670f 100644
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
+        for pkg_idx in $control_dir/oe*; do
+            package_start=3D`grep -n "^Package" $pkg_idx || true`
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
+                head -n $[$end - 1] $pkg_idx | tail -n $[$end - $begin]=20
+ > ${control_dir}/${pkg_name// /}.control
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
--
1.7.9.5


