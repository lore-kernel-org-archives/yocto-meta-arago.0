Return-Path: <fcooperjr27@gmail.com>
Received: from mail-oa0-f51.google.com (mail-oa0-f51.google.com
	[209.85.219.51])
	by arago-project.org (Postfix) with ESMTPS id AB11552ACC
	for <meta-arago@arago-project.org>;
	Fri,  5 Oct 2012 20:02:04 +0000 (UTC)
Received: by mail-oa0-f51.google.com with SMTP id n12so2014144oag.38
	for <meta-arago@arago-project.org>;
	Fri, 05 Oct 2012 13:02:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=l6m955SCbnriVcn6AHyNWBQ6msp5GQTwZ34kzekS0SA=;
	b=LK4a1dNFaPMWihVwO7ml5EolnSdDl9Rrod5hliD46Z3uRgR3LZAX9nUpWptNR7gWEM
	uevws3wEdJfqGYm0b59ETMe6LCf91TYy9FX5QOQZjNhJURhuccgkp0JdVRf1mePryi7x
	YJ/Ti2PzHYrXszTWXdZ+/IhfYIi1KpTk1jn+TCYQyIwy3PPjTNk2At761fgsNsdNBAqL
	9/vIyYbkTtkshEndQSPM6BponBmLr7+M2kxRGo0XoctByj+Tnl0ksvhq/GSLs558ZClR
	QezpwzZZ6hhg5ntklh8FM39+Fpjps6+WVxUZ543g7c9sliB+FO4smK4B5SlmmDJOWL2E
	jtGQ==
Received: by 10.60.171.114 with SMTP id at18mr7788692oec.24.1349467323856;
	Fri, 05 Oct 2012 13:02:03 -0700 (PDT)
Received: from localhost.localdomain (dragon.ti.com. [192.94.94.33])
	by mx.google.com with ESMTPS id m3sm9602313obm.21.2012.10.05.13.02.01
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 05 Oct 2012 13:02:02 -0700 (PDT)
From: "Franklin S. Cooper Jr" <fcooperjr27@gmail.com>
To: meta-arago@arago-project.org
Date: Fri,  5 Oct 2012 15:30:34 -0500
Message-Id: <1349469034-8348-1-git-send-email-fcooper@ti.com>
X-Mailer: git-send-email 1.7.0.4
Subject: [PATCH v2] pulseaudio: Remove console-kit from pulseaudio-module-server
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
X-List-Received-Date: Fri, 05 Oct 2012 20:02:05 -0000

* Remove the required dependency of pulseaudio-module-console-kit
  when using pulseaudio-module-server. Pulseaudio-module-console-kit
  brings in consolekit which can not be built in an non x11 environment.
* Due to X11 not being apart of the DISTRO_FEATURES, recipes such as libx11
  and its dependencies aren't buildable.
* pulseaudio-module-server is used by the bluetooth demo.

Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
---
Version 2 changes:
Update typo in commit message.
Added comment about the removal of pulseaudio-module-console-kit

 .../pulseaudio/pulseaudio_2.1.bbappend             |    5 +++++
 1 files changed, 5 insertions(+), 0 deletions(-)
 create mode 100644 meta-arago-distro/recipes-multimedia/pulseaudio/pulseaudio_2.1.bbappend

diff --git a/meta-arago-distro/recipes-multimedia/pulseaudio/pulseaudio_2.1.bbappend b/meta-arago-distro/recipes-multimedia/pulseaudio/pulseaudio_2.1.bbappend
new file mode 100644
index 0000000..2fc3ce6
--- /dev/null
+++ b/meta-arago-distro/recipes-multimedia/pulseaudio/pulseaudio_2.1.bbappend
@@ -0,0 +1,5 @@
+PR_append = "-arago0"
+
+# Removing pulseaudio-module-console-kit which depends on console-kit.
+# Console-kit has x11 dependencies which can't be built do to Arago being a non x11 distro.
+RDEPENDS_pulseaudio-server := "${@oe_filter_out('pulseaudio-module-console-kit','${RDEPENDS_pulseaudio-server}', d)}"
-- 
1.7.0.4


