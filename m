Return-Path: <denys@ti.com>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.17])
	by arago-project.org (Postfix) with ESMTPS id 66F2E5298F
	for <meta-arago@arago-project.org>;
	Wed,  7 Feb 2018 20:33:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 471C020B5A;
	Wed,  7 Feb 2018 20:33:19 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo03-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id Jb6RWjLP3Ybn; Wed,  7 Feb 2018 20:33:19 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-85-143.washdc.fios.verizon.net
	[100.15.85.143])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 1DEAA200BB;
	Wed,  7 Feb 2018 20:33:18 +0000 (UTC)
Received: from gimli.denix (gimli [192.168.0.6])
	by mail.denix.org (Postfix) with ESMTP id CF238163284;
	Wed,  7 Feb 2018 15:33:17 -0500 (EST)
From: Denys Dmytriyenko <denys@ti.com>
To: meta-arago@arago-project.org
Date: Wed,  7 Feb 2018 15:33:01 -0500
Message-Id: <1518035594-38357-2-git-send-email-denys@ti.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1518035594-38357-1-git-send-email-denys@ti.com>
References: <1518035594-38357-1-git-send-email-denys@ti.com>
Subject: [rocko/master][PATCH 02/15] toolchain-linaro: update gcc and glibc versions
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
X-List-Received-Date: Wed, 07 Feb 2018 20:33:27 -0000

glibc is built from oe-core, gcc is from meta-linaro
Although 2017.11 Linaro has gcc 7.2, recipe is only available for 7.1

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 meta-arago-distro/conf/distro/include/toolchain-linaro.inc | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/meta-arago-distro/conf/distro/include/toolchain-linaro.inc b/meta-arago-distro/conf/distro/include/toolchain-linaro.inc
index fd0397d..0a16ee7 100644
--- a/meta-arago-distro/conf/distro/include/toolchain-linaro.inc
+++ b/meta-arago-distro/conf/distro/include/toolchain-linaro.inc
@@ -31,9 +31,9 @@ PREFERRED_PROVIDER_libgcc = "external-linaro-toolchain"
 PREFERRED_PROVIDER_gcc-runtime = "external-linaro-toolchain"
 
 # Set Cross and SDK toolchain preferences
-SDKGCCVERSION ?= "linaro-6.3%"
+SDKGCCVERSION ?= "linaro-7.1%"
 SDKBINUVERSION ?= "linaro-2.27%"
-SDKGLIBCVERSION ?= "2.25%"
+SDKGLIBCVERSION ?= "2.26%"
 SDKLINUXLIBCVERSION ?= "4.9%"
 
 PREFERRED_VERSION_gcc-crosssdk-${SDK_SYS} ?= "${SDKGCCVERSION}"
@@ -49,10 +49,10 @@ PREFERRED_VERSION_nativesdk-glibc-initial ?= "${SDKGLIBCVERSION}"
 
 # Set target toolchain preferences to match Cross/SDK by default
 # Can be overwritten globally, if needed
-GCCVERSION ?= "linaro-6.3%"
+GCCVERSION ?= "linaro-7.1%"
 BINUVERSION ?= "linaro-2.27%"
-GLIBCVERSION ?= "2.25%"
-GLIBCINITVERSION ?= "2.25%"
+GLIBCVERSION ?= "2.26%"
+GLIBCINITVERSION ?= "2.26%"
 LINUXLIBCVERSION ?= "4.9%"
 
 PREFERRED_VERSION_gcc ?= "${GCCVERSION}"
-- 
2.7.4


