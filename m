Return-Path: <fcooperjr27@gmail.com>
Received: from mail-ob0-f171.google.com (mail-ob0-f171.google.com
	[209.85.214.171])
	by arago-project.org (Postfix) with ESMTPS id 32C7C52A92
	for <meta-arago@arago-project.org>;
	Sat, 19 Jan 2013 21:52:46 +0000 (UTC)
Received: by mail-ob0-f171.google.com with SMTP id dn14so4821576obc.30
	for <meta-arago@arago-project.org>;
	Sat, 19 Jan 2013 13:52:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references; bh=tlOAURhC/2G/MwjYpvCUfH9aBC9+gGbSpqDma6LFcxc=;
	b=mFqH9K7iQVZ/YnE7VyPmW3uz0RIFFgMGgNteBL6WgS2QgIPRVdsVA5sUuS9xEMcTgC
	bndFHGTDsYKvkIpoTiFCQeK8l4AcIPrEghWAv2OgekLqAOlZZwvr2PNt6eIZ7LXGiore
	KbwvZ++n6JSakhP9Di4zbulQ6IULIrwz3Cep/qSJH7Xlxj9TwNOJ20gdSb2jiNWH+SX2
	ZlmN8ZqgaZdcX70tv7leBgVbZ/ZS0KfwQaYHcjEdowCbAFKV5JOlqOYffaZGvVGk2SUk
	u6n+QdAN2v3VvoJLdEPUtM8iyeieQIjHAlLkH55jYpjdEN1dF14fp3ASpyIAjAqvw1ev
	1l6A==
X-Received: by 10.60.172.113 with SMTP id bb17mr10773561oec.110.1358632365758; 
	Sat, 19 Jan 2013 13:52:45 -0800 (PST)
Received: from localhost.localdomain (dragon.ti.com. [192.94.94.33])
	by mx.google.com with ESMTPS id b3sm6845496obo.6.2013.01.19.13.52.44
	(version=TLSv1 cipher=RC4-SHA bits=128/128);
	Sat, 19 Jan 2013 13:52:44 -0800 (PST)
From: "Franklin S. Cooper Jr" <fcooperjr27@gmail.com>
To: meta-arago@arago-project.org
Date: Sat, 19 Jan 2013 15:51:50 -0600
Message-Id: <1358632316-12266-25-git-send-email-fcooper@ti.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <1358632316-12266-1-git-send-email-fcooper@ti.com>
References: <1358632316-12266-1-git-send-email-fcooper@ti.com>
Cc: "Franklin S. Cooper Jr" <fcooper@ti.com>
Subject: [PATCH 25/31] arago-source-ipk: Create source ipk file for oe-layersetup
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
X-List-Received-Date: Sat, 19 Jan 2013 21:52:46 -0000

Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
---
 .../conf/distro/arago-source-ipk.conf              |    3 +++
 1 files changed, 3 insertions(+), 0 deletions(-)

diff --git a/meta-arago-distro/conf/distro/arago-source-ipk.conf b/meta-arago-distro/conf/distro/arago-source-ipk.conf
index 845e8b8..bbc0662 100644
--- a/meta-arago-distro/conf/distro/arago-source-ipk.conf
+++ b/meta-arago-distro/conf/distro/arago-source-ipk.conf
@@ -309,3 +309,6 @@ SRCIPK_PACKAGE_ARCH_pn-ti-slog = "${MACHINE_ARCH}"
 CREATE_SRCIPK_pn-ti-c674x-aaclcdec = "1"
 SRCIPK_INSTALL_DIR_pn-ti-c674x-aaclcdec = "component-sources/c674x-aaclcdec_${PV}${PVExtra}"
 SRCIPK_PACKAGE_ARCH_pn-ti-c674x-aaclcdec = "${MACHINE_ARCH}"
+
+CREATE_SRCIPK_pn-oe-layersetup = "1"
+SRCIPK_INSTALL_DIR_pn-oe-layersetup = "bin/oe-layersetup"
-- 
1.7.0.4


