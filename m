Return-Path: <fcooper@ti.com>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by arago-project.org (Postfix) with ESMTPS id 8589D52A61
	for <meta-arago@arago-project.org>;
	Sat, 17 Nov 2012 18:38:22 +0000 (UTC)
Received: from dlelxv30.itg.ti.com ([172.17.2.17])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id qAHIcLxV011506;
	Sat, 17 Nov 2012 12:38:21 -0600
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dlelxv30.itg.ti.com (8.13.8/8.13.8) with ESMTP id qAHIcL3C009147;
	Sat, 17 Nov 2012 12:38:21 -0600
Received: from DFLE09.ent.ti.com ([fe80::3103:58c3:47f:860b]) by
	DFLE72.ent.ti.com ([fe80::5c48:b90d:af93:5822%30]) with mapi id
	14.01.0323.003; Sat, 17 Nov 2012 12:38:21 -0600
From: "Cooper Jr., Franklin" <fcooper@ti.com>
To: "Franklin S. Cooper Jr" <fcooperjr27@gmail.com>,
	"meta-arago@arago-project.org" <meta-arago@arago-project.org>
Thread-Topic: [PATCH] meta-toolchain-arago: Substitute dirname statement
Thread-Index: AQHNxPGeqR/vMWIeuEKx+Ce1dCfadpfuWYxQ
Date: Sat, 17 Nov 2012 18:38:20 +0000
Message-ID: <8F29D6B095ED194EA1980491A5E029710C3232F3@DFLE09.ent.ti.com>
References: <1353177014-1258-1-git-send-email-fcooper@ti.com>
In-Reply-To: <1353177014-1258-1-git-send-email-fcooper@ti.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [157.170.170.90]
MIME-Version: 1.0
Subject: Re: [PATCH] meta-toolchain-arago: Substitute dirname statement
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
X-List-Received-Date: Sat, 17 Nov 2012 18:38:22 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

For now just looking for comments while I do final testing.

FYI the statements I am implementing are:
# getting the filename from the entire file path. Similar to basename.
filename=3D`echo ${BASH_SOURCE##*/}`
# Looking at the entire file path replace $filename with "" but only replac=
e the last occurrence of $filename
dirname=3D${BASH_SOURCE/%$filename/}
. $dirname../environment-setup


-----Original Message-----
From: Franklin S. Cooper Jr [mailto:fcooperjr27@gmail.com]=20
Sent: Saturday, November 17, 2012 12:30 PM
To: meta-arago@arago-project.org
Cc: Cooper Jr., Franklin
Subject: [PATCH] meta-toolchain-arago: Substitute dirname statement

* On 32bit systems, the dirname statement sometimes return an empty string.
* Replace dirname with several statements that provide the same result.

Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
---
 .../recipes-core/meta/meta-toolchain-arago.bb      |   14 +++++++++++---
 1 files changed, 11 insertions(+), 3 deletions(-)

diff --git a/meta-arago-extras/recipes-core/meta/meta-toolchain-arago.bb b/=
meta-arago-extras/recipes-core/meta/meta-toolchain-arago.bb
index c24fb7e..590aa9c 100644
--- a/meta-arago-extras/recipes-core/meta/meta-toolchain-arago.bb
+++ b/meta-arago-extras/recipes-core/meta/meta-toolchain-arago.bb
@@ -4,7 +4,7 @@ TOOLCHAIN_OUTPUTNAME ?=3D "${SDK_NAME}-${ARMPKGARCH}-${TARG=
ET_OS}-sdk-${SDK_ARCH}"
=20
 require recipes-core/meta/meta-toolchain.bb
=20
-PR =3D "r9"
+PR =3D "r10"
=20
 SDKTARGETSYSROOT =3D "${SDKPATH}/${ARAGO_TARGET_SYS}"
=20
@@ -61,7 +61,11 @@ toolchain_create_sdk_env_script () {  create_gdb_stub ()=
 {
 	# Special case for gdb, that is built as part of canadian-cross-sdk
 	mv ${ARAGO_TARGET_SYS}-gdb ${ARAGO_TARGET_SYS}-gdb.real
-	printf "#!/bin/sh\nif [ -n \x22\x24BASH_SOURCE\x22 ]; then\n\t. \x60dirna=
me \x24BASH_SOURCE\x60/../environment-setup\nfi\n" > ${ARAGO_TARGET_SYS}-gd=
b
+	printf "#!/bin/sh\nif [ -n \x22\x24BASH_SOURCE\x22 ]; then\n" > ${ARAGO_T=
ARGET_SYS}-gdb
+	printf "\tfilename\x3D\x60echo \x24\x7BBASH_SOURCE\x23\x23\x2A\x2F\x7D\x6=
0\n" >> ${ARAGO_TARGET_SYS}-gdb
+	printf "\tdirname\x3D\x24\x7BBASH_SOURCE\x2F\x25\x24filename\x2F\x7D\n" >=
> ${ARAGO_TARGET_SYS}-gdb
+	printf "\t\x2E \x24dirname\x2E\x2E\x2Fenvironment-setup\n" >> ${ARAGO_TAR=
GET_SYS}-gdb
+	printf "fi\n" >> ${ARAGO_TARGET_SYS}-gdb
 	printf "LD_LIBRARY_PATH=3D\x24SDK_PATH/lib:\x24LD_LIBRARY_PATH \x24SDK_PA=
TH/lib/ld-linux.so.2 \x24SDK_PATH/bin/${ARAGO_TARGET_SYS}-gdb.real \x24\x2a=
\n" >> ${ARAGO_TARGET_SYS}-gdb
 	chmod +x ${ARAGO_TARGET_SYS}-gdb
 }
@@ -71,7 +75,11 @@ populate_sdk_ipk_append () {
 	binfiles=3D`find ! -name "${ARAGO_TARGET_SYS}-*" -type f -perm +111 -exec=
 file {} \;|grep -v ":.*ASCII.*text"|cut -d":" -f1|cut -c3-`
 	for i in $binfiles; do
 		mv $i $i.real
-		printf "#!/bin/sh\nif [ -n \x22\x24BASH_SOURCE\x22 ]; then\n\t. \x60dirn=
ame \x24BASH_SOURCE\x60/../environment-setup\nfi\n" > $i
+		printf "#!/bin/sh\nif [ -n \x22\x24BASH_SOURCE\x22 ]; then\n" > $i
+		printf "\tfilename\x3D\x60echo \x24\x7BBASH_SOURCE\x23\x23\x2A\x2F\x7D\x=
60\n" >> $i
+		printf "\tdirname\x3D\x24\x7BBASH_SOURCE\x2F\x25\x24filename\x2F\x7D\n" =
>> $i
+		printf "\t\x2E \x24dirname\x2E\x2E\x2Fenvironment-setup\n" >> $i
+		printf "fi\n" >> $i
 		printf "LD_LIBRARY_PATH=3D\x24SDK_PATH/lib:\x24LD_LIBRARY_PATH \x24SDK_P=
ATH/lib/ld-linux.so.2 \x24SDK_PATH/bin/$i.real \x24\x2a\n" >> $i
 		chmod +x $i
 	done
--
1.7.0.4


