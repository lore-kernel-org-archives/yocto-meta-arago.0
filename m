Return-Path: <j-stiffler@ti.com>
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
	by arago-project.org (Postfix) with ESMTPS id 7DA7252A7A
	for <meta-arago@arago-project.org>;
	Fri, 17 Aug 2018 14:38:19 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id w7HEcCcI032007
	for <meta-arago@arago-project.org>; Fri, 17 Aug 2018 09:38:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1534516692;
	bh=Ct47OnmuFEBUNojEsgCMaPAdqI9SBGIMyuHqAqpHFvg=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=yD8XWdIo+31N/DGDRkonkzU6fjfKHYzoGyOatTKZAjiIH0zlKuel2cvPUAj/hC1eK
	poHEwvE5znBQIWxoOj+VFnc29xh9oaBEoduprX22I7m+jof88TF3ncV5dmYP14V/VQ
	K/Bd0Kaqq8vRQ9Hzgcdt3HiVxR70H9HbJPutJncA=
Received: from DLEE114.ent.ti.com (dlee114.ent.ti.com [157.170.170.25])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id w7HEcCqq013083
	for <meta-arago@arago-project.org>; Fri, 17 Aug 2018 09:38:12 -0500
Received: from DLEE111.ent.ti.com (157.170.170.22) by DLEE114.ent.ti.com
	(157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1466.3;
	Fri, 17 Aug 2018 09:38:11 -0500
Received: from dflp33.itg.ti.com (10.64.6.16) by DLEE111.ent.ti.com
	(157.170.170.22) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1466.3 via Frontend
	Transport; Fri, 17 Aug 2018 09:38:11 -0500
Received: from udd0866934.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id w7HEbpBY012531;
	Fri, 17 Aug 2018 09:38:10 -0500
From: Jacob Stiffler <j-stiffler@ti.com>
To: <meta-arago@arago-project.org>
Date: Fri, 17 Aug 2018 10:25:53 -0400
Message-ID: <1534515953-32644-4-git-send-email-j-stiffler@ti.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1534515953-32644-1-git-send-email-j-stiffler@ti.com>
References: <1534515953-32644-1-git-send-email-j-stiffler@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [RFC 3/3] arago-prefs: enable SECONDARY_TOOLCHAIN
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
X-List-Received-Date: Fri, 17 Aug 2018 14:38:19 -0000
Content-Type: text/plain

* disable SECONDARY_TOOLCHAIN by default
* For k3, configure the secondary toolchain as armv7a for the R5
  cores.

Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
---
 meta-arago-distro/conf/distro/include/arago-prefs.inc | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta-arago-distro/conf/distro/include/arago-prefs.inc b/meta-arago-distro/conf/distro/include/arago-prefs.inc
index c839c9a..4e3e221 100644
--- a/meta-arago-distro/conf/distro/include/arago-prefs.inc
+++ b/meta-arago-distro/conf/distro/include/arago-prefs.inc
@@ -1,6 +1,9 @@
 # Set preferred Qt5 versions. Different namespace from Qt4, so no conflict
 include conf/distro/include/qt5-versions.inc
 
+SECONDARY_TARGET_ARCH = ""
+SECONDARY_TARGET_ARCH_k3 = "armv7a"
+
 # Use the latest version of ltp-ddt for kernel versions 3.8+
 PREFERRED_PROVIDER_ltp-ddt = "ltp-ddt"
 
-- 
2.7.4


