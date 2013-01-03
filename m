Return-Path: <fcooperjr27@gmail.com>
Received: from mail-gg0-f174.google.com (mail-gg0-f174.google.com
	[209.85.161.174])
	by arago-project.org (Postfix) with ESMTPS id 8B81B52A62
	for <meta-arago@arago-project.org>;
	Thu,  3 Jan 2013 20:17:55 +0000 (UTC)
Received: by mail-gg0-f174.google.com with SMTP id k2so2453903ggd.19
	for <meta-arago@arago-project.org>;
	Thu, 03 Jan 2013 12:17:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references; bh=Yd8PoTePcYPTVJ0ICjs2xxCVH0mOpe929DtnBGKuWiY=;
	b=HpIY78H/7HT+H6mKF0IObRtv6gsKu3aoNvvk/HzY/cjG9Pt/7UKHrL3GQ5eouBhfkh
	lNffSsiqASrwpa+8O7iV0tQZ7o4FuKL8QVED14wzBCp3/LEcgIMj4Ga2N1kyKkTl+vz4
	4O1wCzV1GA57YaGDZo9Jw4T9bM68bVKiTt79oifbS4cVV5WauxODH5X/tIjMXUCe5Yg0
	HF/rIFZm2XqQyC79JgKFDKNPPZhu2f+8AzEA1NJjgiXPTKLCNT3mB6hXTZr0oYX5TGgy
	R0zIhjWCApoTOAlFZ0zAjS7ZvSVHFrmb2qvC/FE7zkGJtOv0Kxt0QhF1jifyBzy0y6/L
	IVkg==
X-Received: by 10.236.91.173 with SMTP id h33mr52021500yhf.120.1357244275263; 
	Thu, 03 Jan 2013 12:17:55 -0800 (PST)
Received: from localhost.localdomain (dragon.ti.com. [192.94.94.33])
	by mx.google.com with ESMTPS id a9sm38275442anb.6.2013.01.03.12.17.53
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 03 Jan 2013 12:17:54 -0800 (PST)
From: "Franklin S. Cooper Jr" <fcooperjr27@gmail.com>
To: meta-arago@arago-project.org
Date: Thu,  3 Jan 2013 14:17:41 -0600
Message-Id: <1357244261-22829-4-git-send-email-fcooper@ti.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <1357244261-22829-1-git-send-email-fcooper@ti.com>
References: <1357244261-22829-1-git-send-email-fcooper@ti.com>
Cc: "Franklin S. Cooper Jr" <fcooper@ti.com>
Subject: [PATCH 4/4] arago.conf: Set PREFERRED_PROVIDER for udev
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
X-List-Received-Date: Thu, 03 Jan 2013 20:17:55 -0000

* The patch "systemd: update to v189" in meta-oe denzil updates the recipe
  systemd_git.bb to now provide "udev"
* Need to set the PREFERRED_PROVIDER to make sure the "correct" udev is being
  used.

Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
---
 meta-arago-distro/conf/distro/arago.conf |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/meta-arago-distro/conf/distro/arago.conf b/meta-arago-distro/conf/distro/arago.conf
index 1e44e6c..1a59188 100644
--- a/meta-arago-distro/conf/distro/arago.conf
+++ b/meta-arago-distro/conf/distro/arago.conf
@@ -60,6 +60,7 @@ PREFERRED_VERSION_u-boot_am335x-evm = "2012.10-psp05.06.00.00"
 
 # Pin down udev version from oe-core, as meta-oe pulls in newer systemd-enhanced version
 PREFERRED_VERSION_udev = "164"
+PREFERRED_PROVIDER_udev = "udev"
 
 # Set the PREFERRED_PROVIDER for jpeg functionality based on the MACHINE
 # architecture.  For armv7a devices libjpeg-turbo should be used to take
-- 
1.7.0.4


