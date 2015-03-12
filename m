Return-Path: <j-stiffler@ti.com>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by arago-project.org (Postfix) with ESMTPS id 88327529B3
	for <meta-arago@arago-project.org>;
	Thu, 12 Mar 2015 19:40:54 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id t2CJerT3000566;
	Thu, 12 Mar 2015 14:40:53 -0500
Received: from DLEE70.ent.ti.com (dlemailx.itg.ti.com [157.170.170.113])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id t2CJepaS030375;
	Thu, 12 Mar 2015 14:40:51 -0500
Received: from DFLE09.ent.ti.com ([fe80::7090:147d:b5eb:4c12]) by
	DLEE70.ent.ti.com ([fe80::c4c6:f618:54e7:ad11%28]) with mapi id
	14.03.0224.002; Thu, 12 Mar 2015 14:40:51 -0500
From: "Stiffler, Jacob" <j-stiffler@ti.com>
To: Denys Dmytriyenko <denis@denix.org>, "meta-arago@arago-project.org"
	<meta-arago@arago-project.org>
Thread-Topic: [meta-arago] [PATCH] ltp-ddt: fix yylex issue and __NR_*
	syscall	issue
Thread-Index: AQHQXPVIaMW+Xr6GCEexUyFlubrr7J0ZPtuQ
Date: Thu, 12 Mar 2015 19:40:51 +0000
Message-ID: <4B26FB5A64EBA14C87266869E037F9581410808B@DFLE09.ent.ti.com>
References: <1426186144-2658-1-git-send-email-denis@denix.org>
In-Reply-To: <1426186144-2658-1-git-send-email-denis@denix.org>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [128.247.5.50]
MIME-Version: 1.0
Subject: Re: [PATCH] ltp-ddt: fix yylex issue and __NR_* syscall	issue
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
X-List-Received-Date: Thu, 12 Mar 2015 19:40:55 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

ACK.

This fixes my local build.

-----Original Message-----
From: meta-arago-bounces@arago-project.org [mailto:meta-arago-bounces@arago=
-project.org] On Behalf Of Denys Dmytriyenko
Sent: Thursday, March 12, 2015 2:49 PM
To: meta-arago@arago-project.org
Subject: [meta-arago] [PATCH] ltp-ddt: fix yylex issue and __NR_* syscall i=
ssue

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 .../ltp-ddt/ltp-Do-not-link-against-libfl.patch    | 31 ++++++++++++++++++=
++++
 .../recipes-devtools/ltp-ddt/ltp-ddt_1.0.0.bb      | 12 ++++++++-
 2 files changed, 42 insertions(+), 1 deletion(-)  create mode 100644 meta-=
arago-extras/recipes-devtools/ltp-ddt/ltp-ddt/ltp-Do-not-link-against-libfl=
.patch

diff --git a/meta-arago-extras/recipes-devtools/ltp-ddt/ltp-ddt/ltp-Do-not-=
link-against-libfl.patch b/meta-arago-extras/recipes-devtools/ltp-ddt/ltp-d=
dt/ltp-Do-not-link-against-libfl.patch
new file mode 100644
index 0000000..3e4aa73
--- /dev/null
+++ b/meta-arago-extras/recipes-devtools/ltp-ddt/ltp-ddt/ltp-Do-not-link
+++ -against-libfl.patch
@@ -0,0 +1,31 @@
+From 5bda9c0af56869c6ff2c25d38ea087179c946bc6 Mon Sep 17 00:00:00 2001
+From: Chong Lu <Chong.Lu@windriver.com>
+Date: Tue, 11 Mar 2014 14:47:22 +0800
+Subject: [PATCH] ltp: Don't link against libfl
+
+We have already defined yywrap function in scan.l file. After this, we=20
+no longer need to link against libfl and so no longer get errors about und=
efined references to yylex.
+
+Upstream-status: Pending
+
+Signed-off-by: Chong Lu <Chong.Lu@windriver.com>
+---
+ pan/Makefile |    2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/pan/Makefile b/pan/Makefile index 4cc6466..a4b575b 100644
+--- a/pan/Makefile
++++ b/pan/Makefile
+@@ -31,7 +31,7 @@ CPPFLAGS		+=3D -Wno-error
+=20
+ CPPFLAGS		+=3D -I$(abs_srcdir)
+=20
+-LDLIBS			+=3D -lm $(LEXLIB)
++LDLIBS			+=3D -lm
+=20
+ LFLAGS			+=3D -l
+=20
+--
+1.7.9.5
+
diff --git a/meta-arago-extras/recipes-devtools/ltp-ddt/ltp-ddt_1.0.0.bb b/=
meta-arago-extras/recipes-devtools/ltp-ddt/ltp-ddt_1.0.0.bb
index f8c9da0..a31568c 100644
--- a/meta-arago-extras/recipes-devtools/ltp-ddt/ltp-ddt_1.0.0.bb
+++ b/meta-arago-extras/recipes-devtools/ltp-ddt/ltp-ddt_1.0.0.bb
@@ -16,7 +16,9 @@ PACKAGE_ARCH =3D "${MACHINE_ARCH}"
 SRCREV =3D "eef6281052f36f6fe41059eadcf3b4a94f0d85ea"
 BRANCH ?=3D "master"
=20
-SRC_URI =3D "git://arago-project.org/git/projects/test-automation/ltp-ddt.=
git;branch=3D${BRANCH}"
+SRC_URI =3D "git://arago-project.org/git/projects/test-automation/ltp-ddt.=
git;branch=3D${BRANCH} \
+    file://ltp-Do-not-link-against-libfl.patch \ "
=20
 S =3D "${WORKDIR}/git"
=20
@@ -66,6 +68,14 @@ do_configure_append() {
     (cd utils/ffsb-6.0-rc2; autoreconf -fvi; ./configure ${CONFIGUREOPTS})=
  }
=20
+# The makefiles make excessive use of make -C and several include=20
+testcases.mk # which triggers a build of the syscall header. To=20
+reproduce, build ltp, # then delete the header, then "make -j XX" and=20
+watch regen.sh run multiple # times. Its easier to generate this once here=
 instead.
+do_compile_prepend () {
+    ( make -C ${B}/testcases/kernel include/linux_syscall_numbers.h ) }
+
 do_compile_append () {
     unset CFLAGS CPPFLAGS CXXFLAGS LDFLAGS
     oe_runmake modules
--
2.2.0

_______________________________________________
meta-arago mailing list
meta-arago@arago-project.org
http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

