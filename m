Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web11.2613.1642626454329852958
 for <meta-arago@lists.yoctoproject.org>;
 Wed, 19 Jan 2022 13:07:34 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 47EAC40C2E;
	Wed, 19 Jan 2022 21:02:26 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id RnxBqYNltVMt; Wed, 19 Jan 2022 21:02:26 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net [100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 1BEBF40951;
	Wed, 19 Jan 2022 21:02:23 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 6CEF2174720; Wed, 19 Jan 2022 16:02:22 -0500 (EST)
Date: Wed, 19 Jan 2022 16:02:22 -0500
From: "Denys Dmytriyenko" <denis@denix.org>
To: Ryan Eatmon <reatmon@ti.com>
Cc: Yogesh Siraswar <yogeshs@ti.com>, Praneeth Bajjuri <praneeth@ti.com>,
	meta-arago@lists.yoctoproject.org
Subject: Re: [EXTERNAL] Re: [meta-arago][dunfell-next][PATCH] dma-heap-tests: patch to fix cmake linking issue
Message-ID: <20220119210222.GR26229@denix.org>
References: <20220114195303.26088-1-reatmon@ti.com>
 <20220114221249.GK26229@denix.org>
 <8c872597-e0db-f58d-55be-d6a1bad7e52d@ti.com>
MIME-Version: 1.0
In-Reply-To: <8c872597-e0db-f58d-55be-d6a1bad7e52d@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Thanks. In that case you might want to add:

Upstream-Status: Pending

It should be in the cmake patch itself, not in the recipe patch that includes 
the other one.

https://www.openembedded.org/wiki/Commit_Patch_Message_Guidelines#Patch_Header_Recommendations:_Upstream-Status


On Wed, Jan 19, 2022 at 02:55:19PM -0600, Ryan Eatmon wrote:
> 
> Yes, I'm going to send out a second version of this patch shortly.
> As for the upstream, we are working out how best in the long run to
> handle this packages upstream, but likely I will be doing a pull
> request to the github repository before the end of the week.
> 
> 
> On 1/14/2022 16:12, Denys Dmytriyenko wrote:
> >Looks good overall. Couple nit-picks:
> >
> >1. dunfell-next tag in the subject - should probably be dunfell/master instead?
> >2. what's the Upstream-Status: of the cmake patch?
> >
> >
> >On Fri, Jan 14, 2022 at 01:53:03PM -0600, Ryan Eatmon via lists.yoctoproject.org wrote:
> >>Adding patch to CMakeLists.txt to fix variable name that contains
> >>the libraries to link against.
> >>
> >>Signed-off-by: Ryan Eatmon <reatmon@ti.com>
> >>---
> >>  .../dma-heap/dma-heap-tests.bb                |  4 ++-
> >>  ...ble-name-change-to-fix-compile-error.patch | 32 +++++++++++++++++++
> >>  2 files changed, 35 insertions(+), 1 deletion(-)
> >>  create mode 100644 meta-arago-extras/recipes-devtools/dma-heap/dma-heap-tests/0001-Variable-name-change-to-fix-compile-error.patch
> >>
> >>diff --git a/meta-arago-extras/recipes-devtools/dma-heap/dma-heap-tests.bb b/meta-arago-extras/recipes-devtools/dma-heap/dma-heap-tests.bb
> >>index fab2b4a0..5d35eb5e 100644
> >>--- a/meta-arago-extras/recipes-devtools/dma-heap/dma-heap-tests.bb
> >>+++ b/meta-arago-extras/recipes-devtools/dma-heap/dma-heap-tests.bb
> >>@@ -6,7 +6,9 @@ LIC_FILES_CHKSUM = "file://src/heap_test_fixture.cpp;beginline=1;endline=15;md5=
> >>  PV = "1.0"
> >>  BRANCH = "master"
> >>-SRC_URI = "git://github.com/glneo/dma-heap-tests.git;protocol=https;branch=${BRANCH}"
> >>+SRC_URI = "git://github.com/glneo/dma-heap-tests.git;protocol=https;branch=${BRANCH} \
> >>+	file://0001-Variable-name-change-to-fix-compile-error.patch \
> >>+"
> >>  SRCREV = "bccbfbf24baccefa09439a924f61f04e82b3910a"
> >>  DEPENDS = "googletest"
> >>diff --git a/meta-arago-extras/recipes-devtools/dma-heap/dma-heap-tests/0001-Variable-name-change-to-fix-compile-error.patch b/meta-arago-extras/recipes-devtools/dma-heap/dma-heap-tests/0001-Variable-name-change-to-fix-compile-error.patch
> >>new file mode 100644
> >>index 00000000..8bc744db
> >>--- /dev/null
> >>+++ b/meta-arago-extras/recipes-devtools/dma-heap/dma-heap-tests/0001-Variable-name-change-to-fix-compile-error.patch
> >>@@ -0,0 +1,32 @@
> >>+From ab0bb27b915419e3f93b4c0102837e7e748b0667 Mon Sep 17 00:00:00 2001
> >>+From: Ryan Eatmon <reatmon@ti.com>
> >>+Date: Thu, 13 Jan 2022 20:00:27 -0600
> >>+Subject: [dma-heap-tests][PATCH] Variable name change to fix compile error.
> >>+
> >>+It appears that a recent change in the GTest CMake integration
> >>+changed the variable names for the libraries.  This fixes that
> >>+issue and makes the compile work under Yocto.
> >>+
> >>+Signed-off-by: Ryan Eatmon <reatmon@ti.com>
> >>+---
> >>+ CMakeLists.txt | 4 ++--
> >>+ 1 file changed, 2 insertions(+), 2 deletions(-)
> >>+
> >>+diff --git a/CMakeLists.txt b/CMakeLists.txt
> >>+index 71d7225..7d4a97f 100644
> >>+--- a/CMakeLists.txt
> >>++++ b/CMakeLists.txt
> >>+@@ -19,8 +19,8 @@ target_include_directories(dma-heap-unit-tests
> >>+ )
> >>+
> >>+ target_link_libraries(dma-heap-unit-tests
> >>+-	${GTEST_LIBRARY}
> >>+-	${GTEST_MAIN_LIBRARY}
> >>++    ${GTEST_LIBRARIES}
> >>++    ${GTEST_MAIN_LIBRARIES}
> >>+ 	pthread
> >>+ )
> >>+
> >>+--
> >>+2.17.1
> >>+
> >>-- 
> >>2.17.1
> >
> 
> -- 
> Ryan Eatmon
> reatmon@ti.com
> 

-- 
Regards,
Denys Dmytriyenko <denis@denix.org>
PGP: 0x420902729A92C964 - https://denix.org/0x420902729A92C964
Fingerprint: 25FC E4A5 8A72 2F69 1186  6D76 4209 0272 9A92 C964
