Return-Path: <fcooperjr27@gmail.com>
Received: from mail-oa0-f51.google.com (mail-oa0-f51.google.com
	[209.85.219.51])
	by arago-project.org (Postfix) with ESMTPS id CD59D529D2
	for <meta-arago@arago-project.org>;
	Fri,  5 Oct 2012 06:27:28 +0000 (UTC)
Received: by mail-oa0-f51.google.com with SMTP id n12so1324147oag.38
	for <meta-arago@arago-project.org>;
	Thu, 04 Oct 2012 23:27:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=5QgrERlRwIeYuJ/pcza9icRCyo/feMpNcjrr/N7sFyY=;
	b=Q2452Z+AkTIcSXVM6GdiZwWlV6xzzm3XzWx3sYXJCYr2ifsMbu+k4j/Y9m44Q/B+yA
	A0oGCoGsP3eFxFzNZYFOuTkyTmVnK8a9qS56eOziQeA2O/DS/Gji3esHFvHDghefv3RW
	Js7jooupIu9hJWM6MQxz282U6ozudAJdN7AtmjeCm4tAqDH3iqPKzWw3VYuCCBfbr7DR
	j43iqwrnCHdAqoDU0RiF+lU9pBSzArWgG/FnaF7EvNnLAnvmskSDm+qiJLKG2zr0X0lb
	cfcXbrM+sSb94jxGkHdNpui+i4Ib/gtkOVpQGn6VrmSw50fEBe+MQajC0eEIn7AEeDqH
	E16A==
Received: by 10.60.171.164 with SMTP id av4mr6301962oec.59.1349418448368;
	Thu, 04 Oct 2012 23:27:28 -0700 (PDT)
Received: from localhost.localdomain (dragon.ti.com. [192.94.94.33])
	by mx.google.com with ESMTPS id b7sm5496236oef.12.2012.10.04.23.27.27
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 04 Oct 2012 23:27:27 -0700 (PDT)
From: "Franklin S. Cooper Jr" <fcooperjr27@gmail.com>
To: meta-arago@arago-project.org
Date: Fri,  5 Oct 2012 01:55:50 -0500
Message-Id: <1349420150-22115-1-git-send-email-fcooper@ti.com>
X-Mailer: git-send-email 1.7.0.4
Subject: [PATCH] pulseaudio: Remove console-kit from pulseaudio-module-server
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
X-List-Received-Date: Fri, 05 Oct 2012 06:27:29 -0000

* Remove the required dependency of pulseaudio-module-console-kit
  when using pulseaudio-module-server. Pulseaudio-module-console-kit
  brings in consolekit which can not be built in an non x11 environment.
* Due to X11 not being apart of the DISTRO_FEATURES, recipes such as libx11
  and its dependencies aren't built able.
* pulseaudio-module-server is used by the bluetooth demo.

Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
---
 .../pulseaudio/pulseaudio_2.1.bbappend             |    3 +++
 1 files changed, 3 insertions(+), 0 deletions(-)
 create mode 100644 meta-arago-distro/recipes-multimedia/pulseaudio/pulseaudio_2.1.bbappend

diff --git a/meta-arago-distro/recipes-multimedia/pulseaudio/pulseaudio_2.1.bbappend b/meta-arago-distro/recipes-multimedia/pulseaudio/pulseaudio_2.1.bbappend
new file mode 100644
index 0000000..0ddc49f
--- /dev/null
+++ b/meta-arago-distro/recipes-multimedia/pulseaudio/pulseaudio_2.1.bbappend
@@ -0,0 +1,3 @@
+PR_append = "-arago0"
+
+RDEPENDS_pulseaudio-server := "${@oe_filter_out('pulseaudio-module-console-kit','${RDEPENDS_pulseaudio-server}', d)}"
-- 
1.7.0.4


