Return-Path: <fcooperjr27@gmail.com>
Received: from mail-ob0-f179.google.com (mail-ob0-f179.google.com
	[209.85.214.179])
	by arago-project.org (Postfix) with ESMTPS id 8E0E252A65
	for <meta-arago@arago-project.org>;
	Wed, 10 Oct 2012 19:26:19 +0000 (UTC)
Received: by mail-ob0-f179.google.com with SMTP id lz20so889007obb.38
	for <meta-arago@arago-project.org>;
	Wed, 10 Oct 2012 12:26:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	bh=jSmK8OOlfCIDctxy3i9Vjv9rH6sHwtkoHVYqT9U+yuQ=;
	b=FdM1pzWltOLG3/waAwRbZhhLylNnsixI0vj1iRsTr5csm2Cy1nqs+RaqCXyg4rnou9
	MDQnpSgs4iq5f0U3P8iXzWikCjHqthehaE2A3vGZdziP3eFNVSf+1+yQ8ehSuFt5n8zE
	XMaoFOCnGWaE77zKNOOc0JviCBNmX+ftEG7+KLNdgI0al82xC6zPxjDWSwTBt+XbhMy+
	4d3ryObGSSO0xCIXk7LqavK2m8Ab1+EtXmla+pExBuJr4Mp8Hi7Ktz7D21RFkQA8vRyd
	hrSM2GPcvabmgVafn4T8XwYoUWiwpRBYfVzZ6yaVcvDmCSV2Ff1cb6dO86DFjmegHXGU
	abcQ==
Received: by 10.182.147.8 with SMTP id tg8mr6720107obb.21.1349897179111;
	Wed, 10 Oct 2012 12:26:19 -0700 (PDT)
Received: from localhost.localdomain (dragon.ti.com. [192.94.94.33])
	by mx.google.com with ESMTPS id k8sm1500965oeh.9.2012.10.10.12.26.18
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 10 Oct 2012 12:26:18 -0700 (PDT)
From: "Franklin S. Cooper Jr" <fcooperjr27@gmail.com>
To: meta-arago@arago-project.org
Date: Wed, 10 Oct 2012 14:56:39 -0500
Message-Id: <1349898999-485-2-git-send-email-fcooper@ti.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <1349898999-485-1-git-send-email-fcooper@ti.com>
References: <1349898999-485-1-git-send-email-fcooper@ti.com>
Cc: "Franklin S. Cooper Jr" <fcooper@ti.com>
Subject: [PATCH 2/2] arago.conf: Set preferred u-boot version for am335x
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
X-List-Received-Date: Wed, 10 Oct 2012 19:26:19 -0000

* For now u-boot_am335x-evm version 2011.09-psp04.06.00.08 is not the default
  version of u-boot for am335x. Therefore, a PREFERRED_VERSION needs to be set
  to make sure the Arago SDK picks up the right u-boot

Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
---
 meta-arago-distro/conf/distro/arago.conf |    3 +++
 1 files changed, 3 insertions(+), 0 deletions(-)

diff --git a/meta-arago-distro/conf/distro/arago.conf b/meta-arago-distro/conf/distro/arago.conf
index 1ce64ce..2e5b796 100644
--- a/meta-arago-distro/conf/distro/arago.conf
+++ b/meta-arago-distro/conf/distro/arago.conf
@@ -29,6 +29,9 @@ ARAGO_QT_PROVIDER_armv7a = "qt4-embedded-gles"
 
 PREFERRED_PROVIDER_qt4-embedded = "${ARAGO_QT_PROVIDER}"
 
+# This should be temporary until meta-ti sets this u-boot version as the default
+PREFERRED_VERSION_u-boot_am335x-evm = "2011.09-psp04.06.00.08"
+
 # Pin down udev version from oe-core, as meta-oe pulls in newer systemd-enhanced version
 PREFERRED_VERSION_udev = "164"
 
-- 
1.7.0.4


