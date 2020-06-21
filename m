Return-Path: <pbarker@konsulko.com>
Received: from mail-wr1-f66.google.com (mail-wr1-f66.google.com
	[209.85.221.66])
	by arago-project.org (Postfix) with ESMTPS id 5251C529D1
	for <meta-arago@arago-project.org>;
	Sun, 21 Jun 2020 20:46:38 +0000 (UTC)
Received: by mail-wr1-f66.google.com with SMTP id b6so14645011wrs.11
	for <meta-arago@arago-project.org>;
	Sun, 21 Jun 2020 13:44:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=konsulko.com; s=google;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=p3Msb6RiJHp2Jkrz2hb6hsFonFYfwhoBsfyMzfZ/+VA=;
	b=ppnRmKvu4n+VdX/Jj5Tot/eh8kShHm8FggG4vbL/HbrbhWgxaeNcZjVk/iF3W67hsE
	KPb5ABwSiMugatPQ2A8Gt/k9BL4CGHUqGENiK3yGtwZvSJgnnTyRohVG2/c787jCu/aw
	oH49JzGe1ZBvRgFRB8XRg7BPtFXpPZg3OJNIo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=p3Msb6RiJHp2Jkrz2hb6hsFonFYfwhoBsfyMzfZ/+VA=;
	b=RqBN88yrBSCQplTzt8lVnD4i7HakXsf9FZiilks4d5/EmAS8DB8m+OAAvMjnglnZDU
	/xYqTOuHsaNiS8JPmlL6xs1x6TyMtIRbCbt5Sg9FigNyLvs0Ay4ZX+SxvsOWW32Qoe8t
	eOuNHWWJ4qsbjEbKjz81GdG2RXRsadsUGN6cJrRp4oWszigtxmvH+hYBuIlXgneW0Vb3
	uYU49V/qCBIEuvJIq9A6j2KzrJuKVgQX+7SKJRCWh6b/b2HQTAYaUir601lqyU4ndq4p
	RvdWIngegYIH/n/XBWi78ruq4hQ/Js/aLPqWUsO0q3WOTmEWFLhk/FVL++w7DJidVZFU
	2wfw==
X-Gm-Message-State: AOAM530Nrc7+/FZBfK5a/s023FwPsXL3d2NUEOq98w6P2S1j9hxYT8mD
	C+Ld4qfN8BexMsVYnDfe2852SiOk/T1sjQ==
X-Google-Smtp-Source: ABdhPJw9HgoAtY96L0Nyo2erLmanlMdCsGLrxDPd+McN86Vi/mVpJg9zwTwnPYqtaHz1iKm4kpK5eg==
X-Received: by 2002:adf:fe0e:: with SMTP id n14mr12863265wrr.325.1592772241982;
	Sun, 21 Jun 2020 13:44:01 -0700 (PDT)
Received: from ar2.home.b5net.uk ([213.48.11.149])
	by smtp.gmail.com with ESMTPSA id
	n204sm14871699wma.5.2020.06.21.13.44.00
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sun, 21 Jun 2020 13:44:01 -0700 (PDT)
From: Paul Barker <pbarker@konsulko.com>
To: meta-arago@arago-project.org
Date: Sun, 21 Jun 2020 21:43:49 +0100
Message-Id: <20200621204349.363584-1-pbarker@konsulko.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Subject: [master/dunfell][PATCH] linux: copy-defconfig: Move do_create_srcipk only if defined
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
X-List-Received-Date: Sun, 21 Jun 2020 20:46:38 -0000
Content-Transfer-Encoding: 8bit

Signed-off-by: Paul Barker <pbarker@konsulko.com>
---
 .../recipes-kernel/linux/copy-defconfig.inc              | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/meta-arago-distro/recipes-kernel/linux/copy-defconfig.inc b/meta-arago-distro/recipes-kernel/linux/copy-defconfig.inc
index 10ecf8ea..65b615cb 100644
--- a/meta-arago-distro/recipes-kernel/linux/copy-defconfig.inc
+++ b/meta-arago-distro/recipes-kernel/linux/copy-defconfig.inc
@@ -17,6 +17,9 @@ do_configure_append() {
     fi
 }
 
-# Move create_srcipk task so that the release defconfig is included.
-deltask do_create_srcipk
-addtask create_srcipk after do_configure before do_compile
+python __anonymous() {
+    # Move create_srcipk task so that the release defconfig is included.
+    if d.getVarFlag('do_create_srcipk', "task"):
+        bb.build.deltask('do_create_srcipk', d)
+        bb.build.addtask('do_create_srcipk', 'do_configure', 'do_compile', d)
+}
-- 
2.27.0


