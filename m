Return-Path: <fcooperjr27@gmail.com>
Received: from mail-yh0-f52.google.com (mail-yh0-f52.google.com
	[209.85.213.52])
	by arago-project.org (Postfix) with ESMTPS id 1214452A8D
	for <meta-arago@arago-project.org>;
	Sun, 17 Feb 2013 22:53:40 +0000 (UTC)
Received: by mail-yh0-f52.google.com with SMTP id q46so876283yhf.25
	for <meta-arago@arago-project.org>;
	Sun, 17 Feb 2013 14:53:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references; bh=e+DZgt1EXvg61qyjACK7K8M+0SodWI3KcvxdP0RNfqs=;
	b=sT3Ir5GzdtDYc8NjErRSO7MHWBpyQra8sRQPo6Dn9wHfZrGHiKa/B5EPq/axsxTu/V
	qTyWlUT9oAY3QuWR8n91AdXa7phyzJmGvmhXkKNbFP/VgGYOvC45xJROMu+1BqNk/7VH
	qzEqlsE6NWQcOizBAjqk7y6pGzVZoCfXWzUiCydvCeMp7HM7a/3H0UiXacgeZg/1u7P5
	IFMEjnsHr3SbP5HQpSuJOCBx/dF/N8e9xs+ubEwXzzzi01qWBu1zVgKTPk18USl1FcmP
	7f4mi0DEt/qXO37oN1HVQkJgP262ei8vc/bZFMvkvGVwkn1W6UZMtS9j26N3bavwvzrs
	Gr4A==
X-Received: by 10.236.136.5 with SMTP id v5mr16688289yhi.49.1361141619691;
	Sun, 17 Feb 2013 14:53:39 -0800 (PST)
Received: from localhost.localdomain (dragon.ti.com. [192.94.94.33])
	by mx.google.com with ESMTPS id s74sm3456861yhh.5.2013.02.17.14.53.37
	(version=TLSv1 cipher=RC4-SHA bits=128/128);
	Sun, 17 Feb 2013 14:53:38 -0800 (PST)
From: fcooperjr27@gmail.com
To: meta-arago@arago-project.org
Date: Sun, 17 Feb 2013 16:53:04 -0600
Message-Id: <1361141595-1687-9-git-send-email-fcooper@ti.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <1361141595-1687-1-git-send-email-fcooper@ti.com>
References: <1361141595-1687-1-git-send-email-fcooper@ti.com>
Cc: "Franklin S. Cooper Jr" <fcooper@ti.com>
Subject: [PATCH 09/20] arago.conf: Set machines to use linux-libc-headers version 2.6.37.2
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
X-List-Received-Date: Sun, 17 Feb 2013 22:53:40 -0000

From: Franklin S. Cooper Jr <fcooper@ti.com>

* Set machines to use linux-libc-headers version 2.6.37.2 if they are using
  an older kernel.

Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
---
 meta-arago-distro/conf/distro/arago.conf |    3 +++
 1 files changed, 3 insertions(+), 0 deletions(-)

diff --git a/meta-arago-distro/conf/distro/arago.conf b/meta-arago-distro/conf/distro/arago.conf
index 22c8a0e..0a1c2a4 100644
--- a/meta-arago-distro/conf/distro/arago.conf
+++ b/meta-arago-distro/conf/distro/arago.conf
@@ -65,6 +65,9 @@ PREFERRED_VERSION_linux-omapl138-psp_am180x-evm = "2.6.37"
 PREFERRED_PROVIDER_virtual/kernel_am180x-evm = "linux-omapl138-psp"
 PREFERRED_VERSION_u-boot_am180x-evm = "2010.12-psp03.21.00.04.sdk"
 
+PREFERRED_VERSION_linux-libc-headers_am180x-evm = "2.6.37.2"
+PREFERRED_VERSION_linux-libc-headers_am37x-evm = "2.6.37.2"
+PREFERRED_VERSION_linux-libc-headers_am3517-evm = "2.6.37.2"
 
 # Pin down udev version from oe-core, as meta-oe pulls in newer systemd-enhanced version
 PREFERRED_VERSION_udev = "164"
-- 
1.7.0.4


