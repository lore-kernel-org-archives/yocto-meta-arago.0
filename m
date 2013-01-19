Return-Path: <fcooperjr27@gmail.com>
Received: from mail-ob0-f182.google.com (mail-ob0-f182.google.com
	[209.85.214.182])
	by arago-project.org (Postfix) with ESMTPS id 4E22A52ABB
	for <meta-arago@arago-project.org>;
	Sat, 19 Jan 2013 21:52:48 +0000 (UTC)
Received: by mail-ob0-f182.google.com with SMTP id uo13so45637obb.41
	for <meta-arago@arago-project.org>;
	Sat, 19 Jan 2013 13:52:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references; bh=Rn4na6PZqAahuN+atW2eszxF8ttOWIYerAM3Sr6SESk=;
	b=TC27zInM0Y3/8yc7JHTr4cWotAce6FoZ14p2tuMQr0fsXa4fzO4Ujt2hCFDYCMhjdx
	atXOJKtp84pinnLZvgDZfSrze/64XephR9FaIuD8lwc2NKNZMm4HeNkKZq6U2N1zpc1G
	GgMytKtjKOcx3iid2q3WYGBTVHFDD95UdukgGSmtJA2y4NGhwwkPvgTOO+dhAxQXIEIS
	IxNGvD4qqtfH5gJuiyWIJEsfm6hYNE9hW95Rvn5lklqCuQeTfUmXk0RIq1QFh0Nb6+9l
	AiEW3TT4dxQGr0HdQ7SyRIU2+NA9WPYhTJeaGqFP2+C94Z89sYcRM6GXmm+XgxLO6Nqh
	wUHg==
X-Received: by 10.182.78.228 with SMTP id e4mr10405604obx.77.1358632367648;
	Sat, 19 Jan 2013 13:52:47 -0800 (PST)
Received: from localhost.localdomain (dragon.ti.com. [192.94.94.33])
	by mx.google.com with ESMTPS id b3sm6845496obo.6.2013.01.19.13.52.46
	(version=TLSv1 cipher=RC4-SHA bits=128/128);
	Sat, 19 Jan 2013 13:52:46 -0800 (PST)
From: "Franklin S. Cooper Jr" <fcooperjr27@gmail.com>
To: meta-arago@arago-project.org
Date: Sat, 19 Jan 2013 15:51:51 -0600
Message-Id: <1358632316-12266-26-git-send-email-fcooper@ti.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <1358632316-12266-1-git-send-email-fcooper@ti.com>
References: <1358632316-12266-1-git-send-email-fcooper@ti.com>
Cc: dgerlach <d-gerlach@ti.com>
Subject: [PATCH 26/31] alsa-state: Creating empty asound.conf file
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
X-List-Received-Date: Sat, 19 Jan 2013 21:52:48 -0000

From: dgerlach <d-gerlach@ti.com>

* Default asound.conf file from oe-core was causing various issues.
* Use a blank asound.conf file which was used in old Arago and is known to
  work.
---
 .../recipes-bsp/alsa-state/alsa-state.bbappend     |    4 ++++
 .../recipes-bsp/alsa-state/alsa-state/asound.conf  |    1 +
 2 files changed, 5 insertions(+), 0 deletions(-)
 create mode 100644 meta-arago-distro/recipes-bsp/alsa-state/alsa-state.bbappend
 create mode 100644 meta-arago-distro/recipes-bsp/alsa-state/alsa-state/asound.conf

diff --git a/meta-arago-distro/recipes-bsp/alsa-state/alsa-state.bbappend b/meta-arago-distro/recipes-bsp/alsa-state/alsa-state.bbappend
new file mode 100644
index 0000000..25a9778
--- /dev/null
+++ b/meta-arago-distro/recipes-bsp/alsa-state/alsa-state.bbappend
@@ -0,0 +1,4 @@
+PR_append = "-arago0"
+
+# look for files in this layer first
+FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
diff --git a/meta-arago-distro/recipes-bsp/alsa-state/alsa-state/asound.conf b/meta-arago-distro/recipes-bsp/alsa-state/alsa-state/asound.conf
new file mode 100644
index 0000000..34a5cb8
--- /dev/null
+++ b/meta-arago-distro/recipes-bsp/alsa-state/alsa-state/asound.conf
@@ -0,0 +1 @@
+# default Arago configuration
-- 
1.7.0.4


