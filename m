Return-Path: <aja@survision.fr>
Received: from mo69.mail-out.ovh.net (1.mo69.mail-out.ovh.net [178.33.251.173])
	by arago-project.org (Postfix) with ESMTP id 8828352972
	for <meta-arago@arago-project.org>;
	Fri, 22 Aug 2014 06:46:17 +0000 (UTC)
Received: from mail425.ha.ovh.net (gw6.ovh.net [213.251.189.206])
	by mo69.mail-out.ovh.net (Postfix) with SMTP id 58372100C0EA
	for <meta-arago@arago-project.org>;
	Fri, 22 Aug 2014 08:46:12 +0200 (CEST)
Received: from b0.ovh.net (HELO queueout) (213.186.33.50)
	by b0.ovh.net with SMTP; 22 Aug 2014 08:46:12 +0200
Received: from laubervilliers-656-01-35-73.w217-128.abo.wanadoo.fr (HELO
	?192.168.50.78?) (arnaud.janvier@survision.fr@217.128.91.73)
	by ns0.ovh.net with SMTP; 22 Aug 2014 08:46:10 +0200
Message-ID: <53F6E737.4080208@survision.fr>
Date: Fri, 22 Aug 2014 08:46:15 +0200
From: Arnaud Janvier <aja@survision.fr>
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64;
	rv:24.0) Gecko/20100101 Thunderbird/24.6.0
MIME-Version: 1.0
To: meta-arago@arago-project.org
X-Ovh-Tracer-Id: 16659377972720878787
X-Ovh-Remote: 217.128.91.73
	(laubervilliers-656-01-35-73.w217-128.abo.wanadoo.fr)
X-Ovh-Local: 213.186.33.20 (ns0.ovh.net)
X-OVH-SPAMSTATE: OK
X-OVH-SPAMSCORE: -100
X-OVH-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrfeejfedrkeefucetufdoteggodetrfcurfhrohhfihhlvgemucfqggfjnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
X-Spam-Check: DONE|U 0.5/N
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrfeejfedrkeefucetufdoteggodetrfcurfhrohhfihhlvgemucfqggfjnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
Subject: [PATCH] binutils: Fix documentation build error with Texinfo 5
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
X-List-Received-Date: Fri, 22 Aug 2014 06:46:17 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Newer versions of Texinfo have problems to build binutils documentation.
This patch fixes the build issue seen on Ubuntu 14.04 distribution.
---
  .../binutils-2.20.1/binutils-texinfo-5.0.patch     | 42 
++++++++++++++++++++++
  .../recipes-devtools/binutils/binutils_2.20.1.bb   |  1 +
  2 files changed, 43 insertions(+)
  create mode 100644 
meta-arago-extras/recipes-devtools/binutils/binutils-2.20.1/binutils-texinfo-5.0.patch

diff --git 
a/meta-arago-extras/recipes-devtools/binutils/binutils-2.20.1/binutils-texinfo-5.0.patch 
b/meta-arago-extras/recipes-devtools/binutils/binutils-2.20.1/binutils-texinfo-5.0.patch
new file mode 100644
index 0000000..7de8e55
--- /dev/null
+++ 
b/meta-arago-extras/recipes-devtools/binutils/binutils-2.20.1/binutils-texinfo-5.0.patch
@@ -0,0 +1,42 @@
+diff -Nru binutils-2.20.1.orig/bfd/doc/bfd.texinfo 
binutils-2.20.1/bfd/doc/bfd.texinfo
+--- binutils-2.20.1.orig/bfd/doc/bfd.texinfo	2009-09-02 
09:18:38.000000000 +0200
++++ binutils-2.20.1/bfd/doc/bfd.texinfo	2014-06-05 08:51:35.897319775 +0200
+@@ -323,7 +323,7 @@
+ @printindex cp
+ + @tex
+-% I think something like @colophon should be in texinfo.  In the
++% I think something like @@colophon should be in texinfo.  In the
+ % meantime:
+ \long\def\colophon{\hbox to0pt{}\vfill
+ \centerline{The body of this manual is set in}
+@@ -334,7 +334,7 @@
+ \centerline{{\sl\fontname\tensl\/}}
+ \centerline{are used for emphasis.}\vfill}
+ \page\colophon
+-% Blame: doc@cygnus.com, 28mar91.
++% Blame: doc@@cygnus.com, 28mar91.
+ @end tex
+ + @bye
+diff -Nru binutils-2.20.1.orig/ld/ld.texinfo binutils-2.20.1/ld/ld.texinfo
+--- binutils-2.20.1.orig/ld/ld.texinfo	2014-06-05 09:26:41.049356076 +0200
++++ binutils-2.20.1/ld/ld.texinfo	2014-06-04 18:10:49.305840598 +0200
+@@ -7521,7 +7521,7 @@
+ @printindex cp
+ + @tex
+-% I think something like @colophon should be in texinfo.  In the
++% I think something like @@colophon should be in texinfo.  In the
+ % meantime:
+ \long\def\colophon{\hbox to0pt{}\vfill
+ \centerline{The body of this manual is set in}
+@@ -7532,7 +7532,7 @@
+ \centerline{{\sl\fontname\tensl\/}}
+ \centerline{are used for emphasis.}\vfill}
+ \page\colophon
+-% Blame: doc@cygnus.com, 28mar91.
++% Blame: doc@@cygnus.com, 28mar91.
+ @end tex
+ + @bye
diff --git 
a/meta-arago-extras/recipes-devtools/binutils/binutils_2.20.1.bb 
b/meta-arago-extras/recipes-devtools/binutils/binutils_2.20.1.bb
index d0f889c..dd7e640 100644
--- a/meta-arago-extras/recipes-devtools/binutils/binutils_2.20.1.bb
+++ b/meta-arago-extras/recipes-devtools/binutils/binutils_2.20.1.bb
@@ -34,6 +34,7 @@ SRC_URI = "\
       file://200_elflink_%B_fixes.patch \
       file://201_elflink_improve_noaddneeded_errors.patch \
       file://202_elflink_noaddneeded_vs_weak.patch \
+     file://binutils-texinfo-5.0.patch \
       "
   SRC_URI[md5sum] = "2b9dc8f2b7dbd5ec5992c6e29de0b764"
-- 
1.9.1




